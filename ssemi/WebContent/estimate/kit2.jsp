<%@page import="home.beans.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    request.setCharacterEncoding("UTF-8");
    String shape = request.getParameter("shape");
    String sizee = request.getParameter("sizee");
    String toptype = request.getParameter("toptype");
    String walltype = request.getParameter("walltype");
    String tile = request.getParameter("tile");
   String[] optionn = request.getParameterValues("optionn");
   
   int realprice =Integer.parseInt(request.getParameter("pricek"));
 
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
  background: #6A89B2;
  color: white;
  }
  
  
  .row-emptyy {
height: 100px; }


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
height:25px;
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

   <form action="savekit.do" method="post" >
  <div class="container">
    <%
				if (isLogin) {
			%>
    <p> <b><%=mdto.getMember_name()%>님의 주방 시공 예상 가격 </b> </p> 
    <hr><%} else{%> 
      <p>  주방 시공 예상 가격  </p>   <hr>   <%} %>

    <h1 class="barp"> <%=pricemin %> ~ <%=priceplus %> 만원 </h1>
   <input type="hidden" name="kit_price" value="<%=realprice%>">

    <hr>
    
       
   <span class="half"> 싱크대 형태 : </span><b> <span class="bar"><%=shape%></span></b>
     <input type ="hidden" name="kit_shape" value="<%=shape %>" id="shape">
        <div class="roww"></div>
     
           <span class="half"> 싱크대 가로 :</span><b>  <span class="bar"><%=sizee %></span></b>
     <input type ="hidden" name="kit_sinksize" value="<%=sizee %>" id="sizee">
          <div class="roww"></div>
     
         <span class="half"> 상판 유형 : </span><b> <span class="bar"><%=toptype %></span></b>
     <input type ="hidden" name="kit_toptype" value="<%=toptype %>" id="toptype">
      <div class="roww"></div>
      
       <span class="half">  도어 유형 : </span><b> <span class="bar"><%=walltype %></span></b>
     <input type ="hidden" name="kit_walltype" value="<%=walltype %>" id="walltype">
      <div class="roww"></div>
   
         <span class="half">  타일 시공:  </span><b> <span class="bar"><%=tile %></span></b>
     <input type ="hidden" name="kit_tile" value="<%=tile %>" id="tile">
      <div class="roww"></div>
     
         <span class="half">  추가 옵션: </span><b> <span class="bar"><%for(int i=0; i<optionn.length; i++){out.println(" " + optionn[i]);}%></span></b>
     <input type ="hidden" name="kit_option" value="<%for(int i=0; i<optionn.length; i++){out.println(" " + optionn[i]);}%>" id="optionn">
  <div class="roww"></div>
     
    
         <%
				if (isLogin) {
			%>
   
    <hr>
      <label for="title"> <b>이 견적서의 제목을 만들어 주세요</b> </label> 
    <input type="text" placeholder=" 예) 주방 견적서 " name="kit_title" id="title" > <br>
    <button type="submit" class="registerbtn">저장</button>     <% }%>
  </div>  
  
  
  <div class="container signin">
  <% if(isLogin) {%> 
  	
   <span class="barr">  <a href="<%=request.getContextPath()%>/estimate/kit.jsp">재견적하러가기</a> </span>
  <span class="barr">  <a href="<%=request.getContextPath()%>/estimate/kit-list.jsp">나의견적보기</a></span> <% } else { %>
    <span class="barr">   <a href="<%=request.getContextPath()%>/estimate/kit.jsp">재견적하러가기</a></span> <%} %>
   
 </div> 
  
</form>



 <div class="row-emptyy"></div>
 
 	 <div align="center">
<img width="50px" height="50px"
               src="<%=request.getContextPath()%>/image/kaka.PNG" style="margin-bottom:10px; border-radius: 5px;"> 
<br>
<span class="half"><b> 자세한 시공 견적 상담은 카카오톡 채널추가 후 문의 부탁드립니다. </b></span>
</div>

 <div class="roww"></div>

</body>
</html>

<jsp:include page="/template/footer.jsp"></jsp:include>
    
