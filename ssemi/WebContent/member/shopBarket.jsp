<%@page import="home.beans.dto.MemberDto"%>
<%@page import="home.beans.dto.CartDto"%>
<%@page import="home.beans.dao.CartDao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="home.beans.dao.ItemDao"%>
<%@page import="home.beans.dto.ItemDto"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	MemberDto mdto = (MemberDto)request.getSession().getAttribute("userinfo");
	int cart_member = mdto.getMember_no();
	CartDao cdao = new CartDao();
	List<CartDto> list = cdao.getList(cart_member);
%>

<html>
<body>
	<!-- 제목 -->
	
		<h2>장바구니</h2>
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
					for(CartDto cdto : list) {
					// cdto.getCar_item() 으로 상품 테이블을 조회해서 이름을 반환하는 메소드를 여기서 호출
					ItemDao idao = new ItemDao();
					ItemDto itemName = idao.item_get(cdto.getCart_item());
				%>
				<tr>
					<td><%=itemName.getItem_name()%></td>
					<td><%=itemName.getItem_name()%></td>
					<td><%=itemName.getItem_price()%></td>
					<td><%=itemName.getItem_type()%></td>
					<td><%=itemName.getItem_info()%></td>	
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>
