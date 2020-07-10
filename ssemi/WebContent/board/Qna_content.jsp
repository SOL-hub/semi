<%@page import="home.beans.dto.QnaDto"%>
<%@page import="home.beans.dao.QnaDao"%>
<%@page import="home.beans.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
<!DOCTYPE html>
<html>
<head>
<style>
* {
	box-sizing: border-box;
	margin: 0px;
	padding: 0px;
	font-family: 'Noto Sans KR', sans-serif;
	letter-spacing: -1.5px;
}

* {
	box-sizing: border-box;
	margin: 0px;
	padding: 0px;
	font-family: 'Noto Sans KR', sans-serif;
	letter-spacing: -1.5px;
}

/* 상단 콘텐츠 */
.head {
	padding-top: 150px;
	height: 180px;
	position: relative;
	width: 730px;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

.navi {
	font-size: 14px;
	color: #909090;
	top: 150px;
	left: -220px;
	border: 1px solid #AAA;
	position: absolute;
	width: 120px;
	padding: 30px 20px 30px 20px;
	text-align: left;
	display: inline-block;
	cursor: pointer;
}

/*사이드바 내 카테고리ㅣ */
.navi p {
	font-size: 13px;
	color: #AAAAAA;
}

#customer .navi>.cs {
	color: #333333;
	font-size: 17px;
	margin-bottom: 30px;
}

/* Q&A 제목 */
.head_center>.title {
	text-align: center;
	font-size: 50px;
	margin-bottom: 20px;
	padding-top: 40px;
}

/* 사이드바 - 제목(고객센터) */
#customer.navi>p:nth-child(1) {
	font-size: 17px;
	margin-bottom: 30px;
	color: #333333;
}

.body .qna_box p {
	font-size: 13px;
	color: #AAAAAA;
}

/*전체 테이블 */
.body {
width="80%";
margin="auto";

}
/*내용 제목*/
.content_content {
height="300";
}


</style>
<script></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<%
int qna_no = Integer.parseInt(request.getParameter("qna_no"));
QnaDao qdao = new QnaDao();
QnaDto qdto = qdao.get(qna_no);
%>

<body>

	<div id="customer">
		<div class="container">
			<div class="head">
				<div class="navi">
					<p class="cs">커뮤니티</p>
					<p class="notice">공지사항</p>
					<p class="qna">Q&A</p>
					<p class="event">이벤트</p>
				</div>

				<p class="title">
					<b>상품문의</b>
				</p>
			</div>
			<div class="body">
				<table class="body_table" border="1">
					<tbody>
						<tr class="content">
							<td><%=qdto.getQna_title()%></td>
						</tr>
						<tr class="content">
							<td><%=qdto.getQna_writer()%></td>
						</tr>
						<tr class="content">
							<td><%=qdto.getQna_date()%></td>
						</tr>
						<tr class="content_content">
							<td><%=qdto.getQna_content()%></td>
						</tr>

					</tbody>
				</table>
			</div>
		</div>
	</div>

</body>
</html>
<jsp:include page="/template/footer.jsp"></jsp:include>