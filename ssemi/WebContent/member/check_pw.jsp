<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%String go = request.getParameter("go"); %>
    
    <jsp:include page="/template/header.jsp"></jsp:include>
    
    <link rel=stylesheet type="text/css"
	href="<%=request.getContextPath()%>/css/change_pw.css">
	
	<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
	
    <form action="check_pw.do" method="post">
        <main>
            <div class="find-wrap">
                <h1>내 계정 찾기</h1>

              
                <div class="font-find_id"><a href="login_id,pw.jsp">아이디찾기</a></div>
                <div class="font-find_pw">비밀번호변경</div>
               
            </div>
            
            <input type ="hidden" name="go" value="<%=go%>"> 
            <input class="form-find-id" type="text" name="member_id" placeholder="아이디" required>
            <input class="form-find-id" type="text" name="member_nick" placeholder="닉네임" required>

            <br>

            <select class="form-phone" name="user_phone">
                <option value="">010</option>
                <option value="011">011</option>
                <option value="016">016</option>
                <option value="017">017</option>
                <option value="018">018</option>
                <option value="019">019</option>
            </select> <input class="form-phone" type="phone"  name="member_phone" required> <input class="form-phone" find-id type="phone" required>
            
            <br> <br>
            <br>

            <!--비밀번호변경 버튼-->
            <input class="click-btn" type="submit" value="비밀번호 변경하기"> <br>
        </main>
    
    </form>
    </body>

    <jsp:include page="/template/footer.jsp"></jsp:include>