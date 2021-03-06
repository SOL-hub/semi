<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원아이디찾기 페이지</title>


<link
   href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@300&display=swap"
   rel="stylesheet">
<link rel="stylesheet" type="text/css"
   href="<%=request.getContextPath()%>/css/login.css">
	
</head>
<body>
<!--  <div style=padding-top:50px;>-->
		<main class="login-main">
	<!--<div style=padding-top:150px;>  -->	
		<form action="find_id,pw.do" method="post">
		<div class="login-wrap">
			<h1>내 계정 찾기</h1>

			 <!--아이디/비밀번호찾기-->
			<div class="login2-submint">아이디찾기</div>

			<div class="login2-submint" align="left">
				<a href="check_pw.jsp">비밀번호변경</a></div>

		

		<!--아이디/비밀번호입력창-->
    <input class = "login-id" type="text" name="member_name" placeholder="이름입력" required>
    <input class = "login-pw" type="text" name="member_phone" placeholder="전화번호입력" required>

		<!-- <select class="form-phone" name="user_phone">
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="016">016</option>
				<option value="017">017</option>
				<option value="018">018</option>
				<option value="019">019</option>
			</select> 
			<input class="form-phone" type="text" required> 
			<input class="form-phone" type="text" required>-->

		<br>

		<!-- 에러에 대한 처리 -->
		<%
			if (request.getParameter("error") != null) {
		%>
		<h5>
			<font color="#C80A1E">해당하는 정보로 아이디를 찾지 못했습니다.</font>
		</h5>
		<%
			}
		%>



		<!--로그인버튼-->
		<input class="login-submit" type="submit" value="아이디 검색"> <br>
		</form>
	</main>
	</body>
	</html>
	
	
<jsp:include page="/template/footer.jsp"></jsp:include>
 