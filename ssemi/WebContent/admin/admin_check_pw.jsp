<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- 비민번호 검사 ""공통모듈 " 페이지-->
 
    <%String go = request.getParameter("go"); %>
    
    <jsp:include page="/template/header.jsp"></jsp:include>
    

<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/admin.css">
	<style>
	
	main {
	
	width: 500px;
	text-align: center;
	height: 300px;
	margin: auto;
	border: 1px solid #3333;
	margin-top:200px;
	}

	.admin-pw {
		margin-top:50px;
		width: 50%;
		border: 1px solid #3333;
		color:
		
	}
	
	.listbtn{
		margin-left:210px;
	}
	</style>
	
	 <main>
    <form action="check_pw.do" method="post">
      
            <div >
                <h2 >관리자 확인</h2>
            </div>
            
            
            
           <input type ="hidden" name="go" value="<%=go%>"> 
           
            <input class="admin-pw" type="password" placeholder="비밀번호 입력" name="member_pw" required>
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
            
            <%if(request.getParameter("error") != null){%>
                <div class="row center">
                <font color="#C80A1E">입력하신 로그인 정보가 맞지 않습니다</font>
                </div>
                <%} %>
            
     
            <!--비밀번호변경 버튼-->
            <input class="listbtn" type="submit" value="확인"> <br>
  
    
    </form>
    
   
</main>

    <jsp:include page="/template/footer.jsp"></jsp:include>
</body>
</html>