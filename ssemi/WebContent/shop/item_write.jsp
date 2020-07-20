<%@page import="home.beans.dto.ItemDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <jsp:include page="/template/header.jsp"></jsp:include>   
     <link
	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
	<head>
    <style>
  * {
	box-sizing: border-box;
	font-family: 'Noto Sans KR', sans-serif;
}
.hello{
    border-collapse: collapse;
    }
.itsme td{
    
   width: auto;
    
    }
    th{
        background-color: #F6F6F6;   
    }
    input { width:100%; } 
  .noresize{
     resize: none; 
    }
</style>
<script>

</script>
</head>
<form action="item_write.do" method="post" enctype="multipart/form-data">
<%if(request.getParameter("item_no") != null){ %>
<input type="hidden" name="item_no" value="<%=request.getParameter("item_no")%>">
<%} %>
<br>
    <br>
    <br>
    <br>
    <br>
<div align="center">
	<h2>상품등록</h2>
	<!-- 테이블에 글 정보를 출력 -->
	<table border="1" class="hello itsme">
		<tbody>
			<tr>
			<th>상품명</th>
				<td><input type="text" name="item_name" required></td>
				
			</tr>
			<tr>


			<th>상품타입</th>
				<td><select name="item_kingtype" required >

					<option  value="욕실">욕실</option>
					<option  value="마루">마루</option>
					<option value="주방">주방</option>
				</select>
				<select id="yorksil" name="item_type" required>
					<option value="젠다이">[욕실]젠다이</option>
					<option value="선반">[욕실]선반</option>
					<option value="비데">[욕실]비데</option>
					<option value="환풍기">[욕실]환풍기</option>
					<option value="강마루">[마루]강마루</option>
					<option value="강화마루">[마루]강화마루</option>
					<option value="합판마루">[마루]합판마루</option>
					<option value="원목마루">[마루]원목마루</option>
					<option value="테이블">[주방]아일랜드 식탁</option>
					<option value="냉장고">[주방]냉장고장</option>
					<option value="선반">[주방]키큰장</option>
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
				<td><input type="file" name="item_file" multiple accept=".jpg, .png, .gif"></td>
			</tr>
			<tr>
			<th>상품설명</th>
				<td><textarea class="noresize"name="item_info" required rows="20" cols="100"></textarea></td>
			
		</tbody>
		<tfoot>
			<tr class="mi">
				<td colspan="2" align="right">
				<input type="submit" value="작성">
			</tr>
		</tfoot>
	</table>
</div>
</form>
<jsp:include page="/template/footer.jsp"></jsp:include>