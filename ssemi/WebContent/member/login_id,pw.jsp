<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>

<link rel=stylesheet type="text/css"
	href="<%=request.getContextPath()%>/css/login_id,pw.css">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">

<form action="find_id,pw.do" method="post">
	<main>
		<div class="find-wrap">
			<h1>내 계정 찾기</h1>

<div class = "font-find"></div>
		<div class="font-find_id">아이디찾기</div>

			<div class="font-find_pw">비밀번호찾기</div>

</div>
			<!--이름 입력창-->
			<input class="form-find-id" type="text" placeholder="이름"
				required> 
				
				<br>
				
				 <select class="form-phone"
				name="user_phone">
				<option value="">010</option>
				<option value="011">011</option>
				<option value="016">016</option>
				<option value="017">017</option>
				<option value="018">018</option>
				<option value="019">019</option>
			</select> <input class="form-phone" type="phone" required> <input
				class="form-phone" find-id type="phone" required>
		</div>
		<br> <br>
		<br>

		<!--로그인버튼-->
		<input class="click-btn" type="submit" value="아이디 검색"> <br>
	</main>
</form>
