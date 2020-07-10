<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>

<link rel=stylesheet type="text/css"
	href="<%=request.getContextPath()%>/css/find_id.css">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">

<form action="find_id,pw.do" method="post">
	<main>
		<div class="find-wrap">
			<h1>내 계정 찾기</h1>

			<div class="font-find"></div>
			<div class="font-find_id">아이디찾기</div>


			<div class="font-find_pw">
				<a href="check_pw.jsp">비밀번호변경</a>
			</div>

		</div>

		<input class="form-find-id" type="text" name="member_name"
			placeholder="이름" required> <input class="form-find-id"
			type="text" name="member_phone" placeholder="전화번호" required>

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

		<br> <br>

		<!-- 에러에 대한 처리 -->
		<%
			if (request.getParameter("error") != null) {
		%>
		<h6>
			<font color="red">해당하는 정보로 아이디를 찾지 못했습니다.</font>
		</h6>
		<%
			}
		%>



		<!--로그인버튼-->
		<input class="click-btn" type="submit" value="아이디 검색"> <br>
	</main>

</form>
<jsp:include page="/template/footer.jsp"></jsp:include>