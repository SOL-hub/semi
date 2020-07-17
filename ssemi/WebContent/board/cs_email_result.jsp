<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <jsp:include page="/template/header.jsp"></jsp:include>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
	<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/admin.css">
	<style>
		h1{
			color: #AAAAAA;
			margin-top:200px;
			margin-bottom: 100px;
			text-align: center;
			
		}
		
		#email_result_a{
		
			
			margin-left: 920px;
		}
		
		strong {
			font-size: 17px;
		}
		
		
	</style>
	</head>
	<body>
		
		
		
		<h1>메일 발송이 완료되었습니다</h1>
		
		
		<a id="email_result_a" href="<%=request.getContextPath()%>/index.jsp"><strong style="color: #C80A1E">메인으로</strong></a>
		
	</body>
	

	    <jsp:include page="/template/footer.jsp"></jsp:include>