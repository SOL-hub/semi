<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<link rel=stylesheet type="text/css"
	href="<%=request.getContextPath()%>/css/change_pw.css">


<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">

<%
	String member_pw = (String) session.getAttribute("member_pw");
session.removeAttribute("member_pw");
%>

<jsp:include page="/template/header.jsp"></jsp:include>


<main>
	<div class="find-wrap">
		<h1>변경할 비밀번호 입력</h1>
		<form action="change_pw.do" method="post">
			
			<div class="change-pw">

				<br> <input class="input-change-pw" type="password"
					name="member_pw" placeholder="비밀번호입력" required> <input
					class="input-change-pw" type="password" name="member_pw"
					placeholder="비밀번호확인" required>
			</div>


			<!--변경버튼-->
			<input class="click-btn" type="submit" value="변경"> <br>
	
</form>
</div>
</main>


<jsp:include page="/template/footer.jsp"></jsp:include>