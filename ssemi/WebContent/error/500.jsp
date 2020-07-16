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
        <h1 class="error_title">페이지 오류</h1>
        <p class="error_sorry"><b>현재 서비스의 상태가 원할하지 않습니다</b></p>
        <p class="error_content"> 잠시 후 해당 서비스를 이용해주시기 바랍니다</p>
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