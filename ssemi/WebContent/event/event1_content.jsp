
<%@page import="home.beans.dto.MemberDto"%>
<%@page import="home.beans.dto.eventDto"%>
<%@page import="home.beans.dao.eventDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    


<% int event_no = Integer.parseInt(request.getParameter("event_no"));

eventDao edao = new eventDao();
eventDto edto = edao.get(event_no);

%>

<%

//관리자이면 세션에 있는 userinfo 권한 정보

MemberDto user = (MemberDto)session.getAttribute("userinfo");
int member_no = user.getMember_no();
boolean isAdmin = user.getMember_auth().equals("관리자");
boolean isMine = member_no == edto.getEvent_writer();
// 내글이(게시글edto)의 작성자와 로그인 된 사용자(user)의 아이디가 같아야함.


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
    
    <%=edto.getEvent_title()%><!-- 제목 -->
    </td>
    </tr>
    
    
    <tr><!--작성자 -->
    <td><%=edto.getEvent_writer() %></td>
    </tr>
    
    <tr>
    <td>
   <%=edto.getEvent_date() %>
    <%=edto.getEvent_read() %>
    </td>
    </tr>
    
    
     <tr height="300">
    <td valign ="top">
  <%=edto.getEvent_content() %>
    </td>
    </tr>

    
   
    <tr>
    <td colspan ="2" align ="right">
    
    <a href= event_writer.jsp>
    <input type = "button" value="글쓰기"></a>
    
    
    <%if(isAdmin||isMine){%>
    
        <input type = "button" value="수정">
        
        <a href= "<%=request.getContextPath()%>/member/check.jsp?go=<%=request.getContextPath()%>/event/delete.do?event_no=<%=event_no%>">
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