<%@page import="home.beans.dao.MemberDao"%>
<%@page import="home.beans.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    


<!-- 관리자 회원 정보 수정 임새봄 -->
  <%  
  int member_no =Integer.parseInt(request.getParameter("member_no"));
  
  MemberDao mdao= new MemberDao();
  MemberDto mdto = mdao.get(member_no);
  
  %>
    
<jsp:include page="/template/header.jsp"></jsp:include>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/admin.css?ver=1">
<style>


   .edittable tr th {
            width: 150px;
            color: #C80A1E;
        }

        .edittable {

            text-align: center;
            width: 500px;
            height: 500px;
        }

        .editdiv {
            margin-top: 200px;
            margin-left: 700px;

        }
        
       
        #edith1{
			margin-left: 150px;  	
        }
        
       .listbtn{
       		margin-top: 10px;
        	margin-left: 420px;  	
        }
     
   
</style>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/admin.css">

</head>

  <div class="category-main fixed">
        <h3>Today</h3>

        <div class="today-cart-wrap">
            <a href="total_before_pay.jsp">
                <img class="todayimg" src="/ssemi/img/supermarket.png">
            </a>
        </div>

 
        <div class="label-wrap">
        <a href="total_before_pay.jsp" class="today-label">
                주문 (15건)
        </a>
        </div>

        <div class="today-cart-wrap">
            <a href="total_after_pay.jsp">
                <img class="todayimg" src="/ssemi/img/money.png">
            </a>
        </div>


        <div class="label-wrap">
            <a href="total_after_pay.jsp" class="today-label">
                결제 (9건)
            </a>
        </div>


        <div class="today-cart-wrap">
            <a href="#">
                <img class="todayimg" src="/ssemi/img/customer.png">
            </a>
        </div>


        <div class="label-wrap ">
            <a href="#" class="today-label">
                회원 가입(30건)
            </a>
        </div>
        
        

    </div>

    <div class="editdiv">
        <h1 id="edith1"> 회원 정보 수정</h1>
        <form action="admin_edit.do" method="post">
            <table border="1" class="edittable">
                <tr>
                    <th>아이디</th>
                    <td><%=mdto.getMember_id() %>
                     <input type="hidden" name="member_no" value="<%=mdto.getMember_no() %>">
                      </td>
                </tr>
                <tr>
                    <th>비밀번호</th>
                    <td><input name="member_pw" type="password" value="<%=mdto.getMember_pw() %>"></td>
                </tr>
                <tr>
                    <th>닉네임</th>
                    <td>
                        <input name="member_nick" type="text" placeholder="닉네임" required value="<%=mdto.getMember_nick() %>">
                    </td>
                </tr>
                <tr>
                    <th>생년월일</th>
                    <td> <%=mdto.getMember_birth_year()%>
                    	<input type="hidden" name="member_birth" value="<%=mdto.getMember_birth_year()%>">
                    </td>
                </tr>
                <tr>
                    <th>핸드폰 번호</th>
                    <td><input name="member_phone" type="text" placeholder="핸드폰번호( - 제외입력)" value="<%=mdto.getMember_phone() %>"></td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td><input name="member_email" type="email" placeholder="이메일" value="<%=mdto.getMember_email() %>"></td>
                </tr>
                <tr>
                    <th>우편번호</th>
                    <td><input name="member_post" type="text" placeholder="우편번호" value="<%=mdto.getMember_post() %>"></td>
                </tr>
                <tr>
                    <th>주소</th>
                    <td><input name="member_base_addr" type="text" placeholder="주소입력" value="<%=mdto.getMember_base_addr() %>"></td>
                </tr>
                <tr>
                    <th>상세주소</th>
                    <td><input name="member_extra_addr" type="text" placeholder="상세주소입력" value="<%=mdto.getMember_extra_addr() %>"></td>
                </tr>
                <tr>
                    <th>포인트</th>
                    <td><input name="member_point" type="text" value="<%=mdto.getMember_point()%>"></td>
                </tr>
             


            </table>
           
            <input  class="listbtn"  type="submit" value="정보수정">
          
        </form>
    </div>

    
               
  
                    
               
            
</body>

</html>

<jsp:include page="/template/footer.jsp"></jsp:include>  