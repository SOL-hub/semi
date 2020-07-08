<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/cs.css">

<body>
    <div id="container2">
        <div class="top">
            <p class="top_title"><b>고객센터 안내</b></p>
            <p class="top_content">서비스 및 다양한 문의를 편리하게 경험하실 수 있습니다.</p>
        </div>
        <div class="body">
            <li class="body_qna"><img src="<%=request.getContextPath() %>/img/qna.png" width="60px"></li>
        </div>
        <article class="cs_time">
            <div class="cs_body">
                <h1 class="cs_time_title">고객센터 운영시간</h1>
                <dl class="cs_time_detail">
                    <dt>평일</dt>
                    <dd>9:30 ~ 17:30 ( 점심시간 12:30 ~ 13:30 )</dd>
                </dl>
                <dl class="cs_time_detail">
                    <dt>토요일</dt>
                    <dd>9:30 ~ 12:30 ( 쇼핑몰 구매상담 제외 )</dd>
                </dl>
                <strong class="cs_time_holiday" style="color: #C80A1E">일요일 및 법정 공휴일 휴무 </strong>
            </div>
            <hr class="cs_time_line">            
            <div class="cs_bottom">
                <li class="cs_phone">1544-9940</li>
                <li class="cs_phone_notice">전화로 문의 시 월, 화요일 / 공휴일 다음날은 상담전화가 많아 일정이 다소 지연될 수 있습니다.</li>
            </div>
        </article>
    </div>
</body>


<jsp:include page="/template/footer.jsp"></jsp:include>
