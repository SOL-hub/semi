<%@page import="home.beans.dto.shoppingDto"%>
<%@page import="java.util.List"%>
<%@page import="home.beans.dao.ShoppingDao"%>
<%@page import="home.beans.dao.MemberDao"%>
<%@page import="home.beans.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
.edittable tr td{
			border-bottom: 1px solid #3333;
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
			margin-left: 200px;  	
        }
        
       .listbtn{
       		margin-top: 10px;	
        	display: inline;
        }
     #infobutton {
     
     	margin-left:335px;
     
     }
     
</style>
</head>
<body>

		
	


		<div class="today-cart-wrap">
			<a href="admin_search.jsp" ><img class="todayimg" src="/ssemi/img/customer.png">
			</a>
		</div>
		

 <div class="editdiv">
                 <h1 id="edith1"> 회원 정보</h1>
              
                  <table  class="edittable">
                  <tr>
                  	<th>아이디</th>
                  	<td><%=mdto.getMember_id() %></td>
                  </tr>
                  <tr>
                  	<th> 이름</th>
                  	<td> <%=mdto.getMember_name() %></td>
                  </tr>
                  <tr>
                  	<th>닉네임</th>
                  	<td> <%=mdto.getMember_nick() %></td>
                  </tr>
                  <tr>
                  	<th>생년월일</th>
                  	<td> <%=mdto.getMember_birth_year() %></td>
                  </tr>
                  <tr>
                  	<th>핸드폰번호</th>
                  	<td><%=mdto.getMember_phone() %></td>
                  </tr>
                  <tr>
                  	<th>이메일</th>
                  	<td><%=mdto.getMember_email() %></td>
                  </tr>
                  <tr>
                  	<th>우편번호</th>
                  	<td><%=mdto.getMember_post() %></td>
                  </tr>
                  <tr>
                  	<th>주소</th>
                  	<td><%=mdto.getMember_base_addr() %></td>
                  </tr>
                  <tr>
                  	<th>상세주소</th>
                  	<td><%=mdto.getMember_extra_addr() %></td>
                  </tr>
                  <tr>
                  	<th>포인트</th>
                  	<td><%=mdto.getMember_point() %></td>
                  </tr>       
                  </table>
                  <div id="infobutton">
                  <a href="<%=request.getContextPath()%>/admin/admin_search.jsp"><input type="button" value="관리메뉴" class="listbtn"></a>
                  <a href= "<%=request.getContextPath()%>/admin/admin_check_pw.jsp?go=<%=request.getContextPath()%>/admin/admin_edit.jsp?member_no=<%=mdto.getMember_no()%>"><input  class="listbtn"  type="button" value="정보수정"></a>
               	</div>
               </div>
                
         
</body>
</html>

<jsp:include page="/template/footer.jsp"></jsp:include>