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
 /* 전체 제목 */
 .container {
padding-top:150px;
}

.row {
font-size:13px
}

</style>

<div align="center" class="container">
	<span class="write_title">WRITE</span>
	<form class="write_box" action="QnaWrite.do" method="post"  enctype="multipart/form-data">
	
		<!-- 회원번호 히든으로 넘기기 -->
	<input type="hidden" value="<%=mdto.getMember_no() %>" name="member_no">
		
		
		<!-- 원본 글 번호가 넘어온다면 (즉, 답글이라면) 원본글번호를 hidden으로 첨부 -->
		<%if(request.getParameter("qna_no")!=null) {%>
		<input type="hidden" name="qna_no" value="<%=request.getParameter("qna_no")%>">
		<%} %>
		
		<table>
			<tbody>

				<tr>
						<th class="row">SUBJECT</th>
						<td><input type="text" name="qna_title" size="70" maxlength="90" required></td>
				</tr>
				<tr>
						<th class="row">CONTENT</th>
						<td><textarea name="qna_content" cols="70" rows="15" required></textarea></td>
				</tr>
				
				<!--  첨부파일  -->
				<tr>
					<th class="row">FILE</th>
					<td>
						<input type="file" name="qna_file" multiple accept=".jpg,.png,.gif">
					</td>
				</tr>
				
				<tr>
						<td colspan="2" align="center"><input type="submit" value="OK">
						<a href="Qna_list.jsp"><input type="button" value="CANCEL"></a>		
						</td>
				</tr>

				</tbody>
			</table>
		</form>
</div>
</html>
<jsp:include page="/template/footer.jsp"></jsp:include>
    