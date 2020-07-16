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
	List<EstimateDto> list = edao.getList(bath_member);   %>
	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>



</style>
</head>
<body>

<table border="1" width="90%">
		<thead>
			<tr>
				<th>번호</th>
				<th width="40%">가격</th>
	
				<th>작성일</th>
			
	
			</tr>
		</thead>
		<tbody align="center">
			<%-- list의 데이터를 하나하나 edto라는 이름으로 접근하여 출력 --%>
			<%for(EstimateDto edto : list ){ %>
			<tr>
				<td> 제목(코드은 나중에 넣음)</td>
				<td align="left">
					
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
				<td colspan="8" align="right">
					<a href="bath.jsp">
						<input type="button" value="견적받으러가깅">
					</a>
				</td>
			</tr>
		</tfoot>
	</table>
	
	<!--  솔아 여기밑이양 미안해ㅜㅜ정신업어섴ㅋㅋㅋ -->

</body>
</html>