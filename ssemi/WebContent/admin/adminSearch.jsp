<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
   <!-- 임새봄 -->
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리 페이지</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/admin.css">
<script src="<%=request.getContextPath() %>/js/moment.min.js"></script>
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/lightpick.css">
 <script src="<%=request.getContextPath() %>/js/lightpick.js"></script>
<script>
        window.onload = function() {
            var options = {
                //대상 지정
                field: document.querySelector(".picker-start"),

                //두 번째 대상 지정
                secondField: document.querySelector(".picker-end"),

                //날짜 표시 형식 지정
                format: 'YYYY-MM-DD',

                //한 화면에 표시될 달의 개수
                numberOfMonths: 2,

                //시작요일(1:월 ~ 7:일)
                firstDay: 7,

                //자동으로 닫히지 않도록 설정
                //autoclose: false,

                //선택 방향 제어
                selectForward: true,
                selectBackword: false,

            };

            var options2 = {
                //대상 지정
                field: document.querySelector(".picker-str"),

                //두 번째 대상 지정
                secondField: document.querySelector(".picker-finish"),

                //날짜 표시 형식 지정
                format: 'YYYY-MM-DD',

                //한 화면에 표시될 달의 개수
                numberOfMonths: 2,

                //시작요일(1:월 ~ 7:일)
                firstDay: 7,

                //자동으로 닫히지 않도록 설정
                //autoclose: false,

                //선택 방향 제어
                selectForward: true,
                selectBackword: false,
            };

            var picker = new Lightpick(options);
            var picker2 = new Lightpick(options2);
        };
    </script>
 
</head>
<body>

<div class="search-list-wrap">
    <div class="search-wrap">
        <h2 id="stitle">회원 검색</h2>
        <table class="tsearch">
            <tr>
                <th>검색어</th>
                <td><select>
                        <option>이름</option>
                        <option>아이디</option>
                        <option>이메일</option>
                        <option>전화번호</option>
                    </select>
                    <input type="text" name="">
                </td>

            </tr>
            <tr>
                <th>구매금액/건수</th>
                <td><select>
                        <option>총 주문금액</option>
                        <option>총 주문건수</option>
                    </select>
                    <input type="text" name=""> <span>원~</span><input type="text" name=""> <span>원</span>
                </td>

            </tr>
            <tr>
                <th>가입일/기념일</th>
                <td><select>
                        <option>가입일</option>
                        <option>생일</option>
                    </select>
                    <input type="text" class="picker-start"><span>~</span><input type="text" class="picker-end">
                </td>

            </tr>
            <tr>
                <th>주문 상품</th>
                <td>
                    <select>
                        <option>상품명</option>
                        <option>상품코드</option>
                        <option>브랜드</option>
                    </select>
                    <input type="text" name="">
                </td>

            </tr>
            <tr>
                <th>주문결제일</th>
                <td>
                    <select>
                        <option>주문일</option>
                        <option>결제완료일</option>
                    </select>

                    <input type="text" class="picker-str"><span>~</span><input type="text" class="picker-finish">
                </td>

            </tr>

            <tr>
                <th>sms/이메일 수신</th>
                <td>
                    <select>
                        <option>sms</option>
                        <option>이메일 수신</option>
                    </select>

                    <input type="checkbox" id="cb1">
                    <label for="cb1"><span>전체</span></label>


                    <input type="checkbox" id="cb2">
                    <label for="cb2"><span>수신 허용</span></label>

                    <input type="checkbox" id="cb3">
                    <label for="cb3"><span>수신 안함</span></label>
                </td>
            </tr>

        </table>
        <form action="#" method="post">
            <input type="submit" value="검색" class="admin-submit ">
        </form>
    </div>


    <div class="list-wrap">

        <h2 id="Ltitle">회원 목록</h2>
        <p id="listcount">[총 회원수 0명] 검색결과 0건</p>
   
    <div>
        <input type="button" value="회원 삭제" class="listbtn">
    </div>
    <div class="list-table-wrap">
        <table  class="Ltable">
            <tr>
                <th><input type="checkbox"></th>
                <th>이름</th>
                <th>아이디</th>
                <th>등록일</th>
                <th>전화번호</th>
                <th>나이</th>
                <th>관련 내역 보기</th>
            </tr>
            <tr>
                <td><input type="checkbox"></td>
                <td>임새봄</td>
                <td>bbomi</td>
                <td>2020-07-07</td>
                <td>010-3347-5555</td>
                <td>27</td>
                <td>
                    <input type="button" value="주문내역" class="listbtn">
                    <input type="button" value="적립금" class="listbtn">
                </td>

            </tr>
        </table>
    </div>
        
    </div>
</div>







</body>
</html>