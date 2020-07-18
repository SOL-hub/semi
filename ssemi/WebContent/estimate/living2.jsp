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
  
  .barr {
  margin: 15px 20px 15px 20px;
  font-size: 20px;
    }
    
  .barr:hover{
    text-decoration: underline;
  }

.barp{
  width: 70%;
  padding: 15px;
  margin: 15px 0 15px 25px;
  display: inline-block;
  
  border-radius:5px;
  background: black;
  color: white;
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
height:20px;
}


.signin {
  background-color: #f1f1f1;
  text-align: center;
  font-size:15px;
}

.half {
  background: linear-gradient(to top, #EAE2E5  40%, transparent 50%);
}

.halfyellow{
  background: linear-gradient(to top, #fffb00 40%, transparent 50%);
}

</style>
</head>
<body>

<div class="rowrow"></div>

   <form action="saveliving.do" method="post" >

   <div class="container">
    <%
				if (isLogin) {
			%>
    <p> <b><%=mdto.getMember_name()%>님의 마루 시공 예상 가격 </b> </p> 
    <hr><%} else{%> 
      <p>  마루 시공 예상 가격  </p>   <hr>   <%} %>

    <h1 class="barp"> <%=pricemin %> ~ <%=priceplus %> 만원 </h1>
   <input type="hidden" name="living_price" value="<%=realprice%>">

    <hr>
 
      <span class="half"> 마루 종류 :  </span>  <b> <span class="bar"><%=type %></span> </b>
     <input type ="hidden" name="living_type" value="<%=type%>" >
     <div class="roww"></div>
    
    	
      <span class="half"> 패턴 : </span>  <b> <span class="bar"><%=pattern %></span> </b>
     <input type ="hidden" name="living_pattern" value="<%=pattern%>" >
     <div class="roww"></div>
    
           <span class="half"> 수종 :  </span>  <b><span class="bar"><%=color %></span></b>
     <input type ="hidden" name="living_color" value="<%=color %>" id="color">
       <div class="roww"></div>
       
        <span class="half">브랜드 : </span>  <b><span class="bar"><%=brand %></span></b>
     <input type ="hidden" name="living_brand" value="<%=brand %>" id="brand">
    
    
     <div class="roww"></div>
     
    
         <%
				if (isLogin) {
			%>
   
    <hr>
      <label for="title"> <b>이 견적서의 제목을 만들어 주세요</b> </label>
    <input type="text" placeholder=" 예) 마루 견적서 " name="living_title" id="title" > 
    <button type="submit" class="registerbtn">저장</button>     <% }%>
  </div>  
  
  
  <div class="container signin">
  <% if(isLogin) {%> 
  	
   <span class="barr">  <a href="<%=request.getContextPath()%>/estimate/kit.jsp">재견적하러가기</a> </span>
  <span class="barr">  <a href="<%=request.getContextPath()%>/estimate/kit-list.jsp">나의견적보기</a></span> <% } else { %>
   <span class="barr">   <a href="<%=request.getContextPath()%>/estimate/kit.jsp">재견적하러가기</a></span> <%} %>
   
 </div> 
  
</form>
<div class="roww"> </div>
    
<div align="center">  
<div class="roww"> </div>
               <img width="70%"
               src="<%=request.getContextPath()%>/image/kit.PNG" style="margin-top:-15px"> 
                     <img width="70%"
               src="<%=request.getContextPath()%>/image/kit2.PNG" style="margin-top:-15px"> 
</div>
</body>
</html>

<jsp:include page="/template/footer.jsp"></jsp:include>
    