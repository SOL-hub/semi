<%@page import="home.beans.dto.ItemDto"%>
<%@page import="home.beans.dao.ItemDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	
	ItemDao idao = new ItemDao();
	ItemDto idto = new ItemDto();
	
	
%>     
    <jsp:include page="/template/header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상품</title>
</head>
<body>
	<table text-align="center">
		<tbody>
		<tr>
		<td>[<%=idto.getItem_type()%>]</td>
		<td>[<%=idto.getItem_name()%>]</td>
		</tr>
		<tr>
		<td><%=idto.getItem_price()%></td>
		</tr>
		<tr>
		<td><%=idto.getItem_time()%></td>
		</tr>
		<tr>
		<td><%=idto.getItem_info()%></td>
		</tr>
		<tr>
		<td><%=idto.getItem_image()%></td>
		</tr>
		</tbody>
	</table>
	<a href="#"><input type="button" value="삭제"></a>
</body>
</html> 
<jsp:include page="/template/footer.jsp"></jsp:include>  
