<%@page import="home.beans.dao.MemberDao"%>
<%@page import="home.beans.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="home.beans.dto.QnaDto"%>
<%@page import="home.beans.dao.QnaDao"%>
<%@page import="home.beans.dto.ItemDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<jsp:include page="/template/header.jsp"></jsp:include>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
<head>
<style>
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

/* 본문 박스 */
.qna_box {
	top: 300px;
	margin-top: 100px;
	width: 60%;
	border: 1px solid #333333;
}

.body {
	margin-left: 500px;
	botom: 300px;
	text-align: center;
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

/* Q&A 게시판 본문 */
#title {
	margin: 0 0 20px;
	padding: 40px 0 0;
	font-size: 35px;
	color: #333333;
	display: inline-block
}

#customer .navi>p:nth-child(1) {
	font-size: 17px;
	margin-bottom: 30px;
}

.title_box {
	padding-top: 150px;
}

.qna_box {
	border: 1px solid #333333;
	width: 80%;
}
/* 페이지 네비게이션 */
.page_navi li {
	display: inline-block;
	text-align: center;
}
</style>
</head>
<%
	// 준비물 : 입력값 - type, keyword(둘 다 있으면 검색)
	String type = request.getParameter("type");
	String keyword = request.getParameter("keyword");

	boolean isSearch = type != null && keyword != null;
	QnaDao qdao = new QnaDao();
	List<QnaDto> list;
	if (isSearch) {
		list = qdao.search(type, keyword);
	} else {
		list = qdao.getList();
	}
	
%>

<body>
	<div id="customer">
		<div class="container">
			<div class="head">
				<div class="navi">
					<p class="cs">커뮤니티</p>
					<p class="notice">공지사항</p>
					<p class="qna"><a href="<%=request.getContextPath()%>/board/Qna_list.jsp">Q&A</a></p>
					<p class="event">이벤트</p>
				</div>

				<p class="title">
					<b>상품문의</b>
				</p>
				<p class="title_content">서비스에 대해 궁금한 사항을 문의하세요</p>
			</div>


			<div class="body">
				<!-- 테이블 -->
				<table class="qna_box">
					<thead>
						<tr>
							<th>NO</th>
							<th width="40%">SUBJECT</th>
							<th>WRITER</th>
							<th>DATE</th>
							<!-- 테스트를 위해 항목 3개를 추가 -->

						</tr>
					</thead>
					<tbody align="center">
	
					<%
					for(QnaDto qdto2 : list) { 
						// mdto에서 writer가져오기
						//String member_id=qdao.getWriter(25);
						
						// qna작성자를 표기하고 싶다면 회원 정보 필요
						
						MemberDao mdao = new MemberDao();
						MemberDto mdto = mdao.get(qdto2.getQna_writer()); // qna_no로 회원아이디 조회

					%>

						<tr>
							<td><%=qdto2.getQna_no() %></td>
							<td><a href="Qna_content.jsp?qna_no=<%=qdto2.getQna_no()%>"><%=qdto2.getQna_title() %></a></td>
							<td><%=mdto.getMember_id()%></td>
							<td><%=qdto2.getQna_date() %></td>
						</tr>
						<%} %>
					</tbody>

					<tfoot>
						<tr>
							<td colspan="8" align="right"><a href="Qna_write.jsp"> <input type="button" value="WRITE">
								</a>
							</td>
						</tr>
					</tfoot>
				</table>


				<!-- 검색창 -->
				<form action="qna.jsp" method="get">
					<!-- 검색분류 -->
					<select name="type">
						<option value="Qna_title">제목만</option>
						<option value="Qna_writer">글작성자</option>
					</select>

					<!-- 검색어 -->
					<input type="text" name="keyword" required>

					<!-- 전송버튼 -->
					<input type="submit" value="검색">
				</form>

			</div>
		</div>

		<div>
			<ul class="page_navi">
				<li>이전</li>
				<li>1</li>
				<li>2</li>
				<li>다음</li>
			</ul>
		</div>

	</div>
</body>
</html>
<jsp:include page="/template/footer.jsp"></jsp:include>