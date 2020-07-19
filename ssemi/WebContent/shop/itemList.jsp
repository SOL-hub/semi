<%@page import="home.beans.dto.ItemFileDto"%>
<%@page import="home.beans.dao.ItemFileDao"%>
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
						ItemFileDao ifdao = new ItemFileDao();
						List<ItemFileDto> file_list = ifdao.getList(idto.getItem_no());
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
					<%if(!file_list.isEmpty()) {%>
					<%for(ItemFileDto ifdto : file_list){%>
					<td>
<%-- 					<a href="item_info.do?item_no=<%=idto.getItem_no() %>"> --%>
						<img src="<%=request.getContextPath()%>/member/download2.do?item_file_no=<%=ifdto.getItem_file_no()%>" width="100" height="100">
<!-- 					</a> -->
					</td>
					<%} %>
					<%} %>
					<td><%=idto.getItem_time()%></td>
					<td>
						
					</td>
					
				</tr>
				
				<%
					}
				%>				
				
				<tr>
					<td>
						<a href="<%=request.getContextPath()%>/shop/item_write.jsp">
						<input type="button" value="상품등록하기">
						</a>
					</td>
				</tr>
			</tbody>	
		</table>
	</div>
</body>
</html>
