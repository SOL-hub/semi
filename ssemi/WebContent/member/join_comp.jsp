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
    <link rel=stylesheet type="text/css" href="<%=request.getContextPath() %>/css/join_comp.css">
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
    
    </script>
</head>
<body>
    <main>
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
            <div class="row-empty"></div>
            <div class="row-empty"></div>
            <div class="row-empty"></div>
            
            <div class="center middle-font">
                회원가입이 완료되었습니다
            </div>
            <div class="row-empty"></div>
            <div class="row-empty"></div>
            <div class="center small-font">
                
            </div>
            <div class="row-empty small-font"></div>
            <div class="center">
                
            </div>
            <div class="row-empty"></div>
            <div class="row-empty"></div>
            <div class="row-empty"></div>
            
            <div class="center">
            	<a href="<%=request.getContextPath() %>">
                <button class="join-btn" >홈으로</button>
                </a>
            </div>
            <div class="row-empty"></div>
            <div class="row-empty center">
            <a href="login.jsp">
                <button class="join-btn2" >로그인</button>
            </div>
            <div class="row-empty"></div>
            
        </article>
    </main>
</body>
</html>
  <jsp:include page="/template/footer.jsp"></jsp:include> 