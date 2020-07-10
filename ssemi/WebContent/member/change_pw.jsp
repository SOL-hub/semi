<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<link rel=stylesheet type="text/css"
	href="<%=request.getContextPath()%>/css/change_pw_result.css">
	
	
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
	
		<%String member_pw = (String)session.getAttribute("member_pw");
	session.removeAttribute("member_pw");
	%>
	
	<jsp:include page="/template/header.jsp"></jsp:include>

<form action="change_pw.do" method="post">

<main>
	<div class="find-wrap">
		<h1>내 계정 찾기</h1>

<div class="change-pw">
			<br>
			<h3>변경할 비밀번호 입력</h3>
			<br>
			    <input class = "input-change-pw" type="password" name="member_pw" placeholder="비밀번호입력" required>
			</div>


			<!--변경버튼-->
		<input class="click-btn" type="submit" value="변경"> <br>


		</div>

</main>
</form>

<jsp:include page="/template/footer.jsp"></jsp:include>