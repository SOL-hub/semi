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

<link rel=stylesheet type="text/css" href="<%=request.getContextPath() %>/css/base.css?ver=1">
<link rel=stylesheet type="text/css" href="<%=request.getContextPath() %>/css/admin.css?ver=2">
<link rel=stylesheet type="text/css" href="<%=request.getContextPath() %>/css/user_info.css?ver=2">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<style>
 #edith1{
			margin-left: 450px;  	margin-bottom:50px;
        }
        
        .edittable tr td{
			
			width: 200px;
			color:#333333;
	}
	
  .edittable {

            text-align: center;
            width: 500px;
            height: 500px;
            margin-left:180px;
           
        }
        
        .join-btn{
        	background-color: #C80A1E;
        	color:white;
        	margin-top:30px;
        }
</style>
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
                    <a style="color:#C80A1E" href="user_info_update.jsp">
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
                    <a href="<%=request.getContextPath()%>/buypage/buy_list.jsp">
                        구매내역
                    </a>
                </li>
                <li>
                    <a href="#">
                        게시판내역
                    </a>
                </li>
                <li>
                	<a href=href="<%=request.getContextPath()%>/estimate/bath-list.jsp"> 
                		견적내역 
                	</a>
                </li>
            </ul>
        </aside>
        <section>
            <article class="container">
            <form action="user_info_update.do" method="post">
             <div class="editdiv">
        <h1 id="edith1"> 회원 정보 수정</h1>
                <table class="edittable">
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
               
               </table>
               </div>
                <div class="row-empty center">
               
              <a href="check_pw.jsp?go=user_info.jsp">
                        <input class="join-btn" type="submit" value="정보수정"></a>
                    
                </div>
                <br><br>
                </form>
            </article>
        </section>
    </main>
</body>

</html>

<jsp:include page="/template/footer.jsp"></jsp:include>  