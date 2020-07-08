
<%@page import="home.beans.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	MemberDto udto = (MemberDto) session.getAttribute("userinfo");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>홈페이지</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/main.css">
<body>
	<header>
		<div id="container">
			<div id="box_left">
				<ul class="menu side_left">
					<li class="menu_left">커뮤니티
						<ul class="menu_left_innerMenu">
							<li>QnA</li>
							<li>Review</li>
							<li>Event</li>
						</ul>
					</li>
					<li class="menu_left">스토어
						<ul class="menu_left_innerMenu">
							<li>침실가구</li>
							<li>주방가구</li>
							<li>거실가구</li>
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

				<a href="<%=request.getContextPath()%>/index.jsp"> 
				<img width="50px" src="<%=request.getContextPath()%>/img/pig_logo.png">
				</a>
			</div>
			<div id="box_right">
				<ul class="menu side_right">
					<li class="menu_right"><a href="#">로그인</a></li>

					<li class="menu_right"><a
						href="<%=request.getContextPath()%>/member/join.jsp">회원가입</a></li>


					<li class="menu_right"><a href="#">주문/배송</a></li>
					<li class="menu_right"><a href="<%=request.getContextPath()%>/board/cs.jsp">고객센터</a></li>

					<div id="search">
						<form action="#" method="get" style="float: left;">
							<input class="search_box" type="text" placeholder="검색"
								name="search"> <img
								src="<%=request.getContextPath()%>/img/search.png" width="13px"
								style="cursor: pointer" onclick="goSearch()">
						</form>
					</div>
				</ul>
			</div>
		</div>
	</header>