
<%@page import="home.beans.dao.MemberDao"%>
<%@page import="home.beans.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<% MemberDto user = (MemberDto) session.getAttribute("userinfo");
	int member_no = user.getMember_no();
%>


<style>

 * {
   box-sizing: border-box;
   font-family: 'Noto Sans KR', sans-serif;
  
}
.write-wrap{
 border: 1px solid #3333;
 
    margin-top: 25px;
}

table {
  border-collapse: collapse;
  width: 60%;
  
}

th {
  padding: 8px;
  text-align: center;
  border-bottom: 1px solid #ddd;
}

 td {
  padding: 8px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}


tr:hover {background-color:#f5f5f5;}

.bttn{
text-align:center;
margin: 20px 0 20px 0;
}

	</style>
<!-- 선착순 게시글 작성 -->
    <jsp:include page="/template/header.jsp"></jsp:include>
     <link rel=stylesheet type="text/css" href="<%=request.getContextPath() %>/css/event.css?ver=1">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">


    
    <div style= padding-top:150px; align="center">
    <h2>선착순 게시글 작성</h2>
   
    
    <form action = "event1_writer.do" method="get">
    <table class="write-wrap">
    <tbody>
    
   
    <tr>
    <th>말머리</th>
    <td><select name= "event_head">
    <option value="">선택</option>
    <option value="주방">주방</option>
    <option value="마루">마루</option>
    <option value="욕실">욕실</option>
 
    </select></td>
    </tr>
    
    <tr>
    <th>제목</th>
    <td>
    <input type ="text" name = "event_title" size="150" required>
    </td>
    
    </tr>
    
    <tr>
    <th>내용</th>
    <td><textarea name="event_content" required rows="15" cols="100"></textarea></td>
    </tr>


   
    
    <tr><td colspan="2" align ="center">
    <input type ="submit" value = "등록">
<!--      <input type= "hidden" value="1100" name="member_point"> -->

     
    </td>
    </tr>
  </tbody>
    </table>
    
    </form>
    </div>
    
    <jsp:include page="/template/footer.jsp"></jsp:include>