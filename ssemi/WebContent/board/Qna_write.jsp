<%@page import="home.beans.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">

<!-- 
	write.jsp : 게시글 작성 페이지
	- 입력 항목은 3개 : board_head, board_title, board_content
	- 작성자는 회원정보가 자동으로 설정
	
	- 첨부파일을 추가할 수 있도록 구현(이미지만 허용)
 -->
 

<div align="center">
	<h3>글쓰기</h3>
	<form action="QnaWrite.do" method="post" enctype="multipart/form-data">
		<!-- 원본 글 번호가 넘어온다면 (즉, 답글이라면) 원본글번호를 hidden으로 첨부 -->
		<%if(request.getParameter("qna_no")!=null) {%>
		<input type="hidden" name="qna_no" value="<%=request.getParameter("qna_no")%>">
		<%} %>
		<table>
			<tbody>
				<tr>
						<th>작성자</th>
						<td></td>
				</tr>
				<tr>
						<th>제목</th>
						<td><input type="text" name="qna_title" size="70" maxlength="90" required></td>
				</tr>
				<tr>
						<th>내용</th>
						<td><textarea name="qna_content" cols="70" rows="15" required></textarea></td>
				</tr>
				
				<!--  첨부파일  -->
				<tr>
					<th>첨부파일</th>
					<td>
						<input type="file" name="qna_file" multiple accept=".jpg,.png,.gif">
					</td>
				</tr>
				
				<tr>
						<td colspan="2" align="center"><input type="submit" value="등록">
						<a href="list.jsp"><input type="button" value="취소"></a>		
						</td>
				</tr>

				</tbody>
			</table>
		</form>
</div>
</html>
<jsp:include page="/template/footer.jsp"></jsp:include>
    