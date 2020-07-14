<%@page import="home.beans.dto.QnaWithMemberDto"%>
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
.page_navi {
	margin-top: 60px;
	text-align: center;
}
.page_navi li {
display:inline-block;
}
.navi_num {
	letter-spacing : 1.5px;
	font-size:13px;
}
.navi_img {
padding-top:5px;

}
</style>
</head>
<%
	// 준비물 : 입력값 - type, keyword(둘 다 있으면 검색)
	String type = request.getParameter("type");
	String keyword = request.getParameter("keyword");

	boolean isSearch = type != null && keyword != null;
	QnaDao qdao = new QnaDao();
	
	// 페이지네비게이션
	int pageSize=15;
	
	// 오류값 -> 1 / 멀쩡한 값O
	String pageStr = request.getParameter("page");
	int pageNo;
	try {
		pageNo = Integer.parseInt(pageStr);
		if(pageNo<=0) {
			throw new Exception(); 
		}
	}
		catch(Exception e) {
			pageNo=1;
		}
		
		//시작 글 순서와 종료 글 순서를 계산
		int finish = pageNo * pageSize;
		int start = finish - (pageSize - 1);
		
		//////////////////////////////////////////////////////////////////
		// 페이지 네비게이터 계산 코드
		//////////////////////////////////////////////////////////////////
		int blockSize = 10;//이 페이지에는 네비게이터 블록을 10개씩 배치하겠다!
		int startBlock = (pageNo - 1) / blockSize * blockSize + 1;
		int finishBlock = startBlock + blockSize - 1;

		//		(주의!) 다음 버튼의 경우 계산을 통하여 페이지 개수를 구해야 출력 여부 판단이 가능
		int count;		//	목록 개수 or 검색 개수
		if(isSearch) {		//		검색
			count=qdao.getCount(type, keyword);
		} 
		else {		//		목록
			count=qdao.getCount();
		}
		int pageCount=(count+pageSize-1)/pageSize;
		//	만약 finishBlock이 pageCount보다 크다면 수정해야 한다
		if(finishBlock>pageCount) {
			finishBlock=pageCount;
		}
	
		List<QnaWithMemberDto> list;
		if (isSearch) {
		//	MemberDao user_mdao = new MemberDao();
		//	MemberDto user_mdto = user_mdao.idCheck(keyword);			
			list = qdao.search(type, keyword, start, finish);
		} else {
			list = qdao.getList(start, finish);
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
					for(QnaWithMemberDto qmdto2 : list) { 
						// mdto에서 writer가져오기
						//String member_id=qdao.getWriter(25);
						
						// qna작성자를 표기하고 싶다면 회원 정보 필요
						
						MemberDao mdao = new MemberDao();
						MemberDto mdto = mdao.get(qmdto2.getQna_writer()); // qna_no로 회원아이디 조회

					%>

						<tr>
							<td><%=qmdto2.getQna_no() %></td>
							<td align="left">
							
												<!-- 
						답글은 띄어쓰기 구현
						- 답글인 경우는 super_no > 0 , depth > 0 
					-->
					<%if(qmdto2.getDepth() > 0){ %>
						<%for(int i=0; i < qmdto2.getDepth(); i++){ %>
							&emsp;
						<%} %>
						<img src="<%=request.getContextPath()%>/img/reply.png" width="20" height="15">
					<%} %>
						<a href="Qna_content.jsp?qna_no=<%=qmdto2.getQna_no()%>"><%=qmdto2.getQna_title() %>
						</a></td>
							<td><%=mdto.getMember_id()%></td>
							<td><%=qmdto2.getQna_autotime() %></td>
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
	
				<form action="Qna_list.jsp" method="get">
					<!-- 검색분류 -->
					<select name="type">
						<option value="qna_writer">WRITER</option>
					</select>

					<!-- 검색어 -->
					<input type="text" name="keyword" required>

					<!-- 전송버튼 -->
					<input type="submit" value="SEARCH">
				</form>

			</div>
		</div>
		<!--  네이게이터  -->
		<div class="navi_box">
			<ul class="page_navi">

				<!-- 이전 -->
				<li >
				<%if(!isSearch) {%>
						<a href="Qna_list.jsp?page=<%=startBlock-1%>">
								<img src="<%=request.getContextPath()%>/img/back.png" width="15" height="13" class="navi_img">	
						</a>
					<%} else { %>
						<a href="Qna_list.jsp?page=<%=startBlock-1 %>&type=<%=type %>&keyword=<%=keyword%>">
								<img src="<%=request.getContextPath()%>/img/back.png" width="15" height="13" class="navi_img">	
						</a>
					<%} %>
					
					</li>
					
						<!-- 네비게이터 숫자 부분 -->
						<li >
						<%for(int i=startBlock; i<=finishBlock;i++) {%>
						
						<%if(!isSearch) {%>
							<a href = "Qna_list.jsp?page=<%=i %>" class=navi_num><%=i %></a>
							<%} else { %>
								<a href="Qna_list.jsp?page=<%=i %>&type=<%=type %>&keyword=<%=keyword %>" class=navi_num><%=i %></a>
							<%} %>			
						<%} %>
						</li>
						
					<!-- 다음 -->
					<li>
					<%if(!isSearch) {%>
						<a href="Qna_list.jsp?page=<%=finishBlock+1%>" >
								<img src="<%=request.getContextPath()%>/img/forward.png" width="15" height="13" class="navi_img">	
						</a>
					<%} else { %>
						<a href="Qna_list.jsp?page=<%=finishBlock+1 %>&type=<%=type %>&keyword=<%=keyword%>" >
								<img src="<%=request.getContextPath()%>/img/forward.png" width="15" height="13" class="navi_img">	
						</a>
					<%} %> 
			</ul>	
		</div>

	</div>
</body>
</html>
<jsp:include page="/template/footer.jsp"></jsp:include>