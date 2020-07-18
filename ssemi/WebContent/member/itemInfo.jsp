<%@page import="home.beans.dto.ItemFileDto"%>
<%@page import="home.beans.dao.ItemFileDao"%>
<%@page import="home.beans.dao.MemberDao"%>
<%@page import="home.beans.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="home.beans.dao.ItemDao"%>
<%@page import="home.beans.dto.ItemDto"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	


	
	ItemDto idto = (ItemDto)request.getSession().getAttribute("iteminfo");//idto애들 불러오기위해 필요
	ItemFileDao ifdao = new ItemFileDao();
	List<ItemFileDto> file_list = ifdao.getList(idto.getItem_no());

%>
<script>
	function checkAdd() {
		
// 		alert("추가되었습니다.");
	}
</script>
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
			
				
				
				<form method="post">
				<tr>
					<td><%=idto.getItem_no()%></td>
					<td><%=idto.getItem_name()%></td>
					<td><%=idto.getItem_price()%></td>
					<td><%=idto.getItem_type()%></td>
					<td><%=idto.getItem_info()%></td>
					<td><%=idto.getItem_stock()%></td>
					<%for(ItemFileDto ifdto : file_list){%>
					<td>
						<img src="download2.do?item_file_no=<%=ifdto.getItem_file_no()%>" width="100" height="100">
					</td>
					<%} %>
					<td><%=idto.getItem_time()%></td>
				

				<td>
				<input type="submit" formaction="cart_add.do" value="장바구니에 넣기" onclick="checkAdd();">
				<input type="submit" formaction="wish_add.do" value="찜등록" onclick="checkAdd();">
				<a href="<%=request.getContextPath()%>/member/check_pw.jsp?go=<%=request.getContextPath()%>/member/delete.do?item_no=<%=idto.getItem_no()%>"><input type="button" value="삭제"></a>
				<a href="shopedit.jsp?item_no=<%=idto.getItem_no()%>">
				<input type="button" value="수정"></a>
				</td>

					
				</tr>
				</form>
				
			
			</tbody>	
		</table>
	</div>
</body>
</html>
