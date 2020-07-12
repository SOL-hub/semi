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

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel=stylesheet type="text/css" href="<%=request.getContextPath() %>/css/base.css">
<link rel=stylesheet type="text/css" href="<%=request.getContextPath() %>/css/user_info.css">

</head>
<body>
    <main>
        <aside class="sidebar">
            <ul>
                <li>
                    <a href="user_info.jsp">
                        마이페이지
                    </a>
                </li>
                <li>
                    <a style="color: red" href="user_info.jsp">
                        회원정보
                    </a>
                </li>
                <li>
                    <a href="user_info_update.jsp">
                    
                        회원정보수정
                    </a>
                </li>
              <li>
                    <a href="user_pw_change.jsp">
           비밀번호변경                      
                    </a>
                </li>
             <li>
                    <a href="user_out.jsp">
           회원탈퇴                      
                    </a>
                </li>     
                <li>
                    <a href="shopBarket.jsp">
                        장바구니
                    </a>
                </li>
                <li>
                    <a href="#">
                        구매내역
                    </a>
                </li>
                <li>
                    <a href="#">
                        게시판내역
                    </a>
                </li>
            </ul>
        </aside>
        <section>
            <article class="container">
                <div class="center font-head margin-down">
                    회 원 정 보
                </div>
                <div class="content">
                    아이디
                </div>
                
                <div class="left">
                    <p>
                        <%=user.getMember_id() %>

                    </p>
                </div>
                
                <div class="content">
                    이름
                </div>
                <div class="left">
                    <p>
                        <%=user.getMember_name() %>
        
                    </p>
                </div>
                
                <div class="content">
                    닉네임
                </div>
                <div class="left">
                    <p>
                        <%=user.getMember_nick() %>
         
                    </p>
                </div>
                
                <div class="content">
                    생년월일
                </div>
                <div class="left">
                    <p >
                        <%=user.getMember_birth() %>
           
                    </p>
                </div>
                
               <div class="content">
                    핸드폰번호
                </div>
                <div class="left">
                    <p>
                        <%=user.getMember_phone() %>
        
                    </p>
                </div>
                
                <div class="content">
                    이메일
                </div>
                <div class="left">
                    <p>
                        <%=user.getMember_email() %>
             
                    </p>
                </div>
                
                <div class="content">
                    우편번호
                </div>
                <div class="left">
                    <p>
                        <%=user.getMember_post() %>
          
                    </p>
                </div>
               
               <div class="content">
                    주소
                </div>
                <div class="left">
                    <p>
                        <%=user.getMember_base_addr() %>
              
                    </p>
                </div>
                
                <div class="content">
                    상세주소
                </div>
                <div class="left margin-down">
                    <p>
                        <%=user.getMember_extra_addr() %>
            
                    </p>
                </div>
                
            </article>
        </section>
    </main>
</body>

</html>

<jsp:include page="/template/footer.jsp"></jsp:include>