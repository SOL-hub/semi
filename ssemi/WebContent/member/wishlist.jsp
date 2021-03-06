<%@page import="home.beans.dto.ItemFileDto"%>
<%@page import="home.beans.dao.ItemFileDao"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="home.beans.dto.WishDto"%>
<%@page import="home.beans.dao.WishDao"%>
<%@page import="home.beans.dto.MemberDto"%>
<%@page import="home.beans.dto.CartDto"%>
<%@page import="home.beans.dao.CartDao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="home.beans.dao.ItemDao"%>
<%@page import="home.beans.dto.ItemDto"%>



<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	MemberDto mdto = (MemberDto) request.getSession().getAttribute("userinfo");
	int member_no = mdto.getMember_no();
	WishDao wdao = new WishDao();
	
	DecimalFormat formatter = new DecimalFormat("###,###");
	
	//////////////////////////////////////////////////////////////////
	// 페이지 목록계산 코드
	//////////////////////////////////////////////////////////////////
	
	int pageSize = 10;//한 페이지에 표시할 데이터 개수
	
	//page 번호를 계산하기 위한 코드
	// - 이상한 값은 전부다 1로 변경
	// - 멀쩡한 값은 그대로 숫자로 변환
	String pageStr = request.getParameter("page");
	int pageNo;
	try{
		pageNo = Integer.parseInt(pageStr);
		if(pageNo <= 0){
			throw new Exception();
		}
	}
	catch(Exception e){ 
		pageNo = 1;
	}
	
	//시작 글 순서와 종료 글 순서를 계산
	int finish = pageNo * pageSize;
	int start = finish - (pageSize - 1);
	
	
	//////////////////////////////////////////////////////////////////
	// 페이지 네비게이터 계산 코드
	//////////////////////////////////////////////////////////////////
	int blockSize = 10;//이 페이지에는 네비게이터 블록을 10개씩 배치하겠다!
	int startBlock = (pageNo - 1) / blockSize * blockSize + 1;
	int finishBlock = startBlock + blockSize - 1;
	
	int count;
	
	count = wdao.getCount();
	
	int pageCount = (count + pageSize - 1) / pageSize;
	//만약 finishBlock이 pageCount보다 크다면 수정해야 한다
	if(finishBlock > pageCount){
		finishBlock = pageCount;
	}
	
	List<WishDto> list = wdao.get_wishList(member_no, start, finish);
%>

<jsp:include page="/template/header.jsp"></jsp:include>


<link rel=stylesheet type="text/css"
	href="<%=request.getContextPath()%>/css/shopBarket2.css?ver=1">

<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">

<script>
	function wish_all() {
		var selectAll = document.querySelector(".wish_all_click").checked;
		var selectWish = document.getElementsByName("wish_no");

		for (var i = 0; i < selectWish.length; i++) {
			selectWish[i].checked = selectAll;
		}
	}
	
	 function button_event(){												

		 var wish_no = document.getElementsByName("wish_no");
			var count = 0;
			for(var i=0;i<wish_no.length;i++){
			    if(wish_no[i].checked == true){
			        count++;
			    }
			}
			if(count<=0){
			    alert("상품을 선택하세요");
			    return false;
			}
			else{
				 var result = confirm("선택하신 상품을 삭제하시겠습니까??");
			   if (!result){ 
//				             document.form.submit();
		        	return false;
		        }
		        else{  

//				             return;
		            document.form.submit();
		        	}
		        }
		 }
</script>

	<div class="img-wrap">
		<article>
			<br>
			<br>
			<br>
			<br>
			<br>
			<!-- 임시공간맞추기담당 -->
			<!-- <h1>reemD </h1> -->
			<br>


			<h1 style="font-size: 50px;">위시리스트</h1>
			<br>


			<hr class="hr-twolow">



			<body class="Body">
				<div id="frame">
					
						
 
						<div>
							<form method="post" name="select_check">
							<table class="calculation1">
								<thead>
									<div class="right" style="padding-left: 100px">
										<input type="submit" class="btn default" formaction="wish_del.do"
											style="width: 90px; padding: 10px; margin-bottom: 3px; font-size: 15px"
											value="삭제" onclick="return button_event();">
									</div>
									<tr>
										<th><input style="width: 10px;" type="checkbox"
											class="wish_all_click" onchange="wish_all();"></th>
										<th style="width: 280px; height: 50px;"><span>이미지</span></th>
										<th style="width: 450px;"><span>상품정보</span></th>
										<th style="width: 80px;">판매가</th>
									</tr>
								</thead>
								
								<%if(list.size() != 0){
									for (WishDto wdto : list) {

										ItemDao idao = new ItemDao();
										ItemDto idto = idao.item_get(wdto.getWish_item_name());
										ItemFileDao ifdao = new ItemFileDao();
										List<ItemFileDto> file_list = ifdao.getList(idto.getItem_no());
								%>
								<tbody>
									<tr style="height: 90px; background-color: #fff;">
										<td
											style="text-align: left; text-align: center; border-right: none; width: 5%;">
											<input type="checkbox" name="wish_no"
											value="<%=wdto.getWish_no()%>">
										</td>
										<td style="border-left: none; border-right: none;"><%=idto.getItem_name()%><br>
										<%for(ItemFileDto ifdto : file_list){%>
											<a href="<%=request.getContextPath()%>/shop/item_info.do?item_no=<%=idto.getItem_no()%>">
											<img src="download2.do?item_file_no=<%=ifdto.getItem_file_no()%>" width="100px" height="100px">
											</a>
							
										<%} %>
										</td>

										<td
											style="text-align: left; padding-left: 10px; border-left: none; font-weight: bold;"><%=idto.getItem_info()%>
										</td>
										<td>
											<span style="padding-left: 10px;"><%=formatter.format(idto.getItem_price())%></span>원
										</td>
									</tr>
								</tbody>
								<%
									}
								}else{
								%>	
								<tr>
								<td colspan="4" class="cart_content" style="background-color: white; height: 90px;">등록한 상품이 없습니다.</td>
								</tr>
								<%} %>												
							</table>
							</form>
						</div>
							<br>
							<br>

						<div align="center" style="margin: 10px 10;" class="pagination">							
							
								<%
									if(startBlock > 1){
								%>
								<a href="wishlist.jsp?page=<%=startBlock-1 %>">[이전]</a>
								
								<%} %>
								
								<%
								for(int i=startBlock; i<=finishBlock; i++){
								%>
								<%
									String prop;
									if(i == pageNo) {//현재 페이지 번호면
										prop = "class='on'";
									}
									else{//현재 페이지가 아니면
										prop = "";
									}
								%>
								
								<a href="wishlist.jsp?page=<%=i%>" <%=prop%>><%=i %></a>
								<%} %>
								
								<%
									if(finishBlock < pageCount){
								%>
								<a href="wishlist.jsp?page=<%=finishBlock + 1 %>">[다음]</a>
								<%} %>
							
						</div>
						<br />
						<br /> <br>



						<div align="center">

							<div style="margin: 10px 10;" align="center">
					<a href="<%=request.getContextPath()%>">
                     <button class="btn default backBtn btnfloat2"
                        style="background-color: gray; color: #fff;">홈으로</button>
					</a>
					<a href="<%=request.getContextPath()%>/member/mypage.jsp">
                     <button class="btn default backBtn btnfloat2"
                        style="background-color: gray; color: #fff;">마이페이지 가기</button>
					</a>
					<a href="<%=request.getContextPath()%>/member/shopBarket3.jsp">
                     <button class="btn default backBtn btnfloat2">장바구니 가기</button>
                     </a>
					<a href="<%=request.getContextPath()%>/buypage/buy_list.jsp">
                     <button class="btn default backBtn btnfloat2">구매내역 가기</button>
                     </a>
                     <a href="#">
                     <button class="btn default backBtn btnfloat2">내 견적서 보기</button>
             		</a>
             		<a href="#">
                     <button class="btn default backBtn btnfloat2">쇼핑 계속하기</button>
             		</a> 
                  </div>

						</div>
						<br />
						<br />
						<br />
						<br />
						<br /> <br />
				</div>

				<br />
				<br />
				<br />
				<br />
				<br />

</div>

<jsp:include page="/template/footer.jsp"></jsp:include>

