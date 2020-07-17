<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String member_pw = (String) session.getAttribute("member_pw");
session.removeAttribute("member_pw");
%>


<jsp:include page="/template/header.jsp"></jsp:include>

<link rel=stylesheet type="text/css" href="<%=request.getContextPath() %>/css/change_pw.css?ver=1">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">


<main>

	<div class="find-wrap">
		<h1>변경할 비밀번호 입력</h1>
		
		<form action="change_pw.do" method="post">
		

<input class="form-change-pw" type="password" name="member_pw" placeholder="비밀번호입력" required> 
<input class="form-change-pw" type="password" name="member_pw" placeholder="비밀번호확인" required>
			<br>
			</div>


			<!--변경버튼-->
			<input class="click-btn" type="submit" value="변경"> <br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<%if(request.getParameter("error") != null){%>
                <div class="row center">
                <font color="#C80A1E">입력하신 로그인 정보가 맞지 않습니다</font>
                </div>
                <%} %>
            
            
         
</form>
</div>

</main>


<jsp:include page="/template/footer.jsp"></jsp:include>