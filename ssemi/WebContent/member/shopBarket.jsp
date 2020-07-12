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
<head>
	<script>
		function cart_all(){
			var selectAll = document.querySelector(".cart_all_click").checked;
			var selectCart = document.getElementsByName("cart_no");
			
			for(var i=0; i<selectCart.length; i++){
				selectCart[i].checked = selectAll;
			}
		}
		
// 		function cart_total_price(){
// 	        var cart_price = document.getElementsByName("input[name=cart_no]").value;
// 	        var total_price = document.querySelector(".total_price");
	        
// 	        var total = 0;
// 	        var price = new Array();
	        
// 	        for(var i=0; i<cart_price.length; i++){
// 	        	 price[k] = parseInt(cart_price);
// 	             k++;
// 	        }
	        
// 	        for(var i=0; i<price.length; i++){
	        	
// 	        total_price.textContent = total + price[i];
	        
// 	        }
// 	    }
	</script>
</head>
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
				<table>
				
				<%-- list의 데이터를 하나하나 idto라는 이름으로 접근하여 출력 --%>
				<form action="barket_delete.do">
				<tr>
					<td>
						<input type="checkbox" class="cart_all_click" onchange="cart_all();">전체선택
					</td>
				</tr>
				<%
				
					int total_price = 0;
					int delivery_cost = list.size() * 2500;
					for(CartDto cdto : list) {
					// cdto.getCar_item() 으로 상품 테이블을 조회해서 이름을 반환하는 메소드를 여기서 호출
					ItemDao idao = new ItemDao();
					ItemDto itemName = idao.item_get(cdto.getCart_item_name());
					
					 total_price += itemName.getItem_price();
					
				%>
				
				<tr>
					<td><input type="checkbox" name="cart_no" value="<%=cdto.getCart_no()%>"></td>
					<td><%=itemName.getItem_name()%></td>
					<td>
					<%=itemName.getItem_price()%>원
					</td>
					<td><%=itemName.getItem_type()%></td>
					<td><%=itemName.getItem_info()%></td>
						
					<td><%=cdto.getCart_no()%></td>
				</tr>
				
				<%
					}
					
				
				%>
				<tr>
				<td>
						<input type="submit" value="삭제">
					</td>
					<td>
						총가격 : <%=total_price %>
					</td>
					</tr>
				</form>	
				</table>
			</tbody>
		</table>
	</div>
</body>
</html>