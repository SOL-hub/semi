<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>

<link rel=stylesheet type="text/css" href="<%=request.getContextPath() %>/css/login.css?ver=1">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<form action="login.do" method="post">
<main>
<article>
 <div class = "login-wrap">
  <h1>로그인</h1>
  
   <form action="login.do" method="post">
   
   <!--아이디/비밀번호입력창-->
    <input class = "form-input login-id" type="text" name="member_id" placeholder="아이디입력" required>
    <input class = "form-input login-pw" type="password" name="member_pw" placeholder="비밀번호입력" required>
     <br>
    <!--아이디저장 입력창-->
    
    
     <div class="login-checkbox-wrap">
    <input class = "form-box login-checkbox" type="checkbox" id="save-id">
    <label for ="save-id">아이디저장</label>
       </div>
    <br><br>
    
    <!--신규 회원가입버튼-->
    <div class="join_find_id,pw">
    <div class = "form-join join-submit">
    <button><a href="join_main.jsp">신규 회원가입</a></button>
    </div>
    
    <!--아이디, 비밀번호찾기버튼-->
    <div class = "form-find findid,pw-submit">
    <button><a href="find_id,pw.jsp">아이디, 비밀번호 찾기</button>
    </div>
    </div>
    <br><br>
    
    
    
       <!--로그인버튼-->
       
    <input class = "click-btn" type="submit" value="로그인">
    <%if(request.getParameter("error") != null){%>

    <div class="row center">

    	<!-- 오류 메시지는 페이지에 error라는 파라미터가 있을 경우만 출력 -->

		<font color="#FF0000">입력하신 로그인 정보가 맞지 않습니다</font>
		</div>
		<%} %>
		
		
		
    <br>
     </form>
    </div>
    </article>
    </main>
</form>
	
<jsp:include page="/template/footer.jsp"></jsp:include>
