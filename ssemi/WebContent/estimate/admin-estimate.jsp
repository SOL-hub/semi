<%@page import="home.beans.dao.LivingDao"%>
<%@page import="home.beans.dto.LivingDto"%>
<%@page import="home.beans.dto.KitDto"%>
<%@page import="home.beans.dao.KitDao"%>
<%@page import="home.beans.dao.EstimateDao"%>
<%@page import="home.beans.dao.MemberDao"%>
<%@page import="home.beans.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="home.beans.dto.EstimateDto"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
	MemberDto mdto = (MemberDto)session.getAttribute("userinfo");
 
	EstimateDao edao = new EstimateDao();
	List<EstimateDto> list = edao.getList();
	KitDao kdao = new KitDao();
	List<KitDto> listt = kdao.getList();
	LivingDao ldao = new LivingDao();
	List<LivingDto> listl = ldao.getList();
	
	%>
	
<jsp:include page="/template/header.jsp"></jsp:include>

<!DOCTYPE html>

<head>
<meta charset="UTF-8">
<title> 욕실 견적 내역</title>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">

	
	<style>
	
   :root {
	--white: #ffffff;
	--light: #f0eff3;
	--black: #000000;
    --bblack: #424242;
	--dark-blue: #1f2029;
	--dark-light: #353746;
	--red: #6A89B2  ;
	--yellow: #C5C5D7;
	--grey: #ecedf3;
}
	
* {
   box-sizing: border-box;
   font-family: 'Noto Sans KR', sans-serif;
   
}

.main {
  padding: 40px 0 0 0;
  text-align:center;

  
}

	    .line {
        position: relative;
width: 100%;
display: inline-block;
padding: 0;
margin: 0 auto;
text-align: center;
margin: 17px 0;
height: 1px;
        background-image: linear-gradient(298deg, var(--red), var(--yellow));
    }
    
	.menuu a {
    margin-top: 10px;
    margin-bottom: 10px;
    padding: 12px 10px 12px 10px;
    text-decoration: none;
    font-size: 16px;
    color: #C5C5D7;
    display: inline;
    text-align: center;
    font-weight: 900;
    cursor:pointer;

}
.menuu a:hover {
  color: #1778ba;

}
	
	
	
	
	
.btn {
  background-color: #6A89B2;
  border-radius:5px;
  border: none;
  color: white;
  padding: 16px 32px;
  text-align: center;
  font-size: 16px;
  margin: 4px 2px;
  transition: 0.3s;
}

.btn:hover {
  background-color: #ddd; 
  color: white;
}

.roww {
height:130px;
}

.h2 {
        font-size: 28px;
      line-height: 50px;
      font-weight:700;
      text-align: center;
    }
	
	.titlee{
padding-bottom:15px;
text-align:center;
}
	
	.row-emptyy{
	height: 40px;
	}
	 .half {
  background: linear-gradient(to top, #adfff3 40%, transparent 50%);
 
}

table {
  border-collapse: collapse;
  width: 70%;
  
}

th, td {
  padding: 8px;
  text-align: center;
  border-bottom: 1px solid #ddd;
}

tr:hover {background-color:#f5f5f5;}

.bttn{
text-align:center;
margin: 20px 0 20px 0;
}



	</style>
</head>
<body>
<div class="roww"></div>

<div class="menuu" align="center">
</div>

<div class="line">
<div class="main"> 
				
						
    
    <h2>욕실 견적 내역</h2>
 <div class="row-emptyy"></div>

<div align="center">
<table>
  <tr>
    <th>Title</th>
    <th>Writer</th>
    <th>Price</th>
    <th>Date</th>
  </tr>
  
  <%for(EstimateDto edto : list ){ %>
			<tr>
			<td>
					
			<% if( edto.getBath_title()==null) { %>		
			<a href="bath-content.jsp?bath_no=<%= edto.getBath_no()%>">
			 욕실견적서	 
			<%} else { %>
				<a href="bath-content.jsp?bath_no=<%= edto.getBath_no()%>">
				<%=edto.getBath_title()%>  <%} %>  </td>
 
 <td>	<a href="bath-content.jsp?bath_no=<%= edto.getBath_no()%>"> <%=edto.getBath_member()%></td>
    <td><a href="bath-content.jsp?bath_no=<%= edto.getBath_no()%>">
						<%=edto.getBath_price()%>
					</a> </td>
                    <td>
                    <%=edto.getBath_autotime()%></td>
			</tr>
			<%} %>
 
</table>
	</div>
	 <div class="row-emptyy"></div>

<div class="line">
<div class="main"> 
				
						
    
    <h2>주방 견적 내역</h2>
 <div class="row-emptyy"></div>
<div align="center">
<table>
 <tr>
 <th>Title</th>
    <th>Writer</th>
    <th>Price</th>
    <th>Date</th>
  </tr>
  <%for(KitDto kdto : listt ){ %> 
			<tr>
			<td>
			<% if( kdto.getKit_title()==null) { %>		
			<a href="kit-content.jsp?kit_no=<%= kdto.getKit_no()%>">
			 욕실견적서	 
			<%} else { %>
				<a href="kit-content.jsp?kit_no=<%= kdto.getKit_no()%>">
				<%=kdto.getKit_title()%>  <%} %>  </td>
   <td><a href="kit-content.jsp?kit_no=<%= kdto.getKit_no()%>">
						<%=kdto.getKit_member()%>
 </td>
    <td><a href="kit-content.jsp?kit_no=<%= kdto.getKit_no()%>">
						<%=kdto.getKit_price()%>
					</a> </td>
                    <td>
                    <%=kdto.getKit_autotime()%></td>
			</tr>
			<%} %>
 
</table>
	</div>
				 <div class="row-emptyy"></div>	
	
					<div class="line">
<div class="main"> 
				
						
    
    <h2>마루 견적 내역</h2>
 <div class="row-emptyy"></div>

<div align="center">
<table>
 <tr>
 <th>Title</th>
    <th>Writer</th>
    <th>Price</th>
    <th>Date</th>
  </tr>
  <%for(LivingDto ldto : listl ){ %> 
			<tr>
			<td>
					
			<% if( ldto.getLiving_title()==null) { %>		
			<a href="living-content.jsp?living_no=<%= ldto.getLiving_no()%>">
			 욕실견적서	 
			<%} else { %>
				<a href="living-content.jsp?living_no=<%= ldto.getLiving_no()%>">
				<%=ldto.getLiving_title()%>  <%} %>  </td>
				   <td><a href="living-content.jsp?living_no=<%= ldto.getLiving_no()%>">
						<%=ldto.getLiving_member()%>
					</a> </td>
 
    <td><a href="living-content.jsp?living_no=<%= ldto.getLiving_no()%>">
						<%=ldto.getLiving_price()%>
					</a> </td>
                    <td>
                    <%=ldto.getLiving_autotime() %></td>  
			</tr>
			<%} %>
 
</table>

	</div>
					
					



</body>
</html>
<jsp:include page="/template/footer.jsp"></jsp:include>
