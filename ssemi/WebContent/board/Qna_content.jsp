<%@page import="java.util.List"%>
<%@page import="home.beans.dao.Qna_fileDao"%>
<%@page import="home.beans.dto.Qna_fileDto"%>
<%@page import="home.beans.dao.MemberDao"%>

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

.body_table {
margin:auto;
width:60%;

border: 1px, solid, #999999;
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
	border: 1px solid #AAA;
	position: absolute;
	width: 120px;
	padding: 30px 20px 30px 20px;
	text-align: left;
	cursor: pointer;
	left:-300px;
	    top: 180px;

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
width:80%;
left:300px;
align:center;
margin-top:95px;


}

.body_table {
border: 1px solid #eaeaea;
margin-right:100px;
margin-top : 20px;
border-right:1px solid transparent;
border-left : 1px solid transparent;
 border-collapse: collapse;
 display: block;
 
}

/*내용 제목*/

.content_content {
height:200px;
valign:middle;
word-break:break-all;'
}
.content_th {
    padding: 15px 10px 14px 18px;
    border-right: 0;
    border-left: 0;
    background: 0;
    font-weight: 400;
    color: #666;
    font-size:13px;
    width:150px;
}
.content_td {
	padding: 15px 0 14px 0;
    border-right: 0;
    border-left: 0;
    font-size:13px;
    width:892px;
    }
    /* 시간 */
    .content_date {
    text-align: right;
   border-bottom:1px solid transparent;
    }
    .content_date_datail {
    line-height: 22px;
    color: #666;
    }

    .content_date_text {
    font-size:13px;
    margin :0 0 0 3px;
    color : #666666;
    }
    .content_date_text2 {
    font-size : 12px;
        margin :0 0 0 3px;
        color:#939393;
    }

/* 하단 버튼 */

.button_box {
text-align: right;
padding-right:100px;
padding-top : 30px;
}

.button {
width:80px;
        height: 20px;
    line-height: 18px;
    padding: 2px 4px;
    color: #333;
    font-size: 11px;
    letter-spacing: 1px;
    text-align: center;
    vertical-align: middle;
    box-shadow: 1px 1px 0 rgba(0,0,0,0.05);
    border: 1px solid #ddd;
    border-radius: 2px;
   cursor:pointer;

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

// 게시글 작성자를 표기하고 싶다면 회원정보가 필요
MemberDao mdao=new MemberDao();
MemberDto mdto = mdao.get(qdto.getQna_writer());

// 관리자 또는 작성자 본인일 때만 '수정', '삭제' 버튼 활성화
MemberDto user =(MemberDto) session.getAttribute("userinfo");
boolean isAdmin = user.getMember_auth().equals("관리자");

// - 내글 : 게시글(bdto)의 작성자와 로그인 된 사용자(user)의 아이디가 같아야 함

int member_no = user.getMember_no();
boolean isMine = member_no == qdto.getQna_writer();

Qna_fileDao qfdao = new Qna_fileDao();
List<Qna_fileDto> fileList = qfdao.getList(qna_no);

String go = request.getParameter("go");
%>

<body>
	<div id="customer">
		<div class="container">
			<div class="head">
				<div class="navi">
					<p class="cs">커뮤니티</p>
					<p class="cs_row">공지사항</p>
					<p class="cs_row"><a href="<%=request.getContextPath()%>/board/Qna_list.jsp">상품문의</a></p>
					<p class="cs_row"><a href="<%=request.getContextPath()%>/board/Qna_list2.jsp">배송문의</a></p>
					<p class="cs_row">이벤트</p>
				</div>
				<p class="title">
					<b>문의내역</b>
				</p>
		
			</div>
			<div class="body" >
				<table class="body_table" border="1" >
					<tbody>
						<tr >
						<th class="content_th">TITLE </th>
							<td class="content_td"><%=qdto.getQna_title()%></td>
						</tr>
						<tr >
						<th class="content_th">WRITER </th>
							<td><%=mdto.getMember_id()%></td>
						</tr>
						<tr >
							<td class="content_date"  colspan="2">							
										<span class="content_date_text">DATE</span>
										<span class="content_date_text2"><%=qdto.getQna_date()%></span>

							</td>
						</tr>
						<tr >
						<th class="content_th">CONTENT </th>
							<td  class="content_content" >
					
									 <%=qdto.getQna_content()%>
									 
								 <!--  첨부파일 있을 때만 출력 -->
								<%if(!fileList.isEmpty()) {%>
									<%for(Qna_fileDto qfdto : fileList) {%>		
										<img src="download.do?qna_file_no=<%=qfdto.getQna_file_no()%>" width="100" height="100">
							</td>
						</tr>				
							<!-- 첨부파일 출력 영역 -->
						<tr>
							<td class="content_th" colspan="2">
							 FILE
							 	<ul >
							 		<li>
							 		<%=qfdto.getQna_file_name() %>
							 		(<%=qfdto.getQna_file_size() %>bytes)
							 		<!-- 다운로드 버튼을 누른다면 해당 파일을 다운로드 할 수 있도록 링크 -->
									<a href="download.do?qna_file_no=<%=qfdto.getQna_file_no()%>">DOWNLOAD</a>
							 		</li>
							 		<%} %>
							 	</ul>
							</td>
						</tr>
						<%} %>
					</tbody>
				</table>

				<!-- 버튼 -->

				<div class="button_box">				
				<%if(isAdmin || isMine)  {%>
					<a href="Qna_edit.jsp?qna_no=<%=qna_no%>">
					<input class="button"  type="button" value="EDIT">
					</a>

					<a href="<%=request.getContextPath()%>/member/check_pw.jsp?go=<%=request.getContextPath()%>/board/Qna_delete.do?qna_no=<%=qna_no%>">
					<input class="button"  type="button" value="DELETE">
					</a>
				<%}%>
				
				<%if(qdto.getQna_title().equals("상품문의")) {%> <!-- qna_title이 상품문의면 -->
					<a href="Qna_list.jsp">
						<input  class="button"  type="button" value="LIST" >
					</a>
				<%} else { %>	<!-- qna_title이 배송문의면 -->
					<a href="Qna_list2.jsp">
						<input  class="button"  type="button" value="LIST" >
					</a>
				<%} %>
					<a href="Qna_write.jsp?qna_no=<%=qna_no%>">
					<input class="button"  type="button" value="REPLY">
				</a>

				
				</div>
			</div>
		</div>
	</div>

</body>
</html>
