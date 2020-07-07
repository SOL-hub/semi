
<%@page import="home.beans.dao.MemberDao"%>
<%@page import="home.beans.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>




<jsp:include page="/template/header.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link rel=stylesheet type="text/css" href="<%=request.getContextPath() %>/css/base.css">
    <link rel=stylesheet type="text/css" href="<%=request.getContextPath() %>/css/join.css">
    <style>

    </style>
    
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        function findAddress() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if (data.userSelectedType === 'R') {
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if (data.buildingName !== '' && data.apartment === 'Y') {
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if (extraAddr !== '') {
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        // document.getElementById("sample6_extraAddress").value = extraAddr;

                    } else {
                        // document.getElementById("sample6_extraAddress").value = '';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.querySelector("input[name=member_post]").value = data.zonecode;
                    //document.getElementById('sample6_postcode').value = data.zonecode;

                    document.querySelector("input[name=member_base_addr]").value = addr;
                    //document.getElementById("sample6_address").value = addr;

                    // 커서를 상세주소 필드로 이동한다.
                    document.querySelector("input[name=member_extra_addr]").focus();
                    //document.getElementById("sample6_detailAddress").focus();
                    
                    
                }
            }).open();
        }
    </script>
 
    <script>
        function check_id() {
            var check_user_id = document.querySelector("input[name=member_id]").value;

            var check_id = document.querySelector(".check_id")

            var regex = /^[a-z0-9]{6,15}$/gi;
            var idRegx = regex.test(check_user_id);

            check_id.classList = "check_id";


            if (check_user_id == "") {
                check_id.textContent = "6 ~ 15자리 이내로 입력해주세요";

                return check_user_id;
            }

            if (idRegx) {
                check_id.classList.add("ok");
                check_id.textContent = "정상적인 아이디";

            } else {
                check_id.classList.add("no");
                check_id.textContent = "아이디형식을 확인하여주세요";

            }
        }
        
            function check_pw() {
                var check_user_pw =document.querySelector("input[name=member_pw]").value;
                
                var check_pw = document.querySelector(".check_pw");
                
                var regex =  /^[a-zA-Z0-9!-):-@]{8,15}$/g


                var pwRegx = regex.test(check_user_pw);
                
                check_pw.classList = "check_pw";
                
                if(check_user_pw==""){
                    check_pw.textContent = "8자리 ~ 15자리 이내로 입력해주세요";
                    return check_user_pw;
                }
                
                if(pwRegx){
                    check_pw.classList.add("ok");
                    check_pw.textContent = "정상적 비밀번호"
                }
                else{
                    check_pw.classList.add("no");
                    check_pw.textContent = "비밀번호 형식을 확인해주세요."
                }
                
            }
        
        function check_pw_comp(){
            var check_pw = document.querySelector("input[name=member_pw]").value;
            var check_pw_again = document.getElementById("check_pw_again").value;
            var check_pw_comp = document.querySelector(".check_pw_comp");
            
            var isCheckPw= check_pw == check_pw_again;
            
            check_pw_comp.classList = "check_pw_comp";
            
            if(check_pw_again==""){
                check_pw_comp.textContent = "";
                return check_user_pw;
            }
            else{
            	
            	if(!isCheckPw){
                    alert("비밀번호가 일치하지 않습니다");
                    check_pw_comp.classList.add("no");
                    check_pw_comp.textContent = "비밀번호가 일치하지 않습니다"
                    
                    return false;
                }
                else{
                	check_pw_comp.classList.add("ok");
                    check_pw_comp.textContent = "비밀번호가 일치합니다"          
                }
            }
            
            
        }
        
    </script>
</head>

<body  onload="cursor.userId.focus()">
    <main>
        <article class="w-100">
           <form name="cursor"action="join.do" onsubmit="return check_pw_comp();" method="post" >
                <div class="row-empty"></div>
                <div class="row-empty"></div>
                <div class="center head">
                    회원가입
                </div>
                <div class="row-empty"></div>
                <div class="row-empty"></div>
                <div class="line-bottom center">
                    <ul>
                        <li>가입</li>
                        <li>약관동의</li>
                        <li>정보입력</li>
                        <li>가입완료</li>
                    </ul>
                    <div class="row-empty"></div>
                </div>
                <div class="row-empty"></div>
                <div class="row-empty"></div>
                <div class="row-empty">
                    <p>
                        <input id="userId"name="member_id" class="id-input" type="text" placeholder="아이디" required oninput="check_id();">
                        <span class="check_id">
                            6 ~ 15자리 이내로 입력해주세요
                        </span>
                    </p>

                </div>
                <div class="row-empty"></div>
                <div class="row-empty"></div>
                <div class="right">
                    <input class="overlap-btn" type="button" value="중복확인">
                </div>
                <div class="row-empty">
                    <p>
                        <input name="member_pw" class="pw-input" type="password" placeholder="비밀번호" required oninput="check_pw();">
                        <span class="check_pw">
                            8자리 ~ 15자리 이내로 입력해주세요
                        </span>
                    </p>
                </div>

                <div class="row-empty"></div>
                <div class="row-empty"></div>
                <div class="row-empty">
                    <p>
                        <input id="check_pw_again" class="pw-input" type="password" placeholder="비밀번호 확인" required onblur="check_pw_comp();">
                        <span class="check_pw_comp"></span>
                    </p>
                </div>
                <div class="row-empty"></div>
                <div class="row-empty"></div>
                <div class="row-empty explan right">
                    <font color="red">※ 비밀번호는 8~15자의 영문, 숫자, 특수문자 조합</font>
                </div>
                <div class="row-empty"></div>
                <div class="row-empty"></div>
                <div class="row-empty"></div>
                <div class="row-empty">
                    <p>
                        <input name="member_name" class="id-input" type="text" placeholder="이름" required>
                    </p>
                </div>
                <div class="row-empty"></div>
                <div class="row-empty"></div>

                <div class="row-empty">
                    <p>
                        <input name="member_nick" type="text" class="id-input" placeholder="닉네임" required>
                    </p>
                </div>
                <div class="row-empty"></div>
                <div class="row-empty"></div>
                <div class="row-empty"></div>
                <div class="row-empty">
                    <p>
                        <input name="member_birth" type="date" class="input-calendar" max="9999-12-31">
                    </p>
                </div>
                <div class="row-empty"></div>
                <div class="row-empty"></div>
                <div class="row-empty"></div>
               
                <div class="row-empty"></div>
                <div class="row-empty">
                    <p>
                        <input name="member_phone" class="phone-input" type="text" placeholder="핸드폰번호( - 제외입력)">
                    </p>
                </div>
                <div class="row-empty"></div>
                <div class="row-empty"></div>
                <div class="row-empty">
                    <p>
                        <input name="member_email" class="phone-input" type="email" placeholder="이메일">
                    </p>
                </div>
                <div class="row-empty"></div>
                <div class="row-empty"></div>
                <div class="row-empty"></div>
                <div class="row-empty">
                    <p>
                        <input name="member_post" class="addr-input" type="text" placeholder="우편번호">
                    </p>
                </div>
                <div class="row-empty"></div>
                <div class="row-empty"></div>

                <div class="row-empty right">
                    <input type="button" class="addr-btn" onclick="findAddress();" value="주소검색">
                </div>
                <div class="row-empty"></div>
                <div class="row-empty"></div>
                <div class="row-empty">
                    <p>
                        <input name="member_base_addr" class="addr-input" type="text" placeholder="주소입력">
                    </p>
                </div>
                <div class="row-empty"></div>
                <div class="row-empty"></div>
                <div class="row-empty">
                    <p>
                        <input name="member_extra_addr" class="addr-input" type="text" placeholder="상세주소입력">
                    </p>
                </div>
                <div class="row-empty"></div>
                <div class="row-empty"></div>
                <div class="row-empty"></div>
                <div class="row-empty"></div>
                <div class="row-empty center">
                    <a href="<%=request.getContextPath()%>">
                        <button class="join-btn">처음으로</button>
                    </a>
                     
                    <input type="submit" class="join-btn2" value="회원가입">
                    
                </div>
            </form>
        </article>
		
    </main>
</body></html>
<jsp:include page="/template/footer.jsp"></jsp:include>    