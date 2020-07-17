<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 로그인 페이지</title>
<link
   href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@300&display=swap"
   rel="stylesheet">
<link rel="stylesheet" type="text/css"
   href="<%=request.getContextPath()%>/css/login.css">

</head>
<body>

<main class="login-main" style=padding-top:200px;>
 <form action="login.do" method="post">
 <div class = "login-wrap">
  <div class="loginT">로그인</div>
  
   
   
   <!--아이디/비밀번호입력창-->
    <input class = "login-id" type="text" name="member_id" placeholder="아이디입력" required>
    <input class = "login-pw" type="password" name="member_pw" placeholder="비밀번호입력" required>

 
  <input type="checkbox" id="cb1">
    <label for="cb1">
    <span class="login-memory">아이디 저장</span>
    </label>
    
     <input class="login-submit" type="submit" value="로그인">
     
     
      <%if(request.getParameter("error") != null){%>
                <div class="row center">
                <font color="#C80A1E">입력하신 로그인 정보가 맞지 않습니다</font>
                </div>
                <%} %>
              </div>
                </div>
                
  
    <!--신규 회원가입버튼-->
    <div class="login2-submint">
    <a href="join_main.jsp">신규 회원가입</a></div>
    
   
    
    <!--아이디, 비밀번호찾기버튼-->
   <div class="login2-submint">
    <a href="find_id,pw.jsp">아이디, 비밀번호 찾기</a>
    
    </div>
   </form>
   </main>
   
    </body>
    </html>
<jsp:include page="/template/footer.jsp"></jsp:include>