<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
            <div class="row-empty"></div>
            <ul>
                <li>
                    <a href="#">
                        마이페이지
                    </a>
                </li>
                <li>
                    <a href="#">
                        회원정보
                    </a>
                </li>
                <li>
                    <a href="#">
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
                <li>
            </ul>
        </aside>
        <section>
            <article class="container">
                <div class="center font-head margin-down">
                    회 원 정 보
                </div>
                <div class="left">
                    <p>
                        <input id="userId" name="user_id" class="id-input" type="text" placeholder="아이디" required oninput="check_id();">
                        
                    </p>
                </div>
                <div class="left">
                    <p>
                        <input name="user_pw" class="pw-input" type="password" placeholder="비밀번호" required oninput="check_pw();">
                        
                    </p>
                </div>
                
                <div class="left">
                    <p> 
                        <input name="user_name" class="id-input" type="text" placeholder="이름" required>
                        <span>
                         이름
                         </span>
                    </p>
                </div>
                <div class="left">
                    <p>
                        <input name="user_nick" type="text" class="id-input" placeholder="닉네임" required>
                         <span>
                         닉네임
                         </span>
                    </p>
                </div>
                <div class="left">
                    <p>
                        <input name="user_birth" type="date" class="input-calendar" max="9999-12-31">
                         <span>
                         생년월일
                         </span>
                    </p>
                </div>
                <div class="left">
                    <p>
                        <input name="user_phone" class="phone-input" type="text" placeholder="핸드폰번호( - 제외입력)">
                         <span>
                         핸드폰번호
                         </span>
                    </p>
                </div>
                <div class="left">
                    <p>
                        <input name="user_email" class="phone-input" type="email" placeholder="이메일">
                        <span>
                         이메일
                         </span>
                    </p>
                </div>
                <div class="left">
                    <p>
                        <input name="user_post" class="addr-input" type="text" placeholder="우편번호">
                         <span>
                         우편번호
                         </span>
                    </p>
                </div>
                <div class="left">

                </div>
                <div class="left">
                    <p>
                        <input name="user_base_addr" class="addr-input" type="text" placeholder="주소입력">
                         <span>
                         주소
                         </span>
                    </p>
                </div>
                <div class="left margin-down">
                    <p>
                        <input name="user_extra_addr" class="addr-input" type="text" placeholder="상세주소입력">
                         <span>
                         상세주소
                         </span>
                    </p>
                </div>
                <div class="row-empty right margin-right">
                    <a href="<%=request.getContextPath()%>/member/user_info_update.jsp">
                        <button class="join-btn">회원정보수정</button>
                    </a>
                </div>
            </article>
        </section>
    </main>
</body>

</html>

<jsp:include page="/template/footer.jsp"></jsp:include>  