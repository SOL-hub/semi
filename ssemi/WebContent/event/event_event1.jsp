
<%@page import="home.beans.dao.MemberDao"%>
<%@page import="home.beans.dto.MemberDto"%>
<%@page import="home.beans.dto.eventDto"%>
<%@page import="java.util.List"%>
<%@page import="home.beans.dao.eventDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>



<%
MemberDao mdao = new MemberDao();
String type = request.getParameter("type");
String keyword = request.getParameter("keyword");
boolean isSearch = type!=null && keyword!=null;
eventDao edao = new eventDao();
//list
//List<eventDto> list = 목록 or 검색;
List<eventDto>list;
if(isSearch){
	list= edao.search(type, keyword);
}
else{
	list= edao.getList();
}
%>



<div align = "center">

	
	
<%
//여기서는... 하아.. 여기서는 
%> 

</div>
<jsp:include page="/template/header.jsp"></jsp:include>


<link rel=stylesheet type="text/css"
   href="<%=request.getContextPath()%>/css/event_event1.css">

<link
   href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@300&display=swap"
   rel="stylesheet">


<!--<form action="event1.do" method="post">-->

<body>

   <!--<div class="img-wrap">-->

      <main>
         <article>


            <div style="padding-top: 100px;" align="center">
               <h1 style="font-size: 50px;">EVENT</h1>
               <br>
               <h1 style="font-size: 45px;">
                  여름상품여기 다있다.<br>종합세트 선착순5명 할인 판매실시
               </h1>
             <h1 style=font-width:bold;
                       >2020-07-20(월) 10시 START</h1>
               
              
               <br> <br> 여름 더우시죠? 시~원하게 1000포인트 쏘겠습니다! <br>
               여름에 사려했던 제품이 무엇인지, 어떤 것을 갖고 싶으신지와 그 이유를 적어주시면 <br>선착순으로
               내용을 달아주신 고객님께 제품을 세트로 할인판매하는 이벤트를 진행하고 있습니다. <br>골라서 세트할인으로
               즐거운 쇼핑하세요.</div> 
               
               <br> 
               <br> <br> 
               
               <hr class="hr-twolow">
               <!--제품관련 스타일-->

               <h3 style="text-align: left" font-size=55pt;>이벤트 진행 소개</h3>


               <!-- 여기부터 이벤트 소개 시작 -->
                  <div align="center">
                  <img src="<%=request.getContextPath()%>/img/event1-4.png" width="1000" height="700" alt="event"/>
                  <h5 style="font-size: 13pt;">
                        타이밍을 잘 잡아야, 실속있게 산다! <br>종합세트 할인 판매실시!</h5>
                     <h6 style="font-color: grey;">
                        곧 여름도 다가오는데 언제다 이거사고 저거사? 여름에 필요한 거 여기 다 있어! <br> 제품 하나씩 맘껏
                        골라서 세트할인으로 즐거운 쇼핑하세요.
                     </h6>

                      
          
                     <!-- 선착순 이벤트 게시판  -->

           
                     
                      <form action="event_event1.jsp" method="get">
                      
                       <div class= "table-ssideopen">    
                        <br>
                     <br>
                     <h1>선착순 게시판</h1>
                     <hr width="80%">
                
                       <table>
                        <thead>
                           <tr>
                              <th width="5%" >번호</th>
                              <th width="50%"> 제목</th>
                              <th>작성자</th>
                              <th width="20%">작성일</th>
                           
                           </tr>
                        </thead>
                        
                        <tbody align= "center">
                   
                        <%
                        
                        for(eventDto edto : list){
                        MemberDto mdto = mdao.get(edto.getEvent_writer());
                        %>
                        
                        <tr>
                              <td><%=edto.getEvent_no() %></td>
                              <td align ="left">
                              
                              
                              <a href="event1_content.jsp?event_no=<%=edto.getEvent_no()%>"><%=edto.getEvent_title() %>
                              </a>
                              </td>
                              <td>
                              <%if(edto.getEvent_writer()!= 0 ){%>
                              <%= mdto.getMember_id() %>
                              
                              <%}else{ %>
                              <font color="gray">탈퇴한 사용자</font>
                              <%} %>
                              </td>
                              <td><%=edto.getEvent_date() %></td>
                       
                           </tr>
                           <%} %>
                           
                         <%if(list.size() <5){ %>  
                       <tr>
                       <td colspan="5" align ="right">
                       <a href="event1_writer.jsp">
   <!-- style = text-align: "center";-->
                       <input class="login2-submit" type ="button" value="글쓰기"> </a>
                       </tr> 
                        </form>
                        
                        <%}else{ %>
                        
                        <%} %>
 
                       </tbody>
                       
                         </table>
                         <hr width="80%">
                        <!-- 검색창 -->

 <br>
 <!-- 검색불류 -->
 <!--  <select name= "type">
 <option>제목만</option>
 <option>글 작성자</option>
 </select>
 
 <!-- 검색어 -->
 <!--<input type ="text" name="keyword" required>
 
 <!-- 전송버튼 -->
<!-- <input type ="submit" value="검색">-->

 
 
 
  <!--<div class="event-login-submint">
   <a href="<%=request.getContextPath()%>/member/login.jsp">
    <input class="login-submit" type="submit" value="로그인하기">
   </a>--> 
   
   <a href="<%=request.getContextPath()%>/member/user_info.jsp">
   <input class="login-submit" type="submit" value="내 포인트보기">
    </a></div> </div>
   
                       </article>
                       </main>
                       <script src="js/jquery-3.1.1.js"></script>
<script src="js/bootstrap.js"></script>
                       </body>
                       </html>

<jsp:include page="/template/footer.jsp"></jsp:include>