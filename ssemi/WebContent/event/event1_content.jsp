
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


     <jsp:include page="/template/header.jsp"></jsp:include>
    
    
    <link rel=stylesheet type="text/css" href="<%=request.getContextPath() %>/css/event.css?ver=1">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">




<form action="event1_content.do" method="post">
<main>
<article>
    
 <div align="center">
 
    <h2>작성글 상세보기</h2>
    
    <table border="1" width="60%">
    <tbody>
    
    <tr>
    <td>
    <font size="6">
    <%
    if(edto.getEvent_head()!=null){ 
    
    %>
    [<%=edto.getEvent_head()%>]
    <%}%>
    </font>
    
    <%=edto.getEvent_title()%><!-- 제목 -->
     </font>
    </td>
    </tr>
    
    
    <tr>
    <td>
    
    <!--작성자 -->
   
    
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
    </td>
    </tr>
    
    <tr>
    <td>
   <%=edto.getEvent_date()%>
    <%=edto.getEvent_read()%>
    </td>
    </tr>
    
    
     <tr height="300">
    <td valign ="top">
  <%=edto.getEvent_content()%>
    </td>
    </tr>

    
   
    <tr>
    <td colspan ="2" align ="right">
    
    <a href= event_writer.jsp>
    <input type = "button" value="글쓰기"></a>
    
    
    <%if(isMine){%>
     <a href= "<%=request.getContextPath()%>/event/event1_edit.jsp?event_no=<%=event_no%>">
        <input type = "button" value="수정"></a>
        
        <a href= "<%=request.getContextPath()%>/member/check_pw.jsp?go=<%=request.getContextPath()%>/event/delete.do?event_no=<%=event_no%>">
          <input type = "button" value="삭제"></a>
          
          
          <%} %>
           <a href= event_event1.jsp>
            <input type = "button" value="목록"></a>
    
    </td>
    
    </tr>
   </tbody>
    </table>
    </div>
    </article>
    </main>
   </form>
   
    
    <jsp:include page="/template/footer.jsp"></jsp:include>