<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>  

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link rel=stylesheet type="text/css" href="<%=request.getContextPath() %>/css/base.css">
    <link rel=stylesheet type="text/css" href="<%=request.getContextPath() %>/css/join_agree.css">
    <style>
       
    </style>
    <script>
    function checkAgree(){
        var check_A = document.querySelector(".checkbutton").checked;
        
        if(!check_A){
            alert("약관에 동의해주세요");
            
            return false;
        }
        else{
           location.href="join.jsp";

        }
    }
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
            <div class="row-empty center small-font">약관동의</div>
            <div class="row-empty"></div>
            <div class="row-empty center">
                <textarea class="ssmall-font" readonly>  약관동의 해야 회원가입 가능함 ㅇㅋ?약관동의 해야 회원가입 가능함 ㅇㅋ?약관동의 해야 회원가입 가능함 ㅇㅋ?약관동의 해야 회원가입 가능함 ㅇㅋ?약관동의 해야 회원가입 가능함 ㅇㅋ?약관동의 해야 회원가입 가능함 ㅇㅋ?약관동의 해야 회원가입 가능함 ㅇㅋ?약관동의 해야 회원가입 가능함 ㅇㅋ?약관동의 해야 회원가입 가능함 ㅇㅋ?약관동의 해야 회원가입 가능함 ㅇㅋ?약관동의 해야 회원가입 가능함 ㅇㅋ?약관동의 해야 회원가입 가능함 ㅇㅋ?약관동의 해야 회원가입 가능함 ㅇㅋ?약관동의 해야 회원가입 가능함 ㅇㅋ?약관동의 해야 회원가입 가능함 ㅇㅋ?약관동의 해야 회원가입 가능함 ㅇㅋ?약관동의 해야 회원가입 가능함 ㅇㅋ?약관동의 해야 회원가입 가능함 ㅇㅋ?약관동의 해야 회원가입 가능함 ㅇㅋ?약관동의 해야 회원가입 가능함 ㅇㅋ?약관동의 해야 회원가입 가능함 ㅇㅋ?약관동의 해야 회원가입 가능함 ㅇㅋ?약관동의 해야 회원가입 가능함 ㅇㅋ?
           
            </textarea>
            </div>
            
            <div class="row-empty down"></div>
           
            <div class="row-empty">
                <input type="checkbox" class="checkbutton">동의합니다
            </div>
            <div class="row-empty"></div>
            
            <div class="center">
            <a href="<%=request.getContextPath()%>">
             <button class="agree-btn2">처음으로</button>
             </a>
                 <button class="agree-btn" onclick="checkAgree();">
                 동의하고 회원가입
                 </button>
            </div>     
        </article>
    </main>
</body>
</html>
  <jsp:include page="/template/footer.jsp"></jsp:include> 