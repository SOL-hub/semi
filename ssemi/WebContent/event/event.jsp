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
               <button class="btn default " id="productClear">진행중 이벤트</button>

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
                        타이밍을 잘 잡아야, 실속있게 산다! <br>종합세트 할인 판매실시</h5>
                     <h5 style="font-color: grey;">
                        곧 여름도 다가오는데 언제다 이거사고 저거사? 여름에 필요한 거 여기 다 있어! <br> 제품 하나씩 맘껏
                        골라서 세트할인으로 즐거운 쇼핑하세요.</h5>
                     <h4 style=font-width:bold;>2020-07-21(화) 10시 START</h4>
                     </a>
                 


<!-- 이벤트2 출석체크-->
               
                  <img src="<%=request.getContextPath()%>/img/event2-2.jpg" width="880" height="570" alt="event"/>
                     
                     <h5 style="font-size: 13pt;">
                      출석체크
                     </h5>
                     <h6 style="font-color: grey;">
                       매일매일 100포인트 증정!
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