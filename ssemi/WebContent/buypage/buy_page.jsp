<%@page import="home.beans.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%
    	MemberDto mdto = (MemberDto)request.getSession().getAttribute("userinfo");
    	
    
    %>
<jsp:include page="/template/header.jsp"></jsp:include>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>ordersheet</title>

    <style>
        * {
/*             font-size: 20px */
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
            <div class="img-wrap">
                <div align=center>
                    <br>
                    <h1 style="font-size: 50px;">결제 내용</h1>
                </div>
            </div>
            <hr>
            <div class="item_list">
                <div class="item_list2">
                    <div class="item_title center" style="width: 20%;">이미지</div>
                    <div class="item_title center" style="width: 10%">상품이름</div>
                    <div class="item_title center" style="width: 31%">상품정보</div>
                    <div class="item_title" style="width: 10%">배송비</div>
                    <div class="item_title" style="width: 5%">수량</div>
                    <div class="item_title center" style="width: 19%">주문금액</div>
                </div>
                <hr>
                <div class="item_list">

                    <div class="item_list2">
                        <div class="item_title center" style="float: left; ">
                            <div style="item_title border-right: solid 1px #aaa;"></div>
                            <img src="https://placeimg.com/274/274" style="width: 60%">
                        </div>
                        <div style="float: left; padding-top: 5%">dddddddd</div>
                        <div style="float: left; padding-top: 5%; margin-left : 4%; max-width: 28%;">ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</div>
                        <div style="float: left; padding-top: 5%; margin-left : 2%;">2500원</div>
                        <div style="float: left; padding-top: 5%; margin-left : 7%;">2</div>
                        <div style="float: left; padding-top: 5%; margin-left : 10%;">000002</div>
                    </div>
                </div>
            </div>
        </header>
        <div class="row-empty"></div>
        <div class="row-empty"></div>
        <div class="row-empty"></div>
        <div class="row-empty"></div>
        <div class="row-empty"></div>
        <div class="row-empty"></div>
        <div class="row-empty"></div>
        <div class="row-empty"></div>
        <div class="row-empty"></div>

        <hr>
        <section>
            <article class="buy_list1">
                <div class="phrchase-info">
                    <h3>회원 정보</h3>

                    <h4>회원이름</h4>
                    <input class="user-name" type="text" readonly
                    value="<%=mdto.getMember_name()%>">
                    <h4>연락처</h4>
                    <input class="user-phone" readonly
                    value="<%=mdto.getMember_phone()%>">

                    <h4>이메일</h4>
                    <input class="form-email" type="text" readonly
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
                    <label for="cb1"><input type="radio" name="shopping_payment" id="cb1" onchange="toggleTabAutomation(this);" checked>
                        <span>카드</span>
                    </label>
                    <label for="cb2"><input type="radio" name="shopping_payment" id="cb2" onchange="toggleTabAutomation(this);">
                        <span>계좌이체</span>
                    </label>
                </div>

                <div class="row-empty"></div>
                <div class="row-empty">
                    <select>
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
                            카드번호<input type="text">
                        </div>
                    </div>
                    <div class="area" id="cb2-area">
                        <div>
                            계좌번호<input type="text">
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
                </div>
                <div class="row-empty"></div>
                <div class="row-empty"></div>
                <div class="row-empty"></div>
    
            </div>
        </footer>
    </main>
</body></html>

<jsp:include page="/template/footer.jsp"></jsp:include>
