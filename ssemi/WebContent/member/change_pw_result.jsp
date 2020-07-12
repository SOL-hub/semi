<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>


<link rel=stylesheet type="text/css"
	href="<%=request.getContextPath()%>/css/change_pw_result.css">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">

<main>
	<div class="find-wrap">
		<h1>내 계정 찾기</h1>


		<div class="center">

			<br>
			<h3>비밀번호 변경이 완료되었습니다</h3>
			<br>
			
			<div class="change_after">
				<a href="<%=request.getContextPath()%>/member/user_info.jsp"> <input class="click-btn2" type="submit"
					value="내 정보보기"></a>
			</div>


			<div class="change_after">
				<a href="<%=request.getContextPath()%>/member/shopBarket2.jsp"> <input
					class="click-btn2" type="submit" value="내 장바구니"></a>
			</div>

			<div class="change_after">
				<a href="<%=request.getContextPath()%>"> <input
					class="click-btn2" type="submit" value="내 견적보러가기"></a>
			</div>
			
			<div class="change_after">
				<a href="<%=request.getContextPath()%>/member/check_pw.jsp?go=user_out.jsp"> 
				<input class="click-btn2" type="submit" value="회원탈퇴"></a>
			</div>

</div>
		</div>

</main>


<jsp:include page="/template/footer.jsp"></jsp:include>