<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>


<link rel=stylesheet type="text/css"
   href="<%=request.getContextPath()%>/css/event.css">

<link
   href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@300&display=swap"
   rel="stylesheet">
   


<!-- <form action="event_event1.jsp" method="post">-->
</head>
    
      <body class="Body">
      <div class="img-wrap">
         <article>
            <br>
            <br>
            <br>
            <br>
            <br>
            <!-- 임시공간맞추기담당 -->

            <h1 style="font-size: 50px;">EVENT</h1>
            <br>

            <div align="center">
               <button class="btn default " id="productClear"  style= bbackground-color: "#C80A1E";>진행중 이벤트</button>

               <button class="btn default " id="productClear">종료된 이벤트</button>
               <br> <br>
            
               <hr class="hr-twolow">
          
               <!--제품관련 스타일-->
               <br>

                  <div class = "img-inline">
                  <!-- 여기다 event1 선착순-->
             <br><br>
                  <a href="event_event1.jsp">
                  <img src="<%=request.getContextPath()%>/img/sale1.jpg" width="880" height="570" alt="event"/>
                  <h5 style="font-size: 13pt;">
                       여름에 더우시죠? 시원하게 쏘겠습니다.<br>선착순 10명한정 이벤트 실시</h5>
                     <h5 style="font-color: grey;">
                        곧 다가오는 여름에  포인트받고 원하는 가격에 구매할 수 있도록<br>포인트도 얻어가셔서 즐거운 쇼핑하세요.</h5>
                     <h4 style=font-width:bold;>2020-07-21(화) 10시 START</h4>
                     </a>
                     
                     <br><br><br>
                 
                 
                 


<!-- 이벤트2 출석체크-->
               
                  <img src="<%=request.getContextPath()%>/img/event2-2.jpg" width="880" height="570" alt="event"/>
                     
                     <h5 style="font-size: 13pt;">
                      출석체크
                     </h5>
                     <h6 style="font-color: grey;">
                       매일매일 200원 즉시 적립!
                     </h6>
                     
                     <br><br><br><br>
            <img src="<%=request.getContextPath()%>/img/event1-7.JPG" width="880" height="530" alt="event"/>
                  
                  
                 <br><br><br>
                 <br>
                 <br><br><br>
                 <br>
                   <img src="<%=request.getContextPath()%>/img/event1-7.JPG" width="880" height="530" alt="event"/>
                     
              
                
                  <br>
                  <br>

                

            </div>
                
                </div></div>
                
             <!--<hr class="hr-twolow">-->
               </div>
          </article>
      </body>
     


<jsp:include page="/template/footer.jsp"></jsp:include>