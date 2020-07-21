<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="home.beans.dto.shoppingDto"%>
<%@page import="home.beans.dao.ShoppingDao"%>
<%@page import="home.beans.dao.ItemFileDao"%>
<%@page import="home.beans.dto.ItemFileDto"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="home.beans.dto.ItemDto"%>
<%@page import="home.beans.dao.ItemDao"%>
<%@page import="java.util.List"%>
<%@page import="home.beans.dto.CartDto"%>
<%@page import="home.beans.dao.CartDao"%>
<%@page import="home.beans.dao.MemberDao"%>
<%@page import="home.beans.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%
   MemberDto mdto = (MemberDto) request.getSession().getAttribute("userinfo");
   MemberDao mdao = new MemberDao();
   int member_no = mdto.getMember_no();
   MemberDto user = mdao.get(member_no);
   CartDao cdao = new CartDao();
   
   ShoppingDao sdao = new ShoppingDao();
   List<shoppingDto> shopping_list = sdao.buy_list(member_no);
   
   
   DecimalFormat formatter = new DecimalFormat("###,###");
   NumberFormat nf = NumberFormat.getCurrencyInstance(Locale.KOREA);
   //////////////////////////////////////////////////////////////////
   // 페이지 목록계산 코드
   //////////////////////////////////////////////////////////////////
   
   int pageSize = 3;//한 페이지에 표시할 데이터 개수
   
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
   
   List<CartDto> list = cdao.getList(member_no, start, finish);
//    List<EstimateDto> E_list=
%>


<jsp:include page="/template/header.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel=stylesheet type="text/css"
   href="<%=request.getContextPath()%>/css/base.css?ver=1">
<link rel=stylesheet type="text/css"
   href="<%=request.getContextPath()%>/css/mypage.css?ver=1">
   
   <link
   href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@300&display=swap"
   rel="stylesheet">

</head>
<body>
   <main>
      <aside class="sidebar">
         <ul>
            <li><a style="color:#C80A1E" href="mypage.jsp"> 마이페이지 </a></li>
            <li><a href="user_info.jsp"> 회원정보 </a></li>
            <li><a href="check_pw.jsp?go=user_info_update.jsp"> 회원정보수정 </a></li>
            <li><a href="check_pw.jsp?go=change_pw.jsp"> 비밀번호변경 </a></li>
            <li><a href="shopBarket3.jsp"> 장바구니 </a></li>
            <li><a href="wishlist.jsp">위시리스트</a></li>
            <li><a href="<%=request.getContextPath()%>/buypage/buy_list.jsp"> 구매내역 </a></li>
            <li><a href="<%=request.getContextPath()%>/estimate/bath-list.jsp"> 견적내역 </a></li>
            <li><a href="<%=request.getContextPath()%>/member/check_pw.jsp?go=user_out2.do">회원탈퇴</a></li>
         </ul>
      </aside>
      <section>

         <article class="container">
            <table>
               
               
<!--                   <div class="img_flex"> -->

<!--                      <div class="img cart_img"></div> -->

<!--                      <div class="img order_img"></div> -->

<!--                      <div class="img broad_img"></div> -->

<!--                   </div> -->
                  <tbody>
                  <tr class="cart_line_padding">
                     <td class="cart_title center"><a href="shopBarket3.jsp" style="font-size: 20px" >나의 장바구니 목록</a></td>
                  </tr>
                  <tr>
                     <td class="row-empty"></td>
                  </tr>
                  <tr>
                     <td class="cart_list">이미지</td>
                     <td class="cart_list">상품정보</td>
                     <td class="cart_list">가격</td>
                     <td class="cart_list">수량</td>
                  </tr>
                  <tr>
                     <td colspan="5" class="cart_line"></td>
                  </tr>

                  <%
                  
                  if(list.size() != 0){
                     for (CartDto cdto : list) {
                        // cdto.getCar_item() 으로 상품 테이블을 조회해서 이름을 반환하는 메소드를 여기서 호출
                        ItemDao idao = new ItemDao();
                        ItemDto itemName = idao.item_get(cdto.getCart_item_name());
                        ItemFileDao ifdao = new ItemFileDao();
                        List<ItemFileDto> file_list = ifdao.getList(itemName.getItem_no());
                        
                        int item_cnt_change_price = itemName.getItem_price() * cdto.getCart_cnt();
                        
                        
                  %>
                  <tr>
                     <td style="width: 10%;" class="cart_content">
                     <%for(ItemFileDto ifdto : file_list){%>
                        <a href="<%=request.getContextPath()%>/shop/item_info.do?item_no=<%=itemName.getItem_no()%>">
                        <img src="download2.do?item_file_no=<%=ifdto.getItem_file_no()%>" width="100px" height="100px">
                        </a>
                     
                        <%} %>
                     </td>
                     <td style="width: 20%" class="cart_content_left">
                     <div>[상품이름] <%=itemName.getItem_name()%></div>
                     <p>[상품정보]</p><div><%=itemName.getItem_info()%></div>
                     </td>
                     <td style="width: 10%" class="cart_content"><%=nf.format(item_cnt_change_price)%></td>
                     <td style="width: 20%" class="cart_content"><%=cdto.getCart_cnt()%></td>
                     <br>
                  </tr>
                  <tr>
                     <td colspan="5" class="cart_line"></td>
                  </tr>
      
                     <%
                        }
                     %>
                     <%
                        }else{
                           
                     %>
                     <tr>
                        <td colspan="5" class="cart_content">장바구니가 비어있습니다</td>
                     </tr>
                  <%
                     }
                  %>
                  
<!--                   구매내역 -->
<!--                   구매내역 -->
<!--                   구매내역 -->
<!--                   구매내역 -->
<!--                   구매내역 -->

                  <tr>
                     <td class="row-empty"></td>
                  </tr>
                  
                  <tr>
                     <td  class="cart_title center"><a href="<%=request.getContextPath()%>/buypage/buy_list.jsp" style="font-size: 20px">나의 구매내역</a></td>
                  </tr>
                  <tr>
                     <td class="row-empty"></td>
                  </tr>
                  <tr>
                     <td class="cart_list">상품이름</td>
                     <td class="cart_list">상품정보</td>
                     <td class="cart_list">가격</td>
                     <td class="cart_list">수량</td>
                  </tr>
                  <tr>
                     <td colspan="4" class="cart_line"></td>
                  </tr>

                  <%
                  if(shopping_list.size() != 0){
                     for (shoppingDto sdto : shopping_list) {
                        // cdto.getCar_item() 으로 상품 테이블을 조회해서 이름을 반환하는 메소드를 여기서 호출
                        ItemDao idao = new ItemDao();
                        ItemDto itemName = idao.item_get(sdto.getShopping_item_name());      
                        ItemFileDao ifdao = new ItemFileDao();
                        List<ItemFileDto> file_list = ifdao.getList(itemName.getItem_no());
                  %>
                  <tr>
                     <td style="width: 10%" class="cart_content">
                        <%for(ItemFileDto ifdto : file_list){%>
                        <a href="<%=request.getContextPath()%>/shop/item_info.do?item_no=<%=itemName.getItem_no()%>">
                        <img src="download2.do?item_file_no=<%=ifdto.getItem_file_no()%>" width="100px" height="100px">
                        </a>
                        <%} %>
                     </td>
                     <td style="width: 50%" class="cart_content_left">
                        <div>[상품이름] <%=itemName.getItem_name()%></div>
                     <p>[상품정보]</p><div><%=itemName.getItem_info()%></div>
                     
                     </td>
                     <td style="width: 10%" class="cart_content"><%=nf.format(itemName.getItem_price())%></td>
                     <td style="width: 10%" class="cart_content"><%=sdto.getShopping_item_cnt()%></td>
                     <br>
                  </tr>
                  <tr>
                     <td colspan="4" class="cart_line"></td>
                  </tr>
      
                     <%
                        }
                     %>
                     <%
                        }else{
                           
                     %>
                     <tr>
                        <td colspan="4" class="cart_content">구매내역이 비어있습니다</td>
                     </tr>
                  <%
                     }
                  %>
                  <tr>
                     <td class="row-empty"></td>
                  </tr>
                  
<!--                견적 -->
<!--                견적 -->
<!--                견적 -->
<!--                견적 -->
<!--                견적 -->
<!--                   <tr> -->
<!--                      <td  class="cart_title center">나의 견적내역</td> -->
<!--                   </tr> -->
<!--                   <tr> -->
<!--                      <td class="row-empty"></td> -->
<!--                   </tr> -->
                  
<!--                   <tr> -->
<!--                      <td class="left">마루견적 내역</td> -->
<!--                   </tr> -->
<!--                   <tr> -->
<!--                      <td class="cart_list">견적 제목</td> -->
<!--                      <td class="cart_list">견적 가격</td> -->
<!--                      <td class="cart_list">올린시간</td> -->
<!--                   </tr> -->
<!--                   <tr> -->
<!--                      <td colspan="3" class="cart_line"></td> -->
<!--                   </tr> -->

<%--                   <% --%>
<!-- //                   if(list.size() != 0){ -->
<!-- //                      for (CartDto cdto : list) { -->
<!-- //                         // cdto.getCar_item() 으로 상품 테이블을 조회해서 이름을 반환하는 메소드를 여기서 호출 -->
<!-- //                         ItemDao idao = new ItemDao(); -->
<!-- //                         ItemDto itemName = idao.item_get(cdto.getCart_item_name());                   -->
<%--                   %> --%>
<!--                   <tr> -->
<%--                      <td style="width: 10%" class="cart_content"><%=itemName.getItem_name()%></td> --%>
<%--                      <td style="width: 50%" class="cart_content_left"><%=itemName.getItem_info()%></td> --%>
<%--                      <td style="width: 10%" class="cart_content"><%=itemName.getItem_price()%></td> --%>
<%--                      <td style="width: 10%" class="cart_content"><%=cdto.getCart_cnt()%></td> --%>
<!--                      <br> -->
<!--                   </tr> -->
<!--                   <tr> -->
<!--                      <td colspan="4" class="cart_line"></td> -->
<!--                   </tr> -->
      
<%--                      <% --%>
<!-- //                         } -->
<%--                      %> --%>
<%--                      <% --%>
<!-- //                         }else{ -->
                           
<%--                      %> --%>
<!--                      <tr> -->
<!--                         <td colspan="4" class="cart_content">장바구니가 비어있습니다</td> -->
<!--                      </tr> -->
<%--                   <% --%>
<!-- //                      } -->
<%--                   %> --%>
                  
<!--                      <tr> -->
<!--                      <td class="row-empty"></td> -->
<!--                   </tr> -->
                  
               </tbody>
            </table>
         </article>

      </section>
   </main>
</body>

</html>

<jsp:include page="/template/footer.jsp"></jsp:include>