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

   <form action="savekit.do" method="post" >
  <div class="container">
    <h1>주방 견적서</h1>
    <%
				if (isLogin) {
			%>
    <p><%=mdto.getMember_name()%>님의 견적서 입니다</p><%} else{ %>
       <p>Guest님의 견적서 입니다</p><%} %>
    <hr>
        
       <label for="title"><b> 가격 </b></label>
    <h2 class="bar"> <%=pricemin %> ~ <%=priceplus %> 만원 </h2>
   <input type="hidden" name="kit_price" value="<%=realprice%>">

    <hr>
           <%
				if (isLogin) {
			%>
      <label for="title"><b>이 견적서의 제목을 만들어 주세요</b></label>
    <input type="text" placeholder=" ^.^ㅋ " name="kit_title" id="title" > <%} %>
 
    <label for="shape"><b> 싱크대 형태 : <span class="bar"><%=shape%></span></b></label>
     <input type ="hidden" name="kit_shape" value="<%=shape %>" id="shape"></td>
     
         <label for="size"><b> 싱크대 가로사이즈 : <span class="bar"><%=sizee %></span></b></label>
     <input type ="hidden" name="kit_sinksize" value="<%=sizee %>" id="sizee"></td>
     
         <label for="toptype"><b> 상판 유형 : <span class="bar"><%=toptype %></span></b></label>
     <input type ="hidden" name="kit_toptype" value="<%=toptype %>" id="toptype"></td>
     
         <label for="walltype"><b> 도어 유형 : <span class="bar"><%=walltype %></span></b></label>
     <input type ="hidden" name="kit_walltype" value="<%=walltype %>" id="walltype"></td>
     
   
         <label for="tile"><b> 타일 시공: <span class="bar"><%=tile %></span></b></label>
     <input type ="hidden" name="kit_tile" value="<%=tile %>" id="tile"></td>
     
     
         <label for="option"><b> 추가 옵션: <span class="bar"><%for(int i=0; i<optionn.length; i++){out.println(" " + optionn[i]);}%></span></b></label>
     <input type ="hidden" name="kit_option" value="<%for(int i=0; i<optionn.length; i++){out.println(" " + optionn[i]);}%>" id="optionn"></td>


    
    
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
