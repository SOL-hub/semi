<%@page import="home.beans.dto.QnaDto"%>
<%@page import="home.beans.dao.MemberDao"%>
<%@page import="home.beans.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
		MemberDto mdto =(MemberDto) session.getAttribute("userinfo");
    %>

<jsp:include page="/template/header.jsp"></jsp:include>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">

 <style>
 * {
	box-sizing: border-box;
	margin: 0px;
	padding: 0px;
	font-family: 'Noto Sans KR', sans-serif;
	letter-spacing: -1.5px;
}
 /* 전체 제목 */
 .container {
padding-top:150px;
}
.writer_title {
	text-align: center;
	font-size: 20px;
	color:#333333
	padding: 15px 0 14px 0;
    border-right: 0;
    border-left: 0;
	}

.row {
font-size:13px;
    padding-right: 15px;
}
.write_table {
    border-left: 1px solid transparent;
    border-right: 1px solid transparent;
    border-top: 1px solid #ddd;
    border-bottom: 1px solid #ddd;
    margin-top: 30px;
 
}
.row_file {
    margin: 15px -2px;
}

/*게시글 제목 */
.select_subject {
padding: 15px 0 14px 0;
    border-right: 0;
    border-left: 0;
    }
  /*게시글 내용 */
  .textarea {
  resize: vertical;
  width: 600px;
  }
  /*버튼*/
  .button {
    height: 25px;
    line-height: 25px;
    padding: 2px 4px;
    border: 1px solid #eaeaea;
    color: #333;
     display: inline-block;
    font-size: 11px;
    letter-spacing: 1px;
    text-align: center;
    vertical-align: middle;
    box-shadow: 1px 1px 0 rgba(0,0,0,0.05);
    border: 1px solid #444;
    background: #444;
    color: #fff;
    border-radius: 2px;
   cursor:pointer;
    width: 100px;
  }

</style>

<div align="center" class="container">
	<span class="write_title">공지사항</span>
	<form class="write_box" action="QnaWrite.do" method="post"  enctype="multipart/form-data">
	
		<!-- 회원번호 히든으로 넘기기 -->
	<input type="hidden" value="<%=mdto.getMember_no() %>" name="member_no">
		
		
		<!-- 원본 글 번호가 넘어온다면 (즉, 답글이라면) 원본글번호를 hidden으로 첨부 -->
		<%if(request.getParameter("qna_no")!=null) {%>
		<input type="hidden" name="qna_no" value="<%=request.getParameter("qna_no")%>">
		<%} %>

		<table class="write_table">
			<tbody>

				<tr>
						<th class="row">SUBJECT</th>
						<td class="select_subject"><input type="text"  name="qna_title"   required>
						</td>
				</tr>
				<tr>
						<th class="row">CONTENT</th>
						<td><textarea name="qna_content" cols="70" rows="15" required class="textarea"></textarea></td>
				</tr>
				
				<!--  첨부파일  -->
				<tr>
					<th class="row">FILE</th>
					<td>
						<input type="file" name="qna_file" multiple accept=".jpg,.png,.gif"  class="row_file">
					</td>
				</tr>
				
				</tbody>
			</table>
			<div style="padding-top:15px;">
			<input type="submit" value="OK" class="button">
			<a href="Qna_list2.jsp"><input type="button" value="CANCEL" class="button"></a>		
			</div>
		</form>
</div>
</html>
<jsp:include page="/template/footer.jsp"></jsp:include>
    