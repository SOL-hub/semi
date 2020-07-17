<%@page import="home.beans.dto.QnaDto"%>
<%@page import="home.beans.dao.QnaDao"%>
<%@page import="home.beans.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

       <%
		MemberDto mdto =(MemberDto) session.getAttribute("userinfo");

       
       int qna_no = Integer.parseInt(request.getParameter("qna_no"));
       QnaDao qdao = new QnaDao();
       QnaDto qdto = qdao.get(qna_no);
       
       // 관리자일때
       boolean isAdmin = mdto.getMember_auth().equals("관리자");
       // 일반회원일때
       int member_no = mdto.getMember_no();
       boolean isMine = member_no == qdto.getQna_writer();
    %>

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
	<span class="write_title">EDIT</span>
	<form class="write_box" action="QnaEdit.do" method="post" >
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
						<td class="select_subject">
							<select  name="qna_title"  required>
								<%if(!isAdmin)  {%>
							<option value="상품문의">상품문의</option>
							<%} else {%>
								<option value="답변입니다">답변입니다</option>
								<%} %>
							</select>
						</td>
				</tr>
				<tr>
						<th class="row">CONTENT</th>
						<td><textarea name="qna_content" cols="70" rows="15" required class="textarea"><%=qdto.getQna_content() %></textarea></td>
				</tr>
				
				<!--  첨부파일  -->
				<tr>
					<th class="row">FILE</th>
					<td>
						<input type="file" name="qna_file" multiple accept=".jpg,.png,.gif" class="row_file">
					</td>
				</tr>
				
				<tr>
						<td colspan="2" align="center">
						<a href="QnaEdit.do">
						<input type="submit" value="OK" class="button">
						</a>
						<a href="Qna_content.jsp?qna_no=<%=qna_no%>">
						<input type="button" value="CANCEL" class="button">
						</a>		
						</td>
				</tr>

				</tbody>
			</table>
		</form>
</div>
</html>
<jsp:include page="/template/footer.jsp"></jsp:include>