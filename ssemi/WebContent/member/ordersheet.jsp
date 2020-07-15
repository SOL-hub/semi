<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>

<link rel=stylesheet type="text/css"
	href="<%=request.getContextPath()%>/css/shopBarket2.css?ver=1">

<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ordersheet</title>

 <style>

        main {
            text-align: left;
            width: 650px;
            height: none;
            margin: auto;



        }

        .form-name {
            padding: 10px;
            font-size: 15px;
            width: 65%;
            border: 1px solid #aaa;
            
        }




        .form-phone {
            padding: 10px;
            font-size: 15px;
            width: 19.5%;

            margin: 5px 0px;
            border: 1px solid #aaa;
        }


        .form-email {
            padding: 10px;
            font-size: 15px;
            width: 15%;
            margin: 5px 0px;
            border: 1px solid #aaa;
        }
        
        .form-email.form-email{
            width: 18%;
        }
        
        .form-email:nth-child(3) {}

        .form-open {
            padding: 5px;
            font-size: 15px;
            width: 20%;
            margin: 5px 0px;
            border: 1px solid #aaa;
            margin-left: 50;
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

        .elve-checkbox{
            display: inline-block;
        }

        .hope-date{
            display: inline-block;
        }
        
        .form-date {
            padding: 10px;
            font-size: 15px;
            width: 10%;
            margin: 5px 0px;
            border: 1px solid #aaa;
        }

        h4 {
            left;
            padding:0;
            margin: 25px 3px 7px 0;
                    }


        .checkyourpurchase{
            text-align: center;


        }
        
        .class, .checkyourpurchase-button {
            text-align: center;
            padding: 1rem;
            font-size: 16px;
            width: 36%;
            background-color: #C80A1E;
            border: 1px solid #aaa;
            color: white;

        }

        .purchase-button-wrap {
            display: inline-block;
            margin: auto;

        }


        .purchase-button {
            padding: 0.6rem;
            font-size: 14px;
            width: 20%;
            background-color: whitesmoke;
            border: white;
            color: black;
        }

        .purchase-button:hover {
            padding: 0.6rem;
            font-size: 14px;
            width: 20%;
            background-color: #C80A1E;
            border: 1px solid #aaa;
            color: white;
        }
        
        
        
        .checkyourpurchase-button{
            text-align: center;
        }
        
        .hr{width: 100%;}
        
    </style>

	</head>

<body>
    <main>
	
	
		<div class="img-wrap">
		<article>
			<br> <br> <br> <br> <br>
			<!-- 임시공간맞추기담당 -->
			<!-- <h1>reemD </h1> -->
			<br>
			
			<div align= center>
			<h4 font-color="grey">01 장바구니 - 02주문서 작성 - 03주문완료</h4>
			<br>
			<h1 style="font-size: 50px;">주문서 작성</h1>
			<hr>
			</div></div>
			<br>

        <div class="phrchase-info">
            <form action="?" method="post">
                
               
                <h3>주문자 정보</h3>
                <!--주문자 정보 입력창-->

                <h4>주문자명</h4>
                <input class="form-name" type="text" name="user_name" required>
                <h4>연락처</h4>
                <select class="form-phone" name="user_phone">
                    <option value="">010</option>
                    <option value="011">011</option>
                    <option value="016">016</option>
                    <option value="017">017</option>
                    <option value="018">018</option>
                    <option value="019">019</option>
                </select>
                <input class="form-phone" type="text" name="user_phone" required>
                <input class="form-phone" type="text" name="user_phone" required>

                <h4>이메일</h4>
                <input class="form-email" type="text" name="user_email" required>
                <input class="form-email" type="text" name="user_email" placeholder="@naver.com" required>
                <select class="form-email" name="user_email">
                    <option value="">직접입력</option>
                    <option value="네이버(naver.com)">네이버(naver.com)</option>
                    <option value="네이트(nate.com)">네이트(nate.com)</option>
                    <option value="다음(daum.net)">다음(daum.net)</option>
                    <option value="한메일(hanmail.net)">한메일(hanmail.net)</option>
                    <option value="구글(gmail.com)">구글(gmail.com)</option>
                    <option value="야후(yahoo.co.kr)">야후(yahoo.co.kr)</option>
                    <option value="라이코스(lycos.co.kr)">라이코스(lycos.co.kr)</option>

                </select>

                <h6>※주문 제품 선택에 도움을 준 오프라인 매장이 있다면 선택해 주세요.</h6>
                <select class="form-open" name="user_open">
                    <option value="">없음</option>
                    <option value="서울">서울</option>
                    <option value="인천">인천</option>
                    <option value="대전">대전</option>
                    <option value="세종">세종</option>
                    <option value="광주">광주</option>
                    <option value="부산">부산</option>
                    <option value="일본">일본</option>
                    <option value="일본">중국</option>
                </select>



                <div></div>
                <hr>

                <h3>배송지 정보</h3>

                <h4>받는사람</h4>
                <input class="form-name" type="text" name="user_name" required>




                <h6>※주문 제품 선택에 도움을 준 오프라인 매장이 있다면 선택해 주세요.</h6>


                <h4></h4>
                <input class="form-phone" type="text" name="user_phone" required>
                <input class="form-phone" type="text" name="user_phone" required>
                <input class="form-phone" type="text" name="user_phone" required>

                <h4>이메일</h4>
                <input class="form-email" type="text" name="user_email" required>
                <input class="form-email" type="text" name="user_email" placeholder="@naver.com" required>
                <select class="form-email" name="user_email">
                    <option value="">직접입력</option>
                    <option value="네이버(naver.com)">네이버(naver.com)</option>
                    <option value="네이트(nate.com)">네이트(nate.com)</option>
                    <option value="다음(daum.net)">다음(daum.net)</option>
                    <option value="한메일(hanmail.net)">한메일(hanmail.net)</option>
                    <option value="구글(gmail.com)">구글(gmail.com)</option>
                    <option value="야후(yahoo.co.kr)">야후(yahoo.co.kr)</option>
                    <option value="라이코스(lycos.co.kr)">라이코스(lycos.co.kr)</option>
                </select>



                <h4>연락처</h4>
                <select class="form-phone" name="user_phone">
                    <option value="">010</option>
                    <option value="011">011</option>
                    <option value="016">016</option>
                    <option value="017">017</option>
                    <option value="018">018</option>
                    <option value="019">019</option>
                </select>
                <input class="form-phone" type="text" name="user_phone" required>
                <input class="form-phone" type="text" name="user_phone" required>


                <h4>*선택입력</h4>
                <select class="form-house_phone" name="house_phone">
                    <option value="">02</option>
                    <option value="011">031</option>
                    <option value="016">032</option>
                    <option value="017">033</option>
                    <option value="018">043</option>
                    <option value="019">044</option>
                </select>
                <input class="form-phone" type="text" name="user_phone" required>
                <input class="form-phone" type="text" name="user_phone" required>



                <h4>배송시 요청사항</h4>
                <input class="form-request" type="text" name="request" placeholder="200자 이내로 작성해주세요." required>
                <hr>
                <br>
                <br>
                <br>

                <div class="form-service">
                    <h3>배송 예약 서비스</h3>


                    <!--엘리베이터유무 입력창-->
            
                        <h4 div class="elve-checkbox">엘리베이터유무</h4>
                        <input type="checkbox" name="purchase_box">있음
                        <input type="checkbox" name="purchase_box">없음
                    </div>

                    <h4 div class="hope-date">희망 배송일</h4>


                    <input class="form-date" type="date" name="user-date" required>

                    <h2>결제정보</h2>
                    <hr>
                    <h5>총상품금액</h5>
                    <h5>총결제금액</h5>

                   
                        <h4 div class="purchase-button-wrap">결제수단</h4>
                        
                        <button class="purchase-button">포인트</button>
                        <button class="purchase-button">무통장 입금</button>
                        <button class="purchase-button">실시간 계좌이체</button>
                    </div>
                    <br><br>

                    
                    <h4 class="checkyourpurchase"> 결제 전 확인사항</h4>      
                    <br>
                    <div align= center>
                    <button class="checkyourpurchase-button">결제하기</button></div>
        </div>
    </main>
    </body>
</html>
	<jsp:include page="/template/footer.jsp"></jsp:include>