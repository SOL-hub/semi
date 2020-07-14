<%@page import="java.util.ArrayList"%>
<%@page import="home.beans.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="home.beans.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!-- 임새봄 -->


<jsp:include page="/template/header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리 페이지</title>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/admin.css">
<script src="<%=request.getContextPath()%>/js/moment.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/lightpick.css">
<script src="<%=request.getContextPath()%>/js/lightpick.js"></script>

<style>

 


 
        /*회원 검색과 리스트 전체 div*/
       
</style>
<script>
	window.onload = function() {
		var options = {
			//대상 지정
			field : document.querySelector(".picker-start"),

			//두 번째 대상 지정
			secondField : document.querySelector(".picker-end"),

			//날짜 표시 형식 지정
			format : 'YYYY-MM-DD',

			//한 화면에 표시될 달의 개수
			numberOfMonths : 2,

			//시작요일(1:월 ~ 7:일)
			firstDay : 7,

			//자동으로 닫히지 않도록 설정
			//autoclose: false,

			//선택 방향 제어
			selectForward : true,
			selectBackword : false,

		};

		var picker = new Lightpick(options);

	};
</script>



<%
	// 회원 아이디 이름 검색 --임새봄
	request.setCharacterEncoding("UTF-8");

	String type = request.getParameter("type");
	String keyword = request.getParameter("keyword");

	MemberDao mdao = new MemberDao();

	List<MemberDto> list;

	if (type == null || keyword == null) {// type이 없거나 keyword가 없으면 --> 처음 실행한 경우
		list = new ArrayList<>(); // 검색을 할 수 없으니 비어있는 목록 준비
	} else {
		list = mdao.search(type, keyword); // 검색하기 
	}
%>


</head>
<body>
	
	<!-- 관리자 카테고리 -->

	  <div class="category-main fixed">
        <h3>Today</h3>

        <div class="today-cart-wrap">
            <a href="#">
                <img class="todayimg" src="/ssemi/img/supermarket.png">
            </a>
        </div>


        <div class="label-wrap">
            <a href="#" class="today-label">
                주문 (15건)
            </a>
        </div>

        <div class="today-cart-wrap">
            <a href="#">
                <img class="todayimg" src="/ssemi/img/money.png">
            </a>
        </div>


        <div class="label-wrap">
            <a href="#" class="today-label">
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

<!-- 회원 검색 -->
	<div class="search-list-wrap">
		<div class="search-wrap">
			<h2 id="stitle">회원 검색</h2>
			<form action="adminSearch.jsp" method="get">
				<table class="tsearch">
					<tr>
						<th>검색어</th>
						<td><select name="type">
								<option value="member_name">이름</option>
								<option value="member_id">아이디</option>
								<option value="member_phone">전화번호</option>
						</select> <input type="text" name="keyword"></td>

					</tr>
					<tr>
						<th>총 구매금액</th>
						<td><input type="text"> <span>원~</span><input
							type="text"> <span>원</span></td>

					</tr>
					<tr>
						<th>가입일</th>
						<td><input type="text" class="picker-start"
							name="member_join"><span>~</span><input type="text"
							class="picker-end" name="member_join"></td>

					</tr>
					<tr>
						<th>주문 상품</th>
						<td><select name="type">
								<option>상품명</option>
								<option>상품코드</option>
								<option>브랜드</option>
						</select> <input type="text" name=""></td>

					</tr>

				</table>

				<input type="submit" value="검색" class="admin-submit ">
			</form>
		</div>

		<!--  회원 목록  -->


		<div class="list-wrap">

			<h2 id="Ltitle">회원 목록</h2>
			<p id="listcount">
				검색결과<%=list.size()%>건
			</p>
		
			
			<%MemberDto user = new MemberDto(); %>
			
			
			<div class="list-table-wrap">
				<table class="Ltable">
					<tr>
						
						<th>이름</th>
						<th>아이디</th>
						<th>등록일</th>
						<th>전화번호</th>
						<th>나이</th>
						<th>보기</th>
					</tr>



					<%
						for (MemberDto mdto : list) {
					%>

					<tr class="Ldata">
					
						<td class="Ldata"><a href = "#"><%=mdto.getMember_name()%></a></td>
						<td class="Ldata"><a href = "#"><%=mdto.getMember_id()%></a></td>
						<td class="Ldata"><a href = "#"><%=mdto.getMember_join_day()%></a></td>
						<td class="Ldata"><a href = "#"><%=mdto.getMember_phone()%></a></td>
						<td class="Ldata"><a href = "#"><%=mdto.getMember_age()%></a></td>
						<td class="Ldata"><a href ="#"><input type="button" value="주문내역"
							class="listbtn"></a> <a href ="#"><input type="button" value="적립금"
							class="listbtn"></a></td>
							
							
					
							
							<td><a href="#"><input type="button" value="수정" class="listbtn"></a>
							<a href="<%=request.getContextPath()%>/admin/delete.do?member_no=<%=mdto.getMember_no()%>"><input type="button" value="삭제"  class="listbtn" ></a></td>
					</tr>
					<%
						}
					%>

				</table>
				
			</div>
			

		</div>
	</div>
	



</body>
</html>
<jsp:include page="/template/footer.jsp"></jsp:include>