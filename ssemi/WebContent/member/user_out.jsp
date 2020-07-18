<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>
<link rel=stylesheet type="text/css" href="<%=request.getContextPath() %>/css/user_out.css?ver=1">


<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">

     <!-- <script>
        console.log(window.location);
        function check(){
            /*var text = document.querySelector(".확인").value;*/
           
           location.href = "<%=request.getContextPath()%>/member/check_pw.jsp?go=user_out.jsp";
           
           
           
           modal-wrap.remove("on")
        }
        
    </script> -->   


</head>
<body>
<main class="out-main" style=padding-top:75px;>

<!--  모달의 시작 -->
<!--  <article>
     <div class="modal-wrap">
        <div class="modal">
        <h2>고객님, 정말로
        <br>탈퇴하시겠습니까?</h2>
        
        확인버튼을 누르시면 탈퇴와 함께
        <br>그동안 적립한 포인트를 잃게 됩니다.
        <br><br>
         <button onclick="check();">확인</button>
       
       
        <!--<input type="submit"  value="확인" class="확인" onclick="check();">-->
       <!--<input class="login-submit" type="submit" value="확인">-->
            
            <!-- </div></div></article>-->
<!--  모달의 끝-->

    
    



   <div class="out-wrap">
      <h1>회원탈퇴..완료..</h1>


      <div class="center">

         <br>
         <h3>소중한 고객님, 안녕히 가세요..</h3>
         <br>



         <!--  <div class="change_after">
            <a href="#"> <input class="click-btn2" type="submit"
               value="여기다가는 뭘 쓸까? "></a>
         </div>-->


         
            <a href="join.jsp"> <input
               class="click-btn2" type="submit" value="회원가입하기"></a>
         

      
         
      
</div>
</div>

</main>
</body>


<jsp:include page="/template/footer.jsp"></jsp:include>