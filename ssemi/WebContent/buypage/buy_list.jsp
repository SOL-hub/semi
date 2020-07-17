<%@page import="java.text.DecimalFormat"%>
<%@page import="home.beans.dto.shoppingDto"%>
<%@page import="home.beans.dao.ShoppingDao"%>
<%@page import="home.beans.dto.MemberDto"%>
<%@page import="home.beans.dto.CartDto"%>
<%@page import="home.beans.dao.CartDao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="home.beans.dao.ItemDao"%>
<%@page import="home.beans.dto.ItemDto"%>

<%
	MemberDto mdto = (MemberDto)request.getSession().getAttribute("userinfo");
	int member_no = mdto.getMember_no();
	DecimalFormat formatter = new DecimalFormat("###,###");
	
	ShoppingDao sdao = new ShoppingDao();
	List<shoppingDto> list = sdao.buy_list(member_no);
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>


<jsp:include page="/template/header.jsp"></jsp:include>


<link rel=stylesheet type="text/css"
   href="<%=request.getContextPath()%>/css/shop-finish.css">

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
         <h1 style="font-size: 47px;">구매/주문 내역</h1>
         <!-- 테이블 시작!> -->

         <script>
         function button_event() {
			
		
         var result = confirm("선택하신 상품을 삭제하시겠습니까??");
		   if (!result){ 
//	             document.form.submit();
	        	return false;
	        }
	        else{  

//	             return;
	            document.form.submit();
	        	}
	        }
	  	 
         </script>

         <body class="Body">
            <div id="frame">
               
                  <div id="frame2">
                     <!-- <span style="font-size: 30pt; font-weight: bold;" >장바구니</span>-->

                  </div>

                  <br>
                  <div>

                     <h3 style="text-align: center; margin: 10px 100px 10px 10px;">결제한
                        상품목록</h3>
                  </div>


                  <%--상품정보 테이블--%>
					
                  <div>
					
					<% 
					
					%>		
								
                     <table class="calculation1">
                        <thead>
						
                           <tr>
                             
                              <th style="width: 280px; height: 50px;"><span>이미지</span></th>
                              <th style="width: 120px;">상품이름</th>
                              <th style="width: 450px;"><span>상품정보</span></th>
                              <th style="width: 100px;">판매가</th>
                              <th style="width: 60px;">수량</th>
                              <th style="width: 100px;">배송비</th>
                              <th style="width: 100px;">결제방식</th>
                              <th style="width: 150px;">선택</th>

                           </tr>
                        </thead>
							<%
							int total_price = 0;
							int real_total_price = 0;
							int delivery_cost = list.size() * 2500;
							
							if(list.size() != 0){
							
						for(shoppingDto sdto : list){
							
						ItemDao idao = new ItemDao();
						ItemDto idto = idao.item_get(sdto.getShopping_item_name());
							
							total_price += idto.getItem_price();
							
						%>
						
                        <tbody>
                        
                           <tr style="height: 90px; background-color: #fff;">
                              <td style="width: 280px; height: 50px;"><span>이미지</span></td>
                              <td style="width: 120px; height: 50px;"><span><%=idto.getItem_name() %></span></td>
                              <td style="width: 450px; text-align: left; padding-left: 20px;">
                              	<span><%=idto.getItem_info() %></span>
                              </td>
                              <td style="width: 100px;"><%=formatter.format(idto.getItem_price())%>원</td>
                              <td style="width: 60px;"><%=sdto.getShopping_item_cnt() %></td>
		                      <td style="width: 100px;">2,500원</td>
		                       <td style="width: 100px;">
		                       		<%=sdto.getShopping_payment() %><br>
		                       		<%=sdto.getShopping_paybank()%><br>
		                       		<%=sdto.getShopping_paybank_num() %>
		                       </td>
                              <td>
                              <form action="buy_list_delete.do">
                              <input type="submit" class="btn default"
                               style="width: 90px; padding: 10px; margin-bottom: 2.5px; font-size: 13px;" value="주문취소"
                               onclick="return button_event();">
                               <input type="hidden" name="shopping_no" value="<%=sdto.getShopping_no()%>">
                               </form>
                              </td>
                           </tr>
                        </tbody>
                        <%
						}
						
                        %>
                        <%}else{ %>
				
				<tr style=" background-color: white; height: 150px;">
					<td colspan="7">
						구매내역이 비어있습니다.
					</td>
					</tr>						
				
				<%}
					real_total_price = total_price + delivery_cost;
				%>

                        <tfoot>
                           <tr style="height: 60px;">
                              <td colspan="5"
                                 style="border-right: none; text-align: right; padding-left: 10px;">
                                 <span style="font-weight: bold; font-size: 15pt;">총 상품금액 + 배송비 </span>
                              </td>
                              <td colspan="5"
                                 style="border-left: nonoe; text-align: center; padding-right: 10px;">                             
                                 <span style="font-weight: bold; font-size: 15pt;"><%=formatter.format(real_total_price) %>원</span>
                              </td>
                           </tr>


                        </tfoot>
                     </table>
					
                     <div style="border: border:solid 1px #e0e0b; padding: 15px 0;">
                        <img src="/semiProject/image/주의!.png"
                           style="margin-left: 5px; position: relative; top: 4.5px;">
                        <span style="font-size: 10pt; color: gray;">할인적용 금액은 주문서
                           작성의 결제예정금액에서 확인 가능합니다.</span>

                     </div>

                  </div>
	      <%--결제예정금액 테이블--%>
                  </%--결제예정금액>

                  <table class="calculation2">
                     <tr>
                        <th  style="width: 500px;">총 상품금액</th>
                        <th style="width: 500px;">총 배송비</th>
                        <th style="width: 750px; padding: 22px 0;"><span>최종
                              결제금액</span></th>
                     </tr>

                     <tr style="background-color: #fff;">
                        <td style="padding: 22px 0;"><span class="price"><%=formatter.format(total_price) %></span>원</td>
                        <td><span class="price"><%=formatter.format(delivery_cost) %></span>원
                        </td>
                        <td><span class="price"><%=formatter.format(real_total_price) %></span>원
                        </td>

                     </tr>
                  </table>
                  
                  <br />
                  <br />
                  
                  <div style="margin: 10px 10;" align="center">
					<a href="<%=request.getContextPath()%>">
                     <input type="button" class="btn default backBtn btnfloat2"
                        style="background-color: gray; color: #fff;" value="홈으로">
					</a>
					<a href="<%=request.getContextPath()%>/member/mypage.jsp">
                     <input type="button" class="btn default backBtn btnfloat2" style="background-color: gray; color: #fff;" value="마이페이지 가기">
             		</a>
             		<a href="<%=request.getContextPath()%>/member/wishlist.jsp">
                     <input type="button" class="btn default backBtn btnfloat2" value="위시리스트 가기">
             		</a>
					<a href="<%=request.getContextPath()%>/member/shopBarket3.jsp">
                     <input type="button" class="btn default backBtn btnfloat2" value="장바구니가기">
                     </a>
                     <a>
                     <input type="button" class="btn default backBtn btnfloat2" value="내 견적서보기">
             		</a>
                  </div>
            </div>
       

<!-- 주의 사항 -->

<br>


<div
   style="border: solid 1px #3333; padding: 10px 0; font-size: 12pt; background-color: antiquewhite; padding-left: 10px;">배송
   예약 시스템안내</div>
<div
   style="border: solid 1px #3333; height: 220px; font-size: 12pt; padding-left: 10px;">
   <br />

   <ol>

      <li class="lifont">제품은 단품이 각각 포장되어 직접 배송/시공해드립니다.(일부 택배 품목 제외)</li>
      <li class="lifont">또한, 저의 "reemD는 고객님들의 편의를 위하여 배송일을 좀 더 정확하고 확정할
         수 있는 서비스를 제공하도록 노력하고있습니다."</li>
      <li class="lifont">배송 희망일을 선택하시면 온라인 담당자와 시공담당자가 세부일정을 확정해 알려드리는
         시스템을 실행하고 있습니다.</li>
      <li class="lifont">배송시간은 확실하게 지정할 수 없으며 배송 전 시공사가 연락드릴 예정입니다.</li>
      <li class="lifont">성수기인 1월~6월사이에는 납기가 많이 지연되는 점, 양해부탁드리며 시공에 다라
         희망 배송일이 변경될 수 있습니다. <br>따라서 변경 시 온라인 담당자가 연락을 드리며 일정을 최대한 맞춰드리도록
         하겠습니다.
      </li>

   </ol>

</div>

<br />
<br />
<br />
<br />
<br />

<div
   style="border: solid 1px #3333; padding: 10px 0; font-size: 12pt; background-color: antiquewhite; padding-left: 10px;">결제
   전 확인사항</div>
<div
   style="border: solid 1px #3333; height: 120px; font-size: 12pt; padding-left: 10px;">

   <ol>

      <li class="lifont">고객의 단순한 변심으로 교환, 반품 빛 환불을 요구할 때 수반되는 배송비는
         고객님께서 부담하셔야합니다.</li>
      <br>
      <li class="lifont">상품을 개봉했거나 설치한 후에는 상품의 재판매가 불가능하므로 고객님의 변심에 대한
         교환, 반품이 불가능함을 양지해 주시기 바랍니다.</li>
      <br>
      <br>
   </ol>

</div>
</%--상품정보>

</div>

<jsp:include page="/template/footer.jsp"></jsp:include>
