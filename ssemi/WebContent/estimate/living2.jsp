<%@page import="home.beans.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    request.setCharacterEncoding("UTF-8");
    String type = request.getParameter("type");
    String pattern = request.getParameter("pattern");
    String color = request.getParameter("color");
    String brand = request.getParameter("brand");
    
   
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
  padding: 16px;
  background-color: white;
}

.bar{
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
  }

input[type=text]{
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus {
  background-color: #ddd;
  outline: none;
}

hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}

.registerbtn {
  background-color: #4CAF50;
  color: white;
  padding: 16px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

.registerbtn:hover {
  opacity: 1;
}

.rowrow{
height:200px;
}


.signin {
  background-color: #f1f1f1;
  text-align: center;
}

</style>
</head>
<body>

<div class="rowrow"></div>

   <form action="saveliving.do" method="post" >
  <div class="container">
    <h1>마루 견적서</h1>
    <%
				if (isLogin) {
			%>
    <p><%=mdto.getMember_name()%>님의 견적서 입니다</p><%} else{ %>
       <p>Guest님의 견적서 입니다</p><%} %>
    <hr>
        
       <label for="title"><b> 가격 </b></label>
    <h2 class="bar"> <%=pricemin %> ~ <%=priceplus %> 만원 </h2>
   <input type="hidden" name="living_price" value="<%=realprice%>">

    <hr>
           <%
				if (isLogin) {
			%>
      <label for="title"><b>이 견적서의 제목을 만들어 주세요</b></label>
    <input type="text" placeholder=" ^.^ㅋ " name="living_title" id="title" > <%} %>
 
    <label for="type"><b> 시공할 마루 종류 : <span class="bar"><%=type%></span></b></label>
     <input type ="hidden" name="living_type" value="<%=type %>" id="type"></td>
     
         <label for="pattern"><b> 패턴 : <span class="bar"><%=pattern %></span></b></label>
     <input type ="hidden" name="living_pattern" value="<%=pattern %>" id="pattern"></td>
     
         <label for="color"><b> 수종 : <span class="bar"><%=color %></span></b></label>
     <input type ="hidden" name="living_color" value="<%=color %>" id="color"></td>
     
         <label for="brand"><b> 브랜드 : <span class="bar"><%=brand %></span></b></label>
     <input type ="hidden" name="living_brand" value="<%=brand %>" id="brand"></td>
     
  
    
    <hr>
    <p> 뀨 </p>

 	<%
				if (isLogin) {
			%>
    <button type="submit" class="registerbtn">저장</button>      <%} %>
  </div>
  
  <div class="container signin">
    <p>- 재견적하러가깅</p> 
    <p>- 나의 견적보기</p>
  </div>
</form>
</body>
</html>

   <jsp:include page="/template/footer.jsp"></jsp:include>
