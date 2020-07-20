<%@page import="home.beans.dao.MemberDao"%>
<%@page import="home.beans.dao.ItemFileDao"%>
<%@page import="home.beans.dto.ItemFileDto"%>
<%@page import="java.text.DecimalFormat"%>
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
   		MemberDao mdao = new MemberDao();
   		MemberDto user = mdao.get(cart_member);
   		
   		
   		CartDto cdto = new CartDto();
   		cdto.setCart_no(Integer.parseInt(request.getParameter("cart_no")));
   		CartDao cdao = new CartDao();
   		
   		String [] setCart= request.getParameterValues("cart_no");
   		DecimalFormat formatter = new DecimalFormat("###,###");
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
            width: 10%;
            background-color: #C80A1E;
            border: white;
            color: white;
            cursor: pointer;
        }
        
        .purchase-button2 {
            padding: 0.6rem;
            font-size: 14px;
            width: 10%;
            background-color: black;
            border: white;
            color: white;
            cursor: pointer;
        }

        .purchase-button:hover {
            padding: 0.6rem;
            font-size: 14px;
            width: 10%;
            background-color: darkorange;
            color: white;
        }
         .purchase-button2:hover {
            padding: 0.6rem;
            font-size: 14px;
            width: 10%;
            background-color: #aaa;
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
        .price{
            font-size:20pt;
            font-weight:bold;
        }
        
        .addr-btn2 {
            padding: 0.5rem;
            font-size: 16px;
            width: 20%;
            background-color: dimgrey;
            border: none;
            color: white;
            cursor: pointer;
            margin-right: 25px
        }
        
        .selectbox { 
        width: 200px; /* 원하는 너비설정 */ 
        padding: .8em .5em; /* 여백으로 높이 설정 */ 
        font-family: inherit; /* 폰트 상속 */ 
        background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%; /* 네이티브 화살표 대체 */ 
        border: 1px solid #999; 
        border-radius: 0px; /* iOS 둥근모서리 제거 */ 
        -webkit-appearance: none; /* 네이티브 외형 감추기 */ 
        -moz-appearance: none; 
        appearance: none;
         }
        .selectbox:focus { 
        width: 200px; /* 원하는 너비설정 */ 
        padding: .8em .5em; /* 여백으로 높이 설정 */ 
        font-family: inherit; /* 폰트 상속 */ 
        background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%; /* 네이티브 화살표 대체 */ 
        border: 1px solid #999; 
        border-radius: 0px; /* iOS 둥근모서리 제거 */ 
        -webkit-appearance: none; /* 네이티브 외형 감추기 */ 
        -moz-appearance: none; 
        appearance: none;
        outline: none;
         }
		.input-number{
		width: 200px; /* 원하는 너비설정 */ 
        padding: .3em .3em; /* 여백으로 높이 설정 */ 
		}

</style>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        function findAddress() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if (data.userSelectedType === 'R') {
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if (data.buildingName !== '' && data.apartment === 'Y') {
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if (extraAddr !== '') {
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        // document.getElementById("sample6_extraAddress").value = extraAddr;

                    } else {
                        // document.getElementById("sample6_extraAddress").value = '';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.querySelector("input[name=shopping_recive_post]").value = data.zonecode;
                    //document.getElementById('sample6_postcode').value = data.zonecode;

                    document.querySelector("input[name=shopping_recive_base_addr]").value = addr;
                    //document.getElementById("sample6_address").value = addr;

//                     // 커서를 상세주소 필드로 이동한다.
//                     document.querySelector("input[name=shopping_extra_addr]").focus();
//                     //document.getElementById("sample6_detailAddress").focus();
                    
                    
                }
            }).open();
        }
    </script>
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
        
        function button_event(){
        var now_point = document.querySelector("#now_point").value;
        var buy_point = document.querySelector("#buy_point").value;
       	
        console.log(now_point);
        console.log(buy_point);
               	
        	var result = confirm("정말 결제하시겠습니까??");
            if (!result){ 
//                 document.form.submit();
            	return false;

            }
            else{  
					if(parseInt(now_point) >= parseInt(buy_point)){
// 						return;
		                document.form.submit();
					}
					else{
						
						confirm("잔여 포인트가 부족합니다.");
						return false;

					}

            }
        	
      }

    </script>
</head>

<body>
    <main>
    <form action="buy_page.do" method="get">
    <header>
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
				int delivery_cost = 0;	
									
						
								
				for(int i=0; i<setCart.length; i++) {
					int cart_no = Integer.parseInt(setCart[i]);
					CartDto cdto2 = cdao.get_cart2(cart_no);

				ItemDao idao = new ItemDao();
				ItemDto itemName = idao.item_get(cdto2.getCart_item_name());
				
				ItemFileDao ifdao = new ItemFileDao();
				List<ItemFileDto> file_list = ifdao.getList(itemName.getItem_no());
					
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
                   	 <%for(ItemFileDto ifdto : file_list){%>
							<img src="<%=request.getContextPath() %>/member/download2.do?item_file_no=<%=ifdto.getItem_file_no()%>" width="100px" height="100px">
							
						<%} %>   
                    </td>
                    <td class="center" style="width: 5%">
                    	<input class="input_text_style" type="text" readonly value="<%=itemName.getItem_name()%>">
                    	<input type="hidden" name="shopping_item_name" value="<%=itemName.getItem_no() %>">
                    </td>
                    <td class="center" style="width: 5%">
                    	<textarea  readonly class="text_textarea"><%=itemName.getItem_info()%></textarea>
                    </td> 
                    <td class="center" style="width: 5%">
                    	<input style=" width: 40%;" class="input_text_style" type="text" value="0">원
                    </td>
                    <td class="center" style="width: 5%">
                    	<input style=" width: 40%;" class="input_text_style" type="text" value="<%=cdto2.getCart_cnt() %>" name="shopping_item_cnt">
                    </td>
                    <td class="center" style="width: 5%;">
                    	<input style= "text-align: right; width: 70%;" class="input_text_style" type="text" value="<%=formatter.format(total_price)%>">원
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
                	<td colspan="4" style="background-color: white;"></td>
                	<td>총수량</td>
                	<td>총 금액</td>
                </tr>
                <tr class="center">
                	<td colspan="4" style="background-color: white;"></td>
                	<td><%=total_cnt %></td>
                	<td><%=formatter.format(real_total_price) %>원</td>
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
                        <input type="button" class="addr-btn2" value="주소찾기" onclick="findAddress();">
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
<!--                     <label for="cb1"><input type="radio" name="shopping_payment" id="cb1" onchange="toggleTabAutomation(this);" checked value="카드"> -->
<!--                         <span>카드</span> -->
<!--                     </label> -->
<!--                     <label for="cb2"><input type="radio" name="shopping_payment" id="cb2" onchange="toggleTabAutomation(this);" value="계좌이체"> -->
<!--                         <span>실시간 계좌이체</span> -->
<!--                     </label> -->
                    <label for="cb3"><input type="radio" name="shopping_payment" id="cb3" onchange="toggleTabAutomation(this);" value="포인트 결제">
                        <span>포인트 결제</span>
                    </label>
                </div>

<!--                 </div> -->
<!--                      <div class="row-empty"></div> -->
<!--                     <div class="area on" id="cb1-area"> -->
<!--                     	<select name="shopping_paybank" class="selectbox"> -->
<!--                         <option>카드선택</option> -->
<!--                         <option>국민카드</option> -->
<!--                         <option>신한카드</option> -->
<!--                         <option>BC카드</option> -->
<!--                    		 </select> -->
<!--                    		 <div class="row-empty"></div> -->
<!--                         <div> -->
<!--                             <img src="https://placeimg.com/274/274"> -->
<!--                         </div> -->
<!--                         <div class="row-empty"></div> -->
<!--                         <div class="row-empty"></div> -->
<!--                         <div> -->
<!--                             카드번호 입력 <input class="input-number" type="text" name="shopping_paybank_num"> -->
<!--                         </div> -->
<!--                     </div> -->
                    
<!--                     <div class="area" id="cb2-area"> -->
<!--                     <select name="shopping_paybank" class="selectbox"> -->
<!--                         <option>은행선택</option> -->
<!--                         <option>국민은행</option> -->
<!--                         <option>신한은행</option> -->
<!--                         <option>기업은행</option> -->
<!--                     </select> -->
<!--                     <div class="row-empty"></div> -->
<!--                     <div> -->
<!--                     	입금 하실 계좌번호<br><br>           -->
<!--                     	국민은행 : 111-111-11111<br> -->
<!--                     	신한은행 : 222-222-22222<br> -->
<!--                     	기업은행 : 333-333-33333 -->
<!--                     </div> -->
<!--                     <div class="row-empty"></div> -->
<!--                     <div class="row-empty"></div> -->
<!--                         <div> -->
<!--                             내 계좌번호 입력 <input class="input-number" type="text" name="shopping_paybank_num"> -->
<!--                         </div> -->
<!--                     </div> -->
                    
                    <div class="area" id="cb3-area">
                   	
                   	 	<div class="row-empty">
                    		현재 내 잔여 포인트 : <input class="input-number right now-point" type="text" id="now_point" value="<%=user.getMember_point() %>" readonly> 포인트
                    		
                    	</div>
                    		<div class="row-empty"></div>
                    		<div class="row-empty"></div>
                        <div>
                           	 결제할 포인트: <input class="input-number right buy-point" type="text" id="buy_point" name="member_point" value="<%=real_total_price%>"  readonly>포인트
                           	 
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
                    	<span class="price"><%=formatter.format(real_total_price) %></span>원
                </div>
               
                <div class="row-empty center"></div>
                <div class="row-empty center"></div>
                <div class="row-empty center">
                 <div class="row-empty center"></div>
                    <hr>
                     <div class="row-empty center"></div>
                      <div class="row-empty center"></div>
                    <input type="submit" value="결제하기" class="purchase-button" onclick="return button_event();">
                    <input type="submit" value="결제취소" class="purchase-button2" onclick="history.back();">
                </div>
                <div class="row-empty"></div>
                <div class="row-empty"></div>
                <div class="row-empty"></div>
    
            </div>
            
        </footer>
        </form>
    </main>
</body></html>

<jsp:include page="/template/footer.jsp"></jsp:include>