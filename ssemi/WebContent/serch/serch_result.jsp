<%@page import="java.util.ArrayList"%>
<%@page import="home.beans.dao.ItemDao"%>
<%@page import="java.util.List"%>
<%@page import="home.beans.dto.ItemDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>



<%
String keyword = request.getParameter("keyword");

ItemDao idao = new ItemDao();
List<ItemDto> list;

if( keyword == null ) {
	list = new ArrayList<>();
}else {
	list = idao.search(keyword);
}
%>
<style>
.container {
margin-top:150px;
}
#img1 {
width:17px;
height:16px;
}
</style>

    <meta charset="UTF-8">
    <title>상품결과_페이지</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bed_list.css">
    <link
	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
</head>
<body>
    <main>
    <div class="container">
            <p class="subject middle-font">
            <%if(keyword == null ) { %>
            	<P></P>
            <%} else if(list.isEmpty()){ %>
            	<p>검색 결과가 없습니다 </p>
            <%}else {%>
            <p><%=keyword%>검색결과</p>
            <%} %>
           
            <p><%=list.size() %>개의 상품이 검색 되었습니다.</p>
             <div class="ssmall-font xyz
       main_menu frt selected sort">

                    <span><a href="/item/list_desc.do">높은가격순</a></span>
                    <span><a href="/item/list_asc.do">낮은가격순</a></span>
                </div>
                <div class="ln4">
                <%for(ItemDto idto : list){ %>
                    <ul>

                        <li>
                            <p><img src="<%=request.getContextPath()%>/img/bath.jpg" width="100%"></p>
                            <p><span><%=idto.getItem_name()%></span><br><span><%=idto.getItem_info() %></span><br><span class="price"><%=idto.getItem_price() %>&nbsp;원</span></p>
                            <p class="icon"><a onclick="changeimg()">
                                    <img src="../img/heart_none.png" id="img1" >
                                </a></p>
                        </li>
                        <li>
                            <p><img src="https://placeimg.com/274/274" width="100%"></p>
                            <p><span>이름</span><br><span>설명</span><br><span class="price">0&nbsp;원</span></p>
                            <p class="icon"><a onclick="changeimg()">
                                    <img src="../img/heart_none.png" id="img1" >
                                </a></p>
                        </li>

                        <li>
                            <p><img src="https://placeimg.com/274/274" width="100%"></p>
                            <p><span>이름</span><br><span>설명</span><br><span class="price">0&nbsp;원</span></p>
                            <p class="icon"><a onclick="changeimg()">
                                    <img src="../img/heart_none.png" id="img1" >
                                </a></p>
                        </li>
            </ul>
            <%} %>
            </div>
            </div>
    </main>
</body>
</html>
<jsp:include page="/template/footer.jsp"></jsp:include>