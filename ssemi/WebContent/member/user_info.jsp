<%@page import="home.beans.dao.MemberDao"%>
<%@page import="home.beans.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
   MemberDto mdto =(MemberDto)request.getSession().getAttribute("userinfo");
   MemberDao mdao = new MemberDao();
   int member_no = mdto.getMember_no();
   MemberDto user = mdao.get(member_no);
%>
    
    
<jsp:include page="/template/header.jsp"></jsp:include>



<style>
* {
	box-sizing: border-box;
	margin: 0px;
	padding: 0px;
	font-family: 'Noto Sans KR', sans-serif;
	letter-spacing: -1.5px;
}


 #edith1{
			margin-left: 450px;  	margin-bottom:50px;
        }
        
        .edittable tr td{
			border-bottom: 1px solid #3333;
			width: 200px;
			color:#333333;
	}
	
  .edittable {

            text-align: center;
            width: 500px;
            height: 500px;
            margin-left:180px;
           
        }
        

</style>
<meta charset="UTF-8">


<link rel=stylesheet type="text/css" href="<%=request.getContextPath() %>/css/base.css?ver=1">
<link rel=stylesheet type="text/css" href="<%=request.getContextPath() %>/css/admin.css?ver=1">
<link rel=stylesheet type="text/css" href="<%=request.getContextPath() %>/css/user_info.css?ver=2">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">

</head>
<body>
    <main>
        <aside class="sidebar">
            <ul>
                <li>
                    <a href="mypage.jsp">
                        마이페이지
                    </a>
                </li>
                <li>
                    <a style="color: #C80A1E" href="user_info.jsp">
                        회원정보
                    </a>
                </li>
                <li>
                    <a href="check_pw.jsp?go=user_info_update.jsp">
                    
                        회원정보수정
                    </a>
                </li>
              <li>
                    <a href="check_pw.jsp?go=change_pw.jsp">
           비밀번호변경                      
                    </a>
                </li>
             <li>
                    <a href="check_pw.jsp?go=user_out.do">
           회원탈퇴                     
                    </a>
                </li>     
                <li>
                    <a href="shopBarket3.jsp">
                        장바구니
                    </a>
                </li>
                <li>
                    <a href="wishlist.jsp">
                        위시리스트
                    </a>
                </li>
                <li>
                    <a href="<%=request.getContextPath()%>/buypage/buy_list.jsp">
                        구매내역
                    </a>
                </li>
             
                <li>
                	<a href="<%=request.getContextPath()%>/estimate/bath-list.jsp"> 
                		견적내역 
                	</a>
                </li>
            </ul>
        </aside>
        <section>
            <article class="container">
              
                
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
                  
                  </div>
               <br> <br> 
                
            </article>
           
        </section>
    </main>
</body>

</html>

<jsp:include page="/template/footer.jsp"></jsp:include>