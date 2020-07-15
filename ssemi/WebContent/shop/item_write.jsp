<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form action="item_write.do" method="post">
<%if(request.getParameter("item_no") != null){ %>
<input type="hidden" name="item_no" value="<%=request.getParameter("item_no")%>">
<%} %>
<div align="center">
	<h2>상품등록</h2>
	<!-- 테이블에 글 정보를 출력 -->
	<table border="1" width="60%">
		<tbody>
			<tr>
			<th>상품명</th>
				<td><input type="text" name="item_name" required></td>
				
			</tr>
			<tr>
			<th>상품타입</th>
				<td><select name="item_type" required>
				<option value="침대">침대</option>
				<option value="책상">책상</option>
				<option value="의자">의자</option>
				<option value="소파">소파</option>
				</select>
				</td>
			</tr>
			<tr>
			<th>재고</th>
			<td><input type="text" name="item_stock" required></td>
			</tr>
			<tr>
			<th>상품가격</th>
				<td><input type="text" name="item_price" required></td>
			</tr>
			<tr>
			<th>상품이미지</th>
				<td><input type="file" name="item_image" multiple accept=".jpg, .png, .gif"></td>
			</tr>
			<tr>
			<th>상품설명</th>
				<td><textarea name="item_info" required rows="20" cols="100"></textarea></td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2" align="right">
				<input type="submit" value="작성">
			</tr>
		</tfoot>
	</table>
</div>
</form>
<jsp:include page="/template/footer.jsp"></jsp:include>