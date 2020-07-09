<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<link rel=stylesheet type="text/css"
	href="<%=request.getContextPath()%>/css/find_id_result.css">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
	
	<%String member_id = (String)session.getAttribute("member_id");
	session.removeAttribute("member_id");
	%>
	
	<%String member_name = (String)session.getAttribute("member_name");
	session.removeAttribute("member_name");
	%>
	
<jsp:include page="/template/header.jsp"></jsp:include>


<main>

        <div class="find-wrap">
            <h1>내 계정 찾기</h1>

            <div class="center">

                <br>

                <h3>소중한 <%=member_name%>양의 아이디는 
                <P></P>
                <span><%=member_id%></span>입니다</h3>
                <br>


                <!-- 이 다음에 할 거 링크-->
                <div class="change_after">
                    <a href="<%=request.getContextPath()%>/member/login.jsp"> <input class="click-btn2" type="submit" value="로그인하기"></a>
                </div>


                <div class="change_after">
                    <a href="<%=request.getContextPath()%>/member/change_pw.jsp?go=change_pw.jsp"> <input class="click-btn2" type="submit" value="비밀번호 변경"></a>
                </div>

            </div>
        </div>
    </main>

<jsp:include page="/template/footer.jsp"></jsp:include>
