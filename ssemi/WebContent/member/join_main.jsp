<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <jsp:include page="/template/header.jsp"></jsp:include>  
 <link

	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@300&display=swap"

	rel="stylesheet">

    <link rel=stylesheet type="text/css" href="<%=request.getContextPath() %>/css/base.css">
    <link rel=stylesheet type="text/css" href="<%=request.getContextPath() %>/css/join_main.css?ver=1">
    <style>
* {
	box-sizing: border-box;
	margin: 0px;
	padding: 0px;
	font-family: 'Noto Sans KR', sans-serif;
	letter-spacing: -1.5px;
}
    </style>
    <script>
    
    </script>
     
</head>
	<body>
    <main>
        <article>
           <div class="row-empty"></div>
           <div class="row-empty"></div>
            <div class="center head">
                회원가입
            </div>
            <div class="row-empty"></div>
            <div class="row-empty"></div>
            <div class="line-bottom center">
               <ul>
                  <li>가입</li> 
                  <li>약관동의</li> 
                  <li>정보입력</li> 
                  <li>가입완료</li> 
               </ul>
               <div class="row-empty"></div>
            </div>
            <div class="row-empty"></div>
            <div class="row-empty"></div>
            <div class="row-empty"></div>
            <div class="row-empty"></div>
            
            <div class="center middle-font">
                회원가입을 환영합니다
            </div>
            <div class="row-empty"></div>
            <div class="row-empty"></div>
            <div class="center small-font" style="font-size:20px">
                회원으로 가입하시면 
                <br>
                다양한 혜택과 서비스를 이용하실 수 있습니다.
            </div>
            <div class="row-empty small-font"></div>
            <div class="center">
              
            </div>
            <div class="row-empty"></div>
            <div class="row-empty"></div>
            <div class="row-empty"></div>
            
            <div class="center">
               <a href="join_agree.jsp">
                <button class="join-btn2" >14세 이상 가입하기</button>
                </a>
            </div>
            <div class="row-empty"></div>
            <div class="row-empty"></div>
            <div class="row-empty"></div>
            <div class="center ssmall-font">
                가입은 만 14세 이상 고객만 가능합니다.
            </div>
        </article>
    </main>
    </body>
    <jsp:include page="/template/footer.jsp"></jsp:include> 

