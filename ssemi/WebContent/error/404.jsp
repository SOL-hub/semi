<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <jsp:include page="/template/header.jsp"></jsp:include>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/error.css">

<!--에러 메시지 본문-->
<div class="error_main">

    <div class="error_box">
        <h1 class="error_title">페이지를 찾을 수 없습니다</h1>
        <p class="error_sorry"><b>불편을 드려</b>죄송합니다</p>
        <p class="error_content">찾을 수 없는 페이지 입니다. 요청하신 페이지가 사라졌거나, 잘못된 경로를 이용하셨습니다.</p>
    </div>

    <div class="error_img_box">
        <div class="error_img"><img src="<%=request.getContextPath() %>/img/error.png" class="error_img">
        </div>
    </div>
    <div id="go_main">
        <a href="<%=request.getContextPath()%>/index.jsp" class="go_main_content">
            <span class="go_main_click">메인으로 이동 </span>
        </a>
    </div>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>