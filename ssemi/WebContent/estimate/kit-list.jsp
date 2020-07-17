<%@page import="home.beans.dao.EstimateDao"%>
<%@page import="home.beans.dao.MemberDao"%>
<%@page import="home.beans.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="home.beans.dto.EstimateDto"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
	MemberDto mdto = (MemberDto)session.getAttribute("userinfo");
	String bath_member = mdto.getMember_id();

	EstimateDao edao = new EstimateDao();
	List<EstimateDto> list = edao.getList(bath_member); 
	%>
	
<jsp:include page="/template/header.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 욕실견적내역</title>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/bath-list.css">
	
	<style>
	
	.btn {
  background-color: #6A89B2;
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
	
	</style>
</head>
<body>
<main>

<!-- 여기부터하기 -->

<h1>내 "욕실 시공" 견적내역  </h1>
<a href="<%=request.getContextPath()%>/estimate/bath-list.jsp"> 욕실 </a>
 <a href="<%=request.getContextPath()%>/estimate/kit-list.jsp"> 주방 </a>
 <a href="<%=request.getContextPath()%>/estimate/living-list.jsp">마루 </a>
     
 <hr>
 <!--테이블 시작-->
 <div class="row-empty"></div>
 <a href="bath.jsp">
						<input class="btn" type="button" value="욕실 견적 받으러 가볼까요?"> </a>
<div class = table-wrap>
<table border="1" width="90%"  align="center">
		<thead>
		<tr>
	<th colspan="3"> 욕실 견적 모음 </th>
		</tr>
			<tr>
				<th> Name </th>
				<th width="40%">Price</th>
				<th>Date</th>
			</tr>
		</thead>
		
		<tbody>
			<%-- list의 데이터를 하나하나 edto라는 이름으로 접근하여 출력 --%>
			<%for(EstimateDto edto : list ){ %>
			<tr>
			<td>
			<a href="bath-content.jsp?bath_no=<%= edto.getBath_no()%>">
				<%=edto.getBath_title() %> </td> 
		<%-- 수정중입니당
			<% if( edto.getBath_title()==null) { %>
			<a href="bath-content.jsp?bath_no=<%= edto.getBath_no()%>">
			 욕실견적서
			<%}else{ %>
				<a href="bath-content.jsp?bath_no=<%= edto.getBath_no()%>">
				<%=edto.getBath_title() %> </td> <%} %> 
				 --%>
				
				<td align="center">
					
					<!-- 가격 -->
					<a href="bath-content.jsp?bath_no=<%= edto.getBath_no()%>">
						<%=edto.getBath_price()%>
					</a>
									
				</td>
		<!-- 작성일 -->
				<td><%=edto.getBath_autotime()%></td>
			</tr>
			<%} %>
		</tbody>
		
		<tfoot>
			<tr>
			
	<td colspan="3"> 수정중입니다
					
				</td>
			
			</tr>
			
		</tfoot>
	</table>
	</div>
	
	
	<!--추천상품-->

	<div class = "img-wrap">
	    <h5 style= font-size:20px; width:1000px;>함께 사면 좋은 제품 추천</h5>
    <hr class="hr-twolow">
    <!--제품관련 스타일-->
    <ul>
    <li><img class="img-shadow" src="https://placehold.it/180x180?text=TEST1" ><h5>넘편해소파<br>130,000</h5></li>
   
        <li><img class="img-shadow" src="https://placehold.it/180x180?text=TEST2"><h5>2인용인듯한침대<br>26,000,000</h5></li>
    
        <li><img class="img-shadow" src="https://placehold.it/180x180?text=TEST3"><h5>계속앉고파의자<br>4,560,000</h5></li>
    
        <li><img class="img-shadow" src="https://placehold.it/180x180?text=TEST4"><h5>세상포근쿠션<br>25,000</h5></li>
        
        <li><img class="img-shadow" src="https://placehold.it/180x180?text=TEST4"><h5>우리아들책상<br>95,000</h5></li>
    
    <li><img class="img-shadow" src="https://placehold.it/180x180?text=TEST4"><h5>이가격에이가죽소파<br>670,000,000</h5></li>
    </ul>
</div>
</div>

</main>
</body>

<jsp:include page="/template/footer.jsp"></jsp:include>
