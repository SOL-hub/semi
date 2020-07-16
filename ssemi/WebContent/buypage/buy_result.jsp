<%@page import="home.beans.dto.MemberDto"%>
<%@page import="home.beans.dto.CartDto"%>
<%@page import="home.beans.dao.CartDao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="home.beans.dao.ItemDao"%>
<%@page import="home.beans.dto.ItemDto"%>



<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>


<jsp:include page="/template/header.jsp"></jsp:include>


<link rel=stylesheet type="text/css"
   href="<%=request.getContextPath()%>/css/shop-finish.css?ver=1">

<link
   href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@300&display=swap"
   rel="stylesheet">

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

         <br> <br> <br>
         <h1 style="font-size: 47px;">주문결제가 정상적으로 완료되었습니다.</h1>

         <div style="text-align: center" style=font-size:15px>
            <img src="<%=request.getContextPath()%>/img/info.png" width="25"
               height="25" alt="shopBarket2"> 주문상품에 대한 배송상태 등은 마이페이지에서 확인하실
            수 있습니다.
            <br>
            <br>
         </div>

                   <div style="margin: 10px 10;" align="center">
					<a href="<%=request.getContextPath()%>">
                     <button class="btn default backBtn btnfloat2"
                        style="background-color: gray; color: #fff;">홈으로</button>
					</a>
					<a href="<%=request.getContextPath()%>/member/shopBarket3.jsp">
                     <button class="btn default backBtn btnfloat2">장바구니 가기</button>
                     </a>
                     <a href="<%=request.getContextPath()%>/buypage/buy_list.jsp">
                     <button class="btn default backBtn btnfloat2">구매내역 가기</button>
                     </a>
                     <a>
                     <button class="btn default backBtn btnfloat2">내 견적서 보기</button>
             		</a>
             		<a>
                     <button class="btn default backBtn btnfloat2">쇼핑 계속하기</button>
             		</a>
                  </div>
 		</article>

<jsp:include page="/template/footer.jsp"></jsp:include>
