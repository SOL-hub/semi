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

               <button class="btn default " id="productClear" style="font-color: red;">
              종료된 이벤트</button>
               <br> <br>
            
               <hr class="hr-twolow">
          
               <!--제품관련 스타일-->
               <br>

                  <div class = "img-inline">
                  <!-- 여기다 event1 선착순-->
             <br><br>
                 
                  <img src="<%=request.getContextPath()%>/img/event3.png" width="500" height="470" alt="event"/>
               
                     <h3 style="font-color: grey;">
                        종료된 이벤트입니다</h3>
                    
                    
                 


<!-- 이벤트2 출석체크-->
               
                <br>

                  <div class = "img-inline">
                  <!-- 여기다 event1 선착순-->
             <br><br>
                 
                  <img src="<%=request.getContextPath()%>/img/event4.jpg" width="512" height="512" alt="event"/>
               
                     <h3 style="font-color: grey;">
                         종료된 이벤트입니다</h3>
               
               
               
               
               
               
               
                    
                

            </div>
                
                </div></div>
                
             <!--<hr class="hr-twolow">-->
               </div>
          </article>
      </body>
     


<jsp:include page="/template/footer.jsp"></jsp:include>