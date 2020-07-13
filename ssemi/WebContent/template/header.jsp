<%@page import="home.beans.dto.ItemDto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="home.beans.dao.ItemDao"%>
<%@page import="home.beans.dto.MemberDto"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	MemberDto udto = (MemberDto) session.getAttribute("userinfo");

//상품 검색 : item_type 유형 검색어 입력
String keyword = request.getParameter("keyword");
// 이 검색어를 활용하여 '상품 목록' 불러오기
ItemDao idao = new ItemDao();
if (keyword == null) {
	List<ItemDto> list = new ArrayList<>();

} else {
	List<ItemDto> list = idao.search(keyword);
}
%>

<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<title>홈페이지</title>
<!-- <link rel="stylesheet" type="text/css"
   href="<%=request.getContextPath()%>/css/main.css">-->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/main.css">
</head>


<body>

	<header>
		<div id="container">
			<div id="box_left">
				<ul class="menu side_left">
					<li class="menu_left">커뮤니티
						<ul class="menu_left_innerMenu">
							<li>QnA</li>
							<li>Review</li>
							<li><a href="<%=request.getContextPath()%>/event/event.jsp">Event</a></li>
						</ul>
					</li>
					<li class="menu_left">스토어
						<ul class="menu_left_innerMenu">
							<li>침실가구</li>
							<li>주방가구</li>
							<li>소파/거실가구</li>
							<li>욕실가구</li>
						</ul>
					</li>
					<li class="menu_left">인테리어 시공
						<ul class="menu_left_innerMenu">
							<li>마루</li>
							<li>주방</li>
							<li>욕실</li>
						</ul>
					</li>
				</ul>
			</div>
			<div class="menu_logo">
				<a href="<%=request.getContextPath()%>"> <img width="50px"
					src="<%=request.getContextPath()%>/img/pig_logo.png">
				</a>
			</div>



			<!-- 로그인/로그아웃 상황에맞게 설정 -->

			<%
				MemberDto mdto = (MemberDto) session.getAttribute("userinfo");
				boolean isLogin = mdto != null;
			%>

			<%
				if (isLogin && mdto.getMember_auth().equals("관리자")) {
			%><!--관리자 일때 로그인 -->

			<div id="box_right">
				<ul class="menu side_right">


					<li class="menu_right"><a
						href="<%=request.getContextPath()%>/member/logout.do">로그아웃</a></li>
					<li class="menu_right"><a href="<%=request.getContextPath()%>/admin/admin_search.jsp">관리메뉴</a></li>
					<li class="menu_right"><a href="#">고객센터</a></li>


				</ul>




				<%
					} else if (isLogin) {
				%><!-- 회원일 때-->


				<div id="box_right">
					<ul class="menu side_right">


						<li class="menu_right"><a
							href="<%=request.getContextPath()%>/member/logout.do">로그아웃</a></li>
						<li class="menu_right"><a href="#">마이페이지</a></li>
						<li class="menu_right"><a href="#">주문/배송 조회</a></li>
						<li class="menu_right"><a href="#">장바구니</a></li>
						<li class="menu_right"><a href="#">회원탈퇴</a></li>


						<li class="menu_right"><a href="#">주문/배송</a></li>
						<li class="menu_right"><a href="#">고객센터</a></li>

					</ul>
					<%
						} else {
					%>
					<!-- 로그아웃 -->
					<div id="box_right">
						<ul class="menu side_right">
							<li class="menu_right"><a
								href="<%=request.getContextPath()%>/member/login.jsp">로그인</a></li>
							<li class="menu_right"><a
								href="<%=request.getContextPath()%>/member/join_main.jsp">회원가입</a></li>
							<li class="menu_right"><a href="#">주문/배송</a></li>
							<li class="menu_right"><a href="#">고객센터</a></li>
						</ul>

						<%
							}
						%>

						<div id="search">
							<form class="search_set"
								action="<%=request.getContextPath()%>/shop/product_bed_list.jsp"
								method="get" style="float: left;">
								<input class="search_box" type="text" placeholder="검색"
									name="keyword" required> <input type="image"
									src="<%=request.getContextPath()%>/img/search.png"
									style="width: 20px;">
							</form>
						</div>

					</div>
				</div>
			</div>
		</div>
	</header>