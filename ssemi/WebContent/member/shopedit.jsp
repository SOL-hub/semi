<%@page import="home.beans.dto.ItemDto"%>
<%@page import="home.beans.dao.ItemDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	int item_no = Integer.parseInt(request.getParameter("item_no"));
	ItemDao idao = new ItemDao();
	ItemDto idto = idao.item_get(item_no);
%>

<jsp:include page="/template/header.jsp"></jsp:include>
<br>
<br>
<br>
<br>
<br>
<br>
<div align="center">
	
	<h2>게시글 수정</h2>
	

	<form action="shopedit.do" method="post">
	
		<input type="hidden" name="item_no" value="<%=item_no%>">
		
		<table border="1">
			<tbody>
				<tr>
					<th>이름</th>
					<td>
						<input type="text" name="item_name" size="70" required value="<%=idto.getItem_name()%>">
					</td>
				</tr>
				<tr>
				<th>가격</th>
				<td>
				<input type="text" name="item_price" size="70" required value="<%=idto.getItem_price()%>">
				</td>
				</tr>
				
				<tr>
				<th>수량</th>
				<td><input type="text" name="item_stock" size="70" required value="<%=idto.getItem_stock()%>">
				</tr>
				
				<tr>
					<th>설명</th>
					<td>
						<textarea name="item_info" required rows="15" cols="72"><%=idto.getItem_info()%></textarea>
					</td>  
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="수정">
					</td>
				</tr>
			</tfoot>
		</table>
		
	</form>
	
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>