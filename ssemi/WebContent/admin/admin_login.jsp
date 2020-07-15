<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <jsp:include page="/template/header.jsp"></jsp:include>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인 페이지</title>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/admin.css">
	
	<style>
	
	.admin-main {
	width: 500px;
	height: 330px;
	margin: auto;
	margin-top: 150px;
	border: 1px solid #3333;
	padding: 50px 50px;
  }
	
	.admin-submit {
    text-align: center;
    font-size: 16px;
    color: white;
    background-color: #C80A1E;
    width: 255px;
    padding: 1rem;
    margin-top: 23px;
    margin-bottom: 15px;
    margin-left: 50px;
    margin-right: 50px;
    border: 1px solid transparent;
    cursor: pointer;
}
	
	</style>
	
</head>
<body>
  <main class="admin-main">
	 <form action="admin_login.do" method="post">
        <div class="admin-wrap">
            <div class="adminT">관리자</div>


           
                <input class="admin-id" type="text" placeholder="관리자 아이디" name="admin_id" required>
                <input class="admin-pw" type="password" placeholder="비밀번호" name="admin_pw" required>

                    <input type="checkbox" id="cb1">
                    <label for="cb1">
                        <span class="login-memory">아이디 저장</span>
                    </label>
                <input class="admin-submit" type="submit" value="로그인">
                
              <%if(request.getParameter("error") != null){%>
                <div class="row center">
                <font color="#C80A1E">입력하신 로그인 정보가 맞지 않습니다</font>
                </div>
                <%} %>
          

        </div>
          </form>
    </main>
</body>
</html>

<jsp:include page="/template/footer.jsp"></jsp:include>