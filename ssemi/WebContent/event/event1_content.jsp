<%@page import="home.beans.dao.MemberDao"%>
<%@page import="home.beans.dto.MemberDto"%>
<%@page import="home.beans.dto.eventDto"%>
<%@page import="home.beans.dao.eventDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    


<% int event_no = Integer.parseInt(request.getParameter("event_no"));

eventDao edao = new eventDao();
eventDto edto = edao.get(event_no);
 MemberDao mdao= new MemberDao();
%>

<%

//관리자이면 세션에 있는 userinfo 권한 정보

MemberDto user = (MemberDto)session.getAttribute("userinfo");

// 내글이(게시글edto)의 작성자와 로그인 된 사용자(user)의 아이디가 같아야함.

boolean isMine = user.getMember_id().equals(edto.getEvent_writer());

MemberDao mdao2 = new MemberDao();
MemberDto mdto = mdao.get(edto.getEvent_no());//작성자로 회원조회


%> 


<!-- 선착순 게시글 작성 -->
    <jsp:include page="/template/header.jsp"></jsp:include>
    <link
	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
  
  text-align:center;
}

* {
   box-sizing: border-box;
   margin: 0px;
   padding: 0px;
   font-family: 'Noto Sans KR', sans-serif;
   letter-spacing: -1.5px;
}


.container {
 width:70%;
  padding: 16px;
  background-color: white;
}

textarea{
  width: 70%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

input[type=text], input[type=password] {
  width: 70%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

.bar{
 width: 70%;
  display: inline-block;
  padding: 15px;
  margin: 15px;
  border: none;
  background: #f1f1f1;
  }
  
  
hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
  width:70%:
}

.registerbtn {
  background-color: #BA3028;
  color: white;
  padding: 16px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 70%;
  opacity: 0.9;
}

.registerbtn:hover {
  opacity: 1;
}

.roww{
height:10px;
}

.rowww{
height:150px;
}



.signin {
  background-color: #f1f1f1;
  text-align: center;
}
</style>
</head>
<body>
<div align="center">
  <div class="rowww"></div>

<form action="event1_content.do" method="post">
 <div class="container">
    <h1>EVENT</h1>

    <hr>

  <div class="roww"></div>
  
      <label for="event_title"><b>제 목</b></label> <span class="bar">
    <%
    if(edto.getEvent_head()!=null){ 
    
    %>
    [<%=edto.getEvent_head()%>]
    <%}%>

    <%=edto.getEvent_title()%></span>
  
  
      <div class="roww"></div>
      
        <label for="event_writer"><b>작성자</b></label> <span class="bar">

     <%if(edto.getEvent_writer()!= 0) {
    	 MemberDto mdto2 = mdao2.get(edto.getEvent_writer());
    	 
     %>
     <%=mdto2.getMember_id()%>
 <%}else{%>
    <font color ="gray"> 탈퇴한 사용자</font>
       <%}%>
       
       
  <%if(mdto != null){ %>
    <font color = "gray">
    <%=mdto.getMember_auth()%>
    </font>
    <%}%>
    </span>
    
    <div class="roww"></div>

     <label for="event_date"><b>작성일</b></label> <span class="bar">
   <%=edto.getEvent_date()%></span>
  
  <div class="roww"></div>

   <label for="event_content"><b>내용</b></label><span class="bar">
  <%=edto.getEvent_content()%>
</span>

     <div class="roww"></div>
   
    
    
    <%if(isMine){%>
     <a href= "<%=request.getContextPath()%>/event/event1_edit.jsp?event_no=<%=event_no%>">
        <input type = "button" value="수정"></a>
        
        <a href= "<%=request.getContextPath()%>/member/check_pw.jsp?go=<%=request.getContextPath()%>/event/delete.do?event_no=<%=event_no%>">
          <input type = "button" value="삭제"></a>
          
          
          <%} %>
           <a href= event_event1.jsp>
            <input type = "button" value="목록"></a>
    </div>

</form>
</div>

</body>
</html>

    
    <jsp:include page="/template/footer.jsp"></jsp:include>