<%@page import="home.beans.dao.KitDao"%>
<%@page import="home.beans.dao.MemberDao"%>
<%@page import="home.beans.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="home.beans.dto.KitDto"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
	MemberDto mdto = (MemberDto)session.getAttribute("userinfo");
	String kit_member = mdto.getMember_id();

	KitDao kdao = new KitDao();
	List<KitDto> list = kdao.getList(kit_member); 
	%>
	
<jsp:include page="/template/header.jsp"></jsp:include>

<!DOCTYPE html>

<head>
<meta charset="UTF-8">
<title> 주방 견적 내역</title>
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

		.row-emptt{
	height: 25px;
	}
	
	</style>
</head>
<body>
<div class="roww"></div>

<div class="menuu" align="center">
<a href="<%=request.getContextPath()%>/estimate/bath-list.jsp"> 욕실</a> 
 <a href="<%=request.getContextPath()%>/estimate/kit-list.jsp"><font color=#1778ba>주방</font></a>
 <a href="<%=request.getContextPath()%>/estimate/living-list.jsp">마루</a>
</div>

<div class="line">
<div class="main"> 
				
						
 <h2>주방 견적 내역</h2>
<span><b>인테리어 코디가 상담부터 시공까지 1:1 밀착 관리합니다.<br>
고객님에게 딱 맞는 인증된 전문가와 함께 인테리어를 완성하세요.
</b></span>
 <div class="row-emptt"></div>
<img align="center" width="50px" height="50px"
               src="<%=request.getContextPath()%>/image/kaka.PNG" style="margin-bottom:10px; border-radius: 5px;"> 
<br>
<span class="half"><b> 자세한 시공 견적 상담은 카카오톡 채널추가 후 문의 부탁드립니다. </b></span>

 <div class="row-emptyy"></div>
<div align="center">
<table>
  <tr>
    <th>Title</th>
    <th>Price</th>
    <th>Date</th>
  </tr>
  <%for(KitDto kdto : list ){ %>
			<tr>
			<td>
					
			<% if( kdto.getKit_title()==null) { %>		
			<a href="kit-content.jsp?kit_no=<%= kdto.getKit_no()%>">
			 욕실견적서	 
			<%} else { %>
				<a href="kit-content.jsp?kit_no=<%= kdto.getKit_no()%>">
				<%=kdto.getKit_title()%>  <%} %>  </td>
 
    <td><a href="kit-content.jsp?kit_no=<%= kdto.getKit_no()%>">
						<%=kdto.getKit_price()%>
					</a> </td>
                    <td>
                    <%=kdto.getKit_autotime()%></td>
			</tr>
			<%} %>
 
  <tr>
    <td colspan="3">  <div class="bttn" ><a href="kit.jsp">
						<input class="btn" type="button" value="주방 견적 받으러 가볼까요?"> </a></div> </td>
  </tr>
</table>

	</div>
					

 	 <div class="row-emptyy"></div>
</body>

<jsp:include page="/template/footer.jsp"></jsp:include>

