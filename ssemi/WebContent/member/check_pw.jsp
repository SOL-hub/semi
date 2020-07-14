<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- 비민번호 검사 ""공통모듈 " 페이지-->
    <%String go = request.getParameter("go"); %>
    
    <jsp:include page="/template/header.jsp"></jsp:include>
    
    <link rel=stylesheet type="text/css"
	href="<%=request.getContextPath()%>/css/change_pw.css">
	
	<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
	<div style=padding-top:150px;>
	 <main>
    <form action="check_pw.do" method="post">
      
            <div class="find-wrap">
                <h1>비밀번호 확인</h1>
            </div>
            
            
            
           <input type ="hidden" name="go" value="<%=go%>"> 
           
           <input class="form-find-id" type="password" name="member_pw" placeholder="비밀번호입력" required>
            <br>

           <!-- <select class="form-phone" name="user_phone">
                <option value="">010</option>
                <option value="011">011</option>
                <option value="016">016</option>
                <option value="017">017</option>
                <option value="018">018</option>
                <option value="019">019</option>
            </select> <input class="form-phone" type="phone"  name="member_phone" required> <input class="form-phone" find-id type="phone" required>
            -->
            
            <%if(request.getParameter("error")!=null) {%>
   
    <h4><font color = "red">비밀번호가 일치하지 않습니다.</font></h4>
<%} %>

            <!--비밀번호변경 버튼-->
            <input class="click-btn" type="submit" value="확인"> <br>
  
    
    </form>
    
   
</main>
</div>

    <jsp:include page="/template/footer.jsp"></jsp:include>
    
    </body>
   </html>