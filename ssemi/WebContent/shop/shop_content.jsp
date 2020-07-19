<%@page import="home.beans.dto.ItemDto"%>
<%@page import="home.beans.dao.ItemDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
   <style>
   *{
   box-sizing: border-box;
	font-family: 'Noto Sans KR', sans-serif;
   }
    .center{
        text-align:center;
       }
       .qwe{
       position:absolute;
       margin: -1px 0px 0px 660px;
      
       }
       .qwer{
       position:absolute;
       margin: -1px 0px 0px 655px;
       }
       .zip{
       position: relative;
       margin: 0px 35px 0px 0px;
       }
    </style>
    <div class="center">	
	<h2>게시글 등록에 성공 하였습니다</h2>
	<br></br>
	<div class="qwer">
	<img src="<%=request.getContextPath()%>/img/emoji.png" width="25px"></div><a href="<%=request.getContextPath()%>/shop/itemList.jsp">아이템 리스트로 가기</a>
	</div>
	<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<jsp:include page="/template/footer.jsp"></jsp:include>  
