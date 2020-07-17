<%@page import="home.beans.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    request.setCharacterEncoding("UTF-8");
    String bath_gong = request.getParameter("bath_gong");
    String bath_sohyung = request.getParameter("bath_sohyung");
    String tools = request.getParameter("tools");
    String bigtools = request.getParameter("bigtools");
   String[] chutools = request.getParameterValues("chutools");
   
   int realprice =Integer.parseInt(request.getParameter("pricee"));
 
   int pricemin = (realprice - 250000) / 10000;
   int priceplus = (realprice + 250000) / 10000;
  
	MemberDto mdto = (MemberDto) session.getAttribute("userinfo");
	boolean isLogin = mdto != null;

	%>
    
<jsp:include page="/template/header.jsp"></jsp:include>
    
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
	
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>


* {
	box-sizing: border-box;
	font-family: 'Noto Sans KR', sans-serif;
}

body{
   height:100%;}


.container {
box-shadow: 0 4px 8px 0 rgba(0,0,0,0.3);
 width:50%;
 margin:auto;
 text-align: center;
  padding: 26px;
  background-color: white;
}

.bar{
  width: 50%;
  padding: 15px;
  margin: 15px 0 15px 25px;
  display: inline-block;
  border: none;
  background: #f1f1f1;
  }

input[type=text]{
 border: 3px outset #DDD4CB ;
  width: 80%;
  padding: 10px;
  margin: 22px 0 22px 0;
  display: inline-block;

  background: #f1f1f1;
}

input[type=text]:focus {
  background-color: #ddd;
  outline: none;
}

hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 30px;
  margin-top: 30px;
}

.registerbtn {
  background-color: #C80A1E;;
  color: white;
  padding: 15px;
  margin: 8px 0;
  border-radius: 5px;
  cursor: pointer;
  width: 150px;
  opacity: 0.9;
}

.registerbtn:hover {
  opacity: 1;
}

.rowrow{
height:200px;
}

.roww {
height:5px;
}


.signin {
  background-color: #f1f1f1;
  text-align: center;
}

.half {
  background: linear-gradient(to top, #EAE2E5  40%, transparent 50%);
}

</style>
</head>
<body>

<div class="rowrow"></div>


   <form action="saveesti.do" method="post" >
  <div class="container">
    <%
				if (isLogin) {
			%>
    <p> <img width="30px"
               src="<%=request.getContextPath()%>/img/pig_logo.png">  <b><%=mdto.getMember_name()%>님의 욕실 예상견적서 입니다 </b> <img width="30px"
               src="<%=request.getContextPath()%>/img/pig_logo.png"></p> 
    <hr><%} else{%> 
      <p> <img width="30px"
               src="<%=request.getContextPath()%>/img/pig_logo.png">   욕실시공  예상견적서 입니다  <img width="30px"
               src="<%=request.getContextPath()%>/img/pig_logo.png"></p> 
    <hr>  <%} %>
        
    <label for="title"><b> 예상가격 </b> </label>
    <h1 class="bar"> <%=pricemin %> ~ <%=priceplus %> 만원 </h1>
   <input type="hidden" name="bath_price" value="<%=realprice%>">

    <hr>
   
    <span class="half"> 공용(거실) </span>  <b> <span class="bar"><%=bath_gong %></span> </b>
     <input type ="hidden" name="bath_cnt" value="<%=bath_gong %>" id="gong"></td>
     <div class="roww"></div>
     
        <span class="half"> 소형(안방) </span>  <b>  <span class="bar"><%=bath_sohyung %></span></b>
     <input type ="hidden" name="bath_cntt" value="<%=bath_sohyung %>" id="gong"></td>
     <div class="roww"></div>
     
         <span class="half"> 욕실 유형 </span>  <b> <span class="bar"><%=tools %></span></b>
     <input type ="hidden" name="bath_tub" value="<%=tools %>" id="gong"></td>
     <div class="roww"></div>
     
     <span class="half"> 타일 시공 </span>  <b> <span class="bar"><%=bigtools %></span></b></label>
     <input type ="hidden" name="bath_tile" value="<%=bigtools %>" id="gong"></td>
     <div class="roww"></div>
     
       <span class="half"> 추가 옵션 </span>  <b> <span class="bar"> <%for(int i=0; i<chutools.length; i++){out.println(" " + chutools[i]);}%></span></b></label>
     <input type ="hidden" name="bath_option" value=" <%for(int i=0; i<chutools.length; i++){out.println(" " + chutools[i]);}%>"  id="gong"></td>
     <div class="roww"></div>

    
         <%
				if (isLogin) {
			%>
   
    <hr>
      <label for="title"><img width="15px"
               src="<%=request.getContextPath()%>/img/heart_none.png"> <b>이 견적서의 제목을 만들어 주세요</b> <img width="15px"
               src="<%=request.getContextPath()%>/img/heart_none.png"></label>
    <input type="text" placeholder=" 기억하기 쉬운 이름이 좋겠어요^.^" name="bath_title" id="title" > 
    <button type="submit" class="registerbtn">저장</button>     <% }%>
  </div>  
  
  
  <div class="container signin">
  <% if(isLogin) {%> 
    <a href="<%=request.getContextPath()%>/estimate/bath.jsp"><p>재견적하러가기</p></a>
     <a href="<%=request.getContextPath()%>/estimate/bath-list.jsp"><p>나의견적보기</p></a> <% } else { %>
       <a href="<%=request.getContextPath()%>/estimate/bath.jsp"><p>재견적하러가기</p></a><% } %>
  </div> 
  
</form>
</body>
</html>

   <jsp:include page="/template/footer.jsp"></jsp:include>
