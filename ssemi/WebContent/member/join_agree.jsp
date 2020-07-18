<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <jsp:include page="/template/header.jsp"></jsp:include>  
 <link

	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@300&display=swap"

	rel="stylesheet">

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link rel=stylesheet type="text/css" href="<%=request.getContextPath() %>/css/base.css">
    <link rel=stylesheet type="text/css" href="<%=request.getContextPath() %>/css/join_agree.css">
    <style>
       * {
	box-sizing: border-box;
	margin: 0px;
	padding: 0px;
	font-family: 'Noto Sans KR', sans-serif;
	letter-spacing: -1.5px;
}
    </style>
    <script>
    function checkAgree(){
        var check_A = document.querySelector(".checkbutton").checked;
        
        if(!check_A){
            alert("약관에 동의해주세요");
            
            return false;
        }
        else{
           location.href="join.jsp";

        }
    }
    </script>
</head>
<body>
    <main style="margin-top:150px;">
        <article>
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
            <div class="row-empty center small-font">약관동의</div>
            <div class="row-empty"></div>
            <div class="row-empty center">
                <textarea class="ssmall-font" readonly>  
           약관에 동의하셔야 서비스 이용이 가능합니다. 성명,휴대폰번호,배송정보(주문자 및 수취인 주소, 수취인명, 수취인연락처 등), 결제정보(계좌정보,신용카드정보,환불 계좌정보, 현금영수증 발행여부 등) 등의 개인정보 확인지침도 확인해주세요.
            </textarea>
            </div>
            
            <div class="row-empty down"></div>
           
            <div class="row-empty">
                <input type="checkbox" class="checkbutton">동의합니다
            </div>
            <div class="row-empty"></div>
            
            <div class="center">
            <a href="<%=request.getContextPath()%>">
             <button class="agree-btn2">처음으로</button>
             </a>
                 <button class="agree-btn" onclick="checkAgree();">
                 동의하고 회원가입
                 </button>
            </div>     
        </article>
    </main>
</body>
</html>
  <jsp:include page="/template/footer.jsp"></jsp:include> 