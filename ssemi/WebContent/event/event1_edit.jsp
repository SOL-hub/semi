<%@page import="home.beans.dto.eventDto"%>
<%@page import="home.beans.dao.eventDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
int event_no = Integer.parseInt(request.getParameter("event_no"));
eventDao edao = new eventDao();
eventDto edto = edao.get(event_no);
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
    
    <div style= padding-top:200px; align="center">
   
    
    <h2>선착순 게시글 수정</h2>
     <form action = "event1_edit.do" method="post">
<input type = "hidden" name = "event_no" value="<%=event_no%>">

    <table border="1">
    <tbody>
    
   
    <tr>
    <th>말머리</th>
    <td><select name= "event_head">
    <option value="">선택</option>
    <option value="">주방</option>
    <option value=""> 마루</option>
    <option value="">욕실</option>
    </select></td>
    </tr>
    
    <tr>
    <th>제목</th>
    <td>
    <input type ="text" name = "event_title" size="68" required value="<%=edto.getEvent_title()%>">
    </td>
    
    </tr>
    
    <tr>
    <th>내용</th>
    <td>
    <textarea name="event_content" required rows="15" cols="70"><%=edto.getEvent_content()%></textarea></td>
    </tr>


    
    <tr><td colspan="2" align ="center">
    <input type ="submit" value = "수정하기">
     <input type= "hidden" value="2000" name="member_point">

     
    </td>
    </tr>
  </tbody>
    </table>
    
    </form>
    </div>
    
    <jsp:include page="/template/footer.jsp"></jsp:include>