<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="home.beans.dao.ItemDao"%>
<%@page import="home.beans.dto.ItemDto"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	ItemDao idao = new ItemDao();
	List<ItemDto> list = idao.getList();
%>

<html>
<body>
	<!-- 제목 -->
	
		<h2>상품리스트</h2>
	<div>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>아이템이름</th>
					<th>가격</th>
					<th>유형</th>
					<th width="50%">정보</th>
					<th>재고</th>
					<th>이미지</th>
					<th>시간</th>
				</tr>
			</thead>
			
			<tbody>
				<%-- list의 데이터를 하나하나 idto라는 이름으로 접근하여 출력 --%>
			
				
				<%
					for(ItemDto idto : list) {
				%>
				
				<tr>
					<td><%=idto.getItem_no()%></td>
					
					<td>
					<a href="item_info.do?item_no=<%=idto.getItem_no() %>">
					<%=idto.getItem_name()%>
					</a>
					</td>
					
					<td><%=idto.getItem_price()%></td>
					<td><%=idto.getItem_type()%></td>
					<td><%=idto.getItem_info()%></td>
					<td><%=idto.getItem_stock()%></td>
					<td><%=idto.getItem_image()%></td>
					<td><%=idto.getItem_date()%></td>
					<td>
						
					</td>
					
				</tr>
				
				<%
					}
				%>
			
			</tbody>	
		</table>
	</div>
</body>
</html>
