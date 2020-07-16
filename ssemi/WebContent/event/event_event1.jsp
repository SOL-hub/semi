
<%@page import="home.beans.dto.eventDto"%>
<%@page import="java.util.List"%>
<%@page import="home.beans.dao.eventDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>



<%
String type = request.getParameter("type");
String keyword = request.getParameter("keyword");

boolean isSearch = type!=null && keyword!=null;

eventDao edao = new eventDao();
//list
List<eventDto>list;

if(isSearch){
	list= edao.search(type, keyword);
}

else{
	list= edao.getList();
}
%>

<jsp:include page="/template/header.jsp"></jsp:include>


<link rel=stylesheet type="text/css"
   href="<%=request.getContextPath()%>/css/login.css">

<link
   href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@300&display=swap"
   rel="stylesheet">


<!--<form action="event1.do" method="post">-->
<body class="Body">
   <!--<div class="img-wrap">-->

      <main>
         <article>


            <div style="padding-top: 150px;" align="center">
               <h1 style="font-size: 50px;">EVENT</h1>
               <br>
               <h1 style="font-size: 45px;">
                  여름상품여기 다있다.<br>종합세트 선착순10명 할인 판매실시!
               </h1>
               <h6 style="font-width: bold font-size:38pt;">2020-07-12 ~
                  2020-08-31</h6>
               <br> <br>
              
               <br> <br> 곧 여름도 다가오는데 언제다 이거사고 저거사? 여름에 필요한 거 여기 다 있어! <br>
               선착순 10명에게만 여름에 사려했던 제품이 무엇인지, 어떤 것을 갖고 싶으신지와 그 이유를 적어주시면 <br>선착순으로
               내용을 달아주신 고객님께 제품을 세트로 할인판매하는 이벤트를 진행하고 있습니다. <br>골라서 세트할인으로
               즐거운 쇼핑하세요.</div> 
               
               <br> <br>
               <br> <br>
               
               
               <hr class="hr-twolow">
               <!--제품관련 스타일-->

               <h3 style="text-align: left" font-size=38pt;>이밴트 진행 소개</h3>


               <!-- 여기부터 이벤트 소개 시작 -->
                  <div align="center">
                  <img src="<%=request.getContextPath()%>/img/event123.jpg" width="1000" height="700" alt="event"/>
                  <h5 style="font-size: 13pt;">
                        타이밍을 잘 잡아야, 실속있게 산다! <br>종합세트 할인 판매실시!</h5>
                     <h6 style="font-color: grey;">
                        곧 여름도 다가오는데 언제다 이거사고 저거사? 여름에 필요한 거 여기 다 있어! <br> 제품 하나씩 맘껏
                        골라서 세트할인으로 즐거운 쇼핑하세요.
                     </h6>

                     <h6 style= font-width:bold;>2020-07-12 ~ 2020-08-31</h6>
                    
          
                     
                     <!-- 선착순 이벤트 게시판  -->

                     <table border="1" width="90%">
                     
                      <form action="event_event1.jsp" method="get">
                      
                       <div class= "eventtable">
                     <h2>선착순 게시판</h2>
                       
                        <thead>
                           <tr>
                              <th>번호</th>
                              <th width="40%">제목</th>
                              <th>작성자</th>
                              <th>작성일</th>
                              <th>조회수</th>
                           </tr>
                        </thead>
                        <tbody>
                        <%for(eventDto edto : list){%>
                        <tr>
                              <td><%=edto.getEvent_no() %></td>
                              <td align ="left">
                              <a href="event_content.jsp?event_no=<%=edto.getEvent_no()%>"><%=edto.getEvent_title() %></a></td>
                              <td><%=edto.getEvent_writer() %></td>
                              <td><%=edto.getEvent_date() %></td>
                              <td><%=edto.getEvent_read() %></td>
                           </tr>
                           <%} %>
                       <tr>
                       <td colspan="5" align ="right">
                       <a href="event1_writer.jsp">
                       <input type ="button" value="글쓰기"></a>
                       </tr> 
                        </form>
 
                       </tbody>
                       
                         </table>
                         
                        <!-- 검색창 -->


<br>
 <br>
 <!-- 검색불류 -->
 <select name= "type">
 <option>제목만</option>
 <option>글 작성자</option>
 </select>
 

 <!-- 검색어 -->
 <input type ="text" name="keyword" required>
 
 <!-- 전송버튼 -->
 <input type ="submit" value="검색">

 
 
 
   <div class="event-login-submint">
   <a href="<%=request.getContextPath()%>/member/login.jsp">
    <input class="login-submit" type="submit" value="로그인하기">
   </a>
   
   <a href="<%=request.getContextPath()%>/member/user_info.jsp">
   <input class="login-submit" type="submit" value="내 포인트보기">
    </a></div> </div>
   
                       </article>
                       </main>
                       </body>
                       

<jsp:include page="/template/footer.jsp"></jsp:include>
