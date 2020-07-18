<%@page import="home.beans.dto.EstimateDto"%>
<%@page import="home.beans.dao.EstimateDao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="home.beans.dto.MemberDto"%>
<%@page import="home.beans.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	int bath_no = Integer.parseInt(request.getParameter("bath_no"));

	EstimateDao edao = new EstimateDao();
	
	EstimateDto edto = edao.get(bath_no); 
	
	MemberDto user = (MemberDto) session.getAttribute("userinfo");
	
	
	// - 내글 : 게시글(edto)의 작성자와 로그인 된 사용자(user)의 아이디가 같아야 함
	boolean isMine = user.getMember_id().equals(edto.getBath_member()); 
	boolean isAdmin = user.getMember_auth().equals("관리자");
	
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

.dele{
padding: 20px;
font-size:18px;

}
</style>

</head>
<body>
<div class="rowrow"></div>

 <div class="container">
  <span class="half"> 제목 </span>  <b> <span class="bar">
  
    <% if( edto.getBath_title()==null) { %>		
			 욕실견적서	 
			<%} else { %>
				<%=edto.getBath_title()%>  <%} %> </span> </b>
				
    <div class="roww"></div>
     <hr>
     
     
      <p> <b>욕실 시공 예상 가격</b>   </p>  
    <h1 class="barp"> <%=edto.getBath_price()%> 만원 </h1>

    <hr>
    

     <button id="myBtn">공용거실</button>   <b> <span class="bar"><%=edto.getBath_cnt() %></span> </b>
     <div class="roww"></div>
     
        <span class="half"> 소형(안방) </span>  <b>  <span class="bar"><%=edto.getBath_cntt()%></span></b>
     <div class="roww"></div>
     
         <span class="half"> 욕실 유형 </span>  <b> <span class="bar"><%=edto.getBath_tub()%></span></b>
     <div class="roww"></div>
     
     <span class="half"> 타일 시공 </span>  <b> <span class="bar"><%=edto.getBath_tile()%></span></b>
     <div class="roww"></div>
     
     <span class="half"> 추가 옵션 </span>  <b> <span class="bar"> <%=edto.getBath_option()%></span></b>
     <div class="roww"></div>

   
  </div>  
  
  
  <div class="container signin">
  <%if(isAdmin || isMine){ %>
<a href="<%=request.getContextPath()%>/estimate/bathdelete.do?bath_no=<%=bath_no%>"> <span class="dele">삭제</span></a> l
     <a href="<%=request.getContextPath()%>/estimate/bath-list.jsp"><span class="dele">목록</span>  </a> <% }%>
<div class="roww"></div>
  </div> 
     <div class="roww"></div>
     
     <div class="roww"> </div>
    
<div align="center">
     <div class="roww"> </div>
     
<img width="70%"
               src="<%=request.getContextPath()%>/img/shoo.PNG" style="margin-top:-15px"> 
               <img width="70%"
               src="<%=request.getContextPath()%>/img/kit.PNG" style="margin-top:-15px"> 
                     
               </div>
               
   

</body>
</html>

<jsp:include page="/template/footer.jsp"></jsp:include>
