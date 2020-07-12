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
<link rel=stylesheet type="text/css" href="<%=request.getContextPath() %>/css/mypage.css?ver=1">

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
                    <a href="shopBarket3.jsp">
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
               
                <div class="img_flex">
                  
                   <div class="img cart_img"></div>
                   
                   <div class="img order_img"></div>
                   
                   <div class="img broad_img"></div>
                   
                </div>
                
                <div class="content">
                    나의 장바구니 목록
                </div>

                <div class="left">
                    <p></p>
                    <p></p>
                    <p></p>
                </div>
                <div class="content"></div>
                <div class="row-empty"></div>
                <div class="row-empty"></div>
                <div class="content">
                    나의 견적서 목록
                </div>
                <div class="left">
                    <p></p>
                    <p></p>
                    <p></p>
                </div>
                <div class="content"></div>
                <div class="row-empty"></div>
                <div class="row-empty"></div>
                <div class="content">
                    나의 구매내역 목록
                </div>
                <div class="left">
                    <p></p>
                    <p></p>
                    <p></p>
                </div>
                <div class="content"></div>
                <div class="row-empty"></div>
                <div class="row-empty"></div>
                <div class="content">
                    나의 게시판 내역
                </div>

                <div class="left">
                    <p></p>
                    <p></p>
                    <p></p>
                </div>
                <div class="content"></div>




            </article>
        </section>
    </main>
</body>

</html>

<jsp:include page="/template/footer.jsp"></jsp:include>  