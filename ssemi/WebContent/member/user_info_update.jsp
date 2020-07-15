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
<link rel=stylesheet type="text/css" href="<%=request.getContextPath() %>/css/user_info_update.css">

</head>
<body>
    <main>
        <aside class="sidebar">
            <div class="row-empty"></div>
            <ul>
                <li>
                    <a href="mypage.jsp">
                        마이페이지
                    </a>
                </li>
                <li>
                    <a href="user_info.jsp">
                        회원정보
                    </a>
                </li>
                <li>
                    <!--
                    진빈군, 이것도 수정하려면 먼저 비번검사하게 바꿨어요. 혹시나해서 오빠가 작성한 거 남길게용
                    <a style="color: red" href="user_info_update.jsp">-->
                    <a style="color: red" href="user_info_update.jsp">
                        회원정보수정
                    </a>
                </li>
              <li>
                    <a href="check_pw.jsp?go=change_pw.jsp">
           비밀번호변경                      
                    </a>
                </li>
             <li>
                    <a href="check_pw.jsp?go=user_out.jsp">
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
                    <a href="#">
                        구매내역
                    </a>
                </li>
                <li>
                    <a href="#">
                        게시판내역
                    </a>
                </li>
                <li>
                	<a href="#"> 견적내역 </a>
                </li>
            </ul>
        </aside>
        <section>
            <article class="container">
            <form action="user_info_update.do" method="post">
                <div class="center font-head margin-down">
                    회 원 정 보 수 정
                </div>
                <div class="left">
                    <p>
                        <%=user.getMember_id() %>

                    </p>
                </div>
                
                <div class="left">
                    <p>
                        <%=user.getMember_name() %>
                        <span>
                            
                        </span>
                    </p>
                </div>
                <div class="left">
                    <p>
                        <input name="member_nick" type="text" class="id-input" placeholder="닉네임" required value="<%=user.getMember_nick() %>">
                        <span>
                            닉네임
                        </span>
                    </p>
                </div>
                <div class="left">
                    <p>
                        <input name="member_birth" type="date" class="input-calendar" max="9999-12-31" value="<%=user.getMember_birth() %>">
                        <span>
                            생년월일
                        </span>
                    </p>
                </div>
                <div class="left">
                    <p>
                        <input name="member_phone" class="phone-input" type="text" placeholder="핸드폰번호( - 제외입력)" value="<%=user.getMember_phone() %>">
                        <span>
                            핸드폰번호
                        </span>
                    </p>
                </div>
                <div class="left">
                    <p>
                        <input name="member_email" class="phone-input" type="email" placeholder="이메일" value="<%=user.getMember_email() %>">
                        <span>
                            이메일
                        </span>
                    </p>
                </div>
                <div class="left">
                    <p>
                        <input name="member_post" class="addr-input" type="text" placeholder="우편번호" value="<%=user.getMember_post() %>">
                        <span>
                            우편번호
                        </span>
                    </p>
                </div>
                <div class="left">

                </div>
                <div class="left">
                    <p>
                        <input name="member_base_addr" class="addr-input" type="text" placeholder="주소입력" value="<%=user.getMember_base_addr() %>">
                        <span>
                            주소
                        </span>
                    </p>
                </div>
                <div class="left margin-down">
                    <p>
                        <input name="member_extra_addr" class="addr-input" type="text" placeholder="상세주소입력" value="<%=user.getMember_extra_addr() %>">
                        <span>
                            상세주소
                        </span>
                    </p>
                </div>
                <div class="row-empty center">
               
              <a href="check_pw.jsp?go=user_info.jsp">
                        <input class="join-btn" type="submit" value="정보수정"></a>
                    
                </div>
                </form>
            </article>
        </section>
    </main>
</body>

</html>

<jsp:include page="/template/footer.jsp"></jsp:include>  