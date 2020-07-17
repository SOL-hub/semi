<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<jsp:include page="/template/header.jsp"></jsp:include>

<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="../main.css">
	
	<style>
	    * {
        box-sizing: border-box;
        margin: 0px;
        padding: 0px;
        font-family: 'Noto Sans KR', sans-serif;
    }
        #container {
        width: 100%;
        display: flex;
        
        position: fixed;
        background-color: rgba(255, 255, 255, 0.95);
        height: 110px;
        padding-bottom:20px;
    }
        /* 카테고리 상세 */
    .menu_left_innerMenu {
    
        display: none;
        position: absolute;
        font-weight: normal;
        border: 1px solid #333;
        width: 70px;
        
        font-size: 12px;
        background-color: rgba(255, 255, 255, 0.95);
    }
	</style>
<article class="w-100">
	<div class="row">
		<h2 class="center"></h2>
	</div>
	<div class="row center">
		 <img	src="<%=request.getContextPath()%>/img/main_living.jpg" width="100%">
	</div>
</article>

<jsp:include page="/template/footer.jsp"></jsp:include>




