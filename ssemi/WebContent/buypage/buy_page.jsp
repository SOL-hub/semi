<%@page import="home.beans.dto.ItemDto"%>
<%@page import="home.beans.dao.ItemDao"%>
<%@page import="java.util.List"%>
<%@page import="home.beans.dao.CartDao"%>
<%@page import="home.beans.dto.CartDto"%>
<%@page import="home.beans.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%
      	MemberDto mdto = (MemberDto)request.getSession().getAttribute("userinfo");
   		int cart_member = mdto.getMember_no();
		
   		CartDto cdto = new CartDto();
   		cdto.setCart_no(Integer.parseInt(request.getParameter("cart_no")));
   		CartDao cdao = new CartDao();
   		
   		String [] setCart= request.getParameterValues("cart_no");
	
    %>
<jsp:include page="/template/header.jsp"></jsp:include>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>ordersheet</title>

    <style>
        * {
/*            font-size: 20px  */
        }

        main {
            text-align: left;
            width: 1300px;
            height: none;
            margin: auto;
            padding-top: 150px;

        }

        .user-name {
            padding: 10px;
            font-size: 15px;
            width: 20%;
            border: 1px solid #aaa;

        }

        .recive-name {
            padding: 10px;
            font-size: 15px;
            width: 20%;
            border: 1px solid #aaa;

        }

        .user-phone {
            padding: 10px;
            font-size: 15px;
            width: 30%;

            margin: 5px 0px;
            border: 1px solid #aaa;
        }

        .recive-phone {
            padding: 10px;
            font-size: 15px;
            width: 30%;

            margin: 5px 0px;
            border: 1px solid #aaa;
        }

        .form-email {
            padding: 10px;
            font-size: 15px;
            width: 50%;
            margin: 5px 0px;
            border: 1px solid #aaa;
        }

        .recive-addr1 {
            padding: 10px;
            font-size: 15px;
            width: 20%;
            margin: 5px 0px;
            border: 1px solid #aaa;
        }

        .recive-addr2 {
            padding: 10px;
            font-size: 15px;
            width: 50%;
            margin: 5px 0px;
            border: 1px solid #aaa;
        }

        .form-house_phone {
            padding: 10px;
            font-size: 15px;
            width: 20%;
            margin: 5px 0px;
            border: 1px solid #aaa;
        }

        .form-request {
            padding: 10px;
            font-size: 15px;
            width: 90%;
            margin: 5px 0px;
            border: 1px solid #aaa;
        }


        h4 {
            left;
            padding: 0;
            margin: 25px 3px 7px 0;
        }


        .checkyourpurchase {
            text-align: center;
        }

        .purchase-button {
            padding: 0.6rem;
            font-size: 14px;
            width: 20%;
            background-color: black;
            border: white;
            color: white;
            cursor: pointer;
        }

        .purchase-button:hover {
            padding: 0.6rem;
            font-size: 14px;
            width: 20%;
            background-color: #C80A1E;
            color: white;
        }

        .center {
            text-align: center;
        }

        .left {
            text-align: left;
        }

        .right {
            text-align: right;
        }

        section {
            display: flex;
        }

        .buy_list1 {
            flex: 5;
        }

        .buy_list2 {
            flex: 5;
        }

        .row-empty {
            height: 20px;
        }

        .item_list>.item_list2>.item_title {
            display: inline-block;
            list-style: none;

        }
          div.area {
            display: none;
        }

        div.area.on {
            display: block;
        }
        
        .bottomline{
            border-bottom: 1px solid black;
        }
        
        .item_info_color{
            background-color: beige;
        }
        .text_textarea{
        	width:250px;
        	height:125px;
        	min-height: 125px;
        	max-height:125px;
        	min-width: 300px;
        	max-width: 300px;  
        	border-style: none;
        	resize: none;
        	padding-top: 20px;
        	background-color: beige;
        }
        .text_textarea:focus{
        	width:250px;
        	height:125px;
        	min-height: 125px;
        	max-height:125px;
        	min-width: 300px;
        	max-width: 300px;  
        	border-style: none;
        	resize: none;
        	padding-top: 20px;
        	background-color: beige;
        	outline: none;
        }
        .input_text_style{
        	text-align: center;
        	border-style: none;
        	outline: none;
        	background-color: beige;
        }
    </style>
    <script>
        
        //각 태그마다 번호 지정
        function toggleTab(index) {
            var list = document.querySelectorAll(".area");
            for (var i = 0; i < list.length; i++) {
                list[i].classList.remove("on");
            }

            var target = document.querySelector("#cb" + index + "-area");
            target.classList.add("on");
        }
        
        //  번호 아이디에서 받아서 자동으로 전환
        function toggleTabAutomation(tag) {
            var id = tag.id;
            var targetId = id + "-area";

            var list = document.querySelectorAll(".area");
            for (var i = 0; i < list.length; i++) {
                list[i].classList.remove("on");
            }
            var target = document.getElementById(targetId);
            target.classList.add("on");
        }
    </script>
</head>

<body>
    <main>
    <header>
    <form action="buy_page.do">
        <div class="center">
                   <h1 style="font-size: 50px;">결제 내용</h1>
               </div>
               
                <div class="row-empty"></div>
                
            <table>
               <thead>
               <tr>
                    <td colspan="6"class="center bottomline"></td>
                </tr>
                <tr class="row-empty"></tr>
                <tr>
                    <td class="center" style="width: 13%">이미지</td>
                    <td class="center" style="width: 5%">상품이름</td>
                    <td class="center" style="width: 20%">상품정보</td>
                    <td class="center" style="width: 5%">배송비</td>
                    <td class="center" style="width: 5%">수량</td>
                    <td class="center" style="width: 5%">총 주문금액</td>
                </tr>
                <tr class="row-empty"></tr>
                </thead>
                
                <tbody class="item_info_color">
                  <%
                  
                int total_cnt=0;
				int total_price = 0;
				int real_total_price=0;
				int delivery_cost = 2500;	
									
						
								
				for(int i=0; i<setCart.length; i++) {
					int cart_no = Integer.parseInt(setCart[i]);
					CartDto cdto2 = cdao.get_cart2(cart_no);

				ItemDao idao = new ItemDao();
				ItemDto itemName = idao.item_get(cdto2.getCart_item_name());
					
				int item_cnt_change_price = itemName.getItem_price() * cdto2.getCart_cnt();
										
				total_price = item_cnt_change_price + delivery_cost ;
				total_cnt += cdto2.getCart_cnt();	
				real_total_price += total_price;
				%>
				
                <tr>
                    <td colspan="6"class="center bottomline"></td>
                </tr>
                <tr class="row-empty"></tr>
              
                <tr>
                    <td class="center" style="width: 13%">
                    <img src="https://placeimg.com/274/274" style="width: 40%"></td>
                    <td class="center" style="width: 5%">
                    	<input class="input_text_style" type="text" readonly value="<%=itemName.getItem_name()%>">
                    	<input type="hidden" name="shopping_item_name" value="<%=itemName.getItem_no() %>">
                    </td>
                    <td class="center" style="width: 5%">
                    	<textarea  readonly class="text_textarea"><%=itemName.getItem_info()%></textarea>
                    </td> 
                    <td class="center" style="width: 5%">
                    	<input style=" width: 40%;" class="input_text_style" type="text" value="2500">원
                    </td>
                    <td class="center" style="width: 5%">
                    	<input style=" width: 40%;" class="input_text_style" type="text" value="<%=cdto2.getCart_cnt() %>" name="shopping_item_cnt">
                    </td>
                    <td class="center" style="width: 5%;">
                    	<input style= "text-align: right; width: 70%;" class="input_text_style" type="text" value="<%=total_price%>">원
                    </td>
                </tr>
                <tr class="row-empty"></tr>
<!--                 <tr> -->
<!--                     <td colspan="6"class="center bottomline"></td> -->
<!--                 </tr> -->
                
                <%}
				int real_total = total_price + delivery_cost;					
				%> 
									
				
				<tr>
                    <td colspan="6"class="center bottomline"></td>
                </tr>
				<tr class="center">
                	<td colspan="4"></td>
                	<td>총수량</td>
                	<td>총 금액</td>
                </tr>
                <tr class="center">
                	<td colspan="4"></td>
                	<td><%=total_cnt %></td>
                	<td><%=real_total_price %></td>
                </tr>
                <tr>
                    <td colspan="6"class="center bottomline"></td>
                </tr>
                </tbody>
            </table>
        </header>
              
                
  
        <div class="row-empty"></div>
        
        <section>
            <article class="buy_list1">
                <div class="phrchase-info">
                    <h3>회원 정보</h3>

                    <h4>회원이름</h4>
                    <input style= "text-align: left" class="user-name input_text_style" type="text" readonly
                    value="<%=mdto.getMember_name()%>">
                    <h4>연락처</h4>
                    <input style= "text-align: left" class="user-phone input_text_style" readonly
                    value="<%=mdto.getMember_phone()%>">

                    <h4>이메일</h4>
                    <input style= "text-align: left" class="form-email input_text_style" type="text" readonly
                    value="<%=mdto.getMember_email()%>">
                </div>


            </article>
            <article class="buy_list2">
                <div class="phrchase-info">


                    <h3>배송지 정보</h3>

                    <h4>받는사람</h4>
                    <input class="recive-name" type="text" name="shopping_recive_name" required
                    value="<%=mdto.getMember_name()%>">

                    <h4>핸드폰번호</h4>
                    <input class="recive-phone" type="text" name="shopping_recive_phone" required
                    value="<%=mdto.getMember_phone()%>">

                    <h4>주소</h4>
                    <div>
                        <input class="recive-addr1" type="text" name="shopping_recive_post" required
                        value="<%=mdto.getMember_post()%>">
                        <input type="button" value="주소찾기">
                    </div>
                    <div>
                        <input class="recive-addr2" type="text" name="shopping_recive_base_addr" required
                        value="<%=mdto.getMember_base_addr()%>">
                        <input class="recive-addr2" type="text" name="shopping_recive_extra_addr" required
                        value="<%=mdto.getMember_extra_addr()%>">
                    </div>
                    <h4>배송시 요청사항</h4>
                    <input class="form-request" type="text" name="shopping_recive_content" placeholder="200자 이내로 작성해주세요." required>
                </div>
                <div class="row-empty"></div>
                <div class="row-empty"></div>

            </article>
        </section>
        <footer class="buy_list2">
            <hr>
            <div>
                <h3>결제 방법</h3>
            </div>
            <div>
                <div>
                    <label for="cb1"><input type="radio" name="shopping_payment" id="cb1" onchange="toggleTabAutomation(this);" checked value="카드">
                        <span>카드</span>
                    </label>
                    <label for="cb2"><input type="radio" name="shopping_payment" id="cb2" onchange="toggleTabAutomation(this);" value="계좌이체">
                        <span>계좌이체</span>
                    </label>
                </div>

                <div class="row-empty"></div>
                <div class="row-empty">
                    <select name="shopping_paybank">
                        <option>은행선택</option>
                        <option>국민은행</option>
                        <option>신한은행</option>
                        <option>기업은행</option>
                    </select>
                </div>
                    <div class="row-empty"></div>
                     <div class="row-empty"></div>
                    <div class="area on" id="cb1-area">
                        <div>
                            <img src="https://placeimg.com/274/274">
                        </div>
                        <div class="row-empty"></div>
                        <div class="row-empty"></div>
                        <div>
                            카드번호<input type="text" name="shopping_paybank_num">
                        </div>
                    </div>
                    <div class="area" id="cb2-area">
                        <div>
                            계좌번호<input type="text" name="shopping_paybank_num">
                        </div>
                    </div>
                <div class="row-empty"></div>
                <div class="row-empty">
                    <hr>
                </div>
                <div class="row-empty">
                    <div><h3>총 결제 금액</h3></div>
                </div>
                <div class="row-empty">
                   <div class="row-empty center"></div>
                    ㅇㄹㅇㄹㅇㄹㅇㄹㅇㄹ
                </div>
                <div class="row-empty center"></div>
                <div class="row-empty center"></div>
                <div class="row-empty center">
                   
                    <input type="submit" value="결제하기" class="purchase-button">
                    <input type="submit" value="결제취소" class="purchase-button">
                </div>
                <div class="row-empty"></div>
                <div class="row-empty"></div>
                <div class="row-empty"></div>
    
            </div>
            </form>
        </footer>
    </main>
</body></html>

<jsp:include page="/template/footer.jsp"></jsp:include>