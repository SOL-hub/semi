<%@page import="home.beans.dto.ItemDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
ItemDto idto = (ItemDto)request.getSession().getAttribute("iteminfo");
 %> 
<jsp:include page="/template/header.jsp"></jsp:include>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>일룸</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/product_detail.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/swiper.min.css">
    <script src="<%=request.getContextPath() %>/js/swiper.min.js"></script>
    <style>
  		.center{
  			text-align: center;
  		}
  		.left{
  			text-align: left;
  		}
  		.right{
  			text-align: right;
  		}
    </style>
    <script src="../js/swiper.min.js"></script>
    
     <script>
 //창의 로딩이 완료되었을 때 실행할 코드를 예약
        window.onload = function(){
            //var mySwiper = new Swiper(선택자, 옵션);
            var mySwiper = new Swiper ('.swiper-container', {
                //swiper에 적용할 옵션들을 작성
                direction: 'horizontal'   //표시방식(수직:vertical, 수평:horizontal)
                ,loop: true //순환 모드 여부
                //자동재생 옵션그룹
                ,autoplay:{
                    delay:10000  //자동재생 시간(1초)
                }
                //페이지 네비게이터 옵션그룹
                ,pagination: {
                    el: '.swiper-pagination', //적용 대상의 선택자
                    type: 'bullets',//네비게이터 모양(bullets/fraction/...)
                },
                //이전/다음 이동버튼 설정그룹
                navigation: {
                    nextEl: '.swiper-button-next',
                    prevEl: '.swiper-button-prev',
                }
                //커서 모양을 손모양으로 변경
                ,grabCursor:true
                //슬라이드 전환 효과(effect)
                //,effect:'coverflow'
                //,effect:'cube'
                ,effect:'fade'
                //,effect:'flip'
                //,effect:'slide'//기본값
            });
        };
//     	// 곱하기
//       function calcNow(){
//     	calc.result_multiply.value = calc_multiply(calc.left.value, calc.right.value);
// 		}
// 		function calc_multiply(left, right){
//     	return left * right;
// }

var sell_price;
var amount;

function init () {
	sell_price = document.form.sell_price.value;
	amount = document.form.amount.value;
	document.form.sum.value = sell_price;
	change();
}

function add () {
	hm = document.form.amount;
	sum = document.form.sum;
	hm.value ++ ;

	sum.value = parseInt(hm.value) * sell_price;
}

function del () {
	hm = document.form.amount;
	sum = document.form.sum;
		if (hm.value > 1) {
			hm.value -- ;
			sum.value = parseInt(hm.value) * sell_price;
		}
}

function change () {
	hm = document.form.amount;
	sum = document.form.sum;

		if (hm.value < 0) {
			hm.value = 0;
		}
	sum.value = parseInt(hm.value) * sell_price;
}  
           </script>
</head>

<body>
<br>
<br>
<br>
<br>
<br>
<br>
<form method="get" name="form">
 <main>
   <div>
    <div class="section-box">
        <div class="f-pic">
            
            <div class="swiper-container">
        <!-- 필수 영역 -->
        <div class="swiper-wrapper">
            <!-- 배치되는 이미지 또는 화면 -->
            <div class="swiper-slide">
                <img src="https://placeimg.com/600/676">
            </div>
            <div class="swiper-slide">
                <img src="https://placeimg.com/600/676/tech">
            </div>
            <div class="swiper-slide">
                <img src="https://placeimg.com/600/676/people">
            </div>
        </div>
             <!-- 페이지 위치 표시 영역(선택) -->
            
        <div class="swiper-pagination"></div>
     

        <!-- 이전/다음 버튼(선택) -->
                         <div class="swiper-btn-zip">
        <div class="swiper-button-prev"></div>
        <div class="swiper-button-next"></div>
           </div>
            </div>
        </div>
    
    <div class=right-box>
        <div class="gkaljzang"></div>
        <div class="f20 mar-b12 left">[상품이름] <%=idto.getItem_name()%></div>
        <div class="f25 mar-b20 left">[상품정보] <%=idto.getItem_info()%></div>
        <div class="f25 colorred mar-b60 left">[상품가격] <%=idto.getItem_price()%>원</div>
        
           
            <div class="delivery">
                <span><b>배송료:</b></span>
                <span>2,500원 고정</span>	
                <span><b>남은수량:</b></span>
                <span><%=idto.getItem_stock()%></span>
            </div>
            <div class="eeee">
                             <div>
                				     <input class="anboim" type="text" name="left" value="<%=idto.getItem_price()%>"/>
        <div class="goway">    
            수량:<input type=hidden name="sell_price" value="<%=idto.getItem_price()%>"/>
<input type="text" name="amount" value="1" size="3" onchange="change();">
<input type="button" value=" + " onclick="add();"><input type="button" value=" - " onclick="del();"><br>

            </div>
				</div>
			</div>
                        <br>       
         

                        <div class="total_price">
                            <b>총구매가</b>
<!--                             <span class="f-right colorred"><input type="text" name="result_multiply" readonly /></span> -->
            				금액 : <input type="text" name="sum" size="11" readonly>원
                        </div>
                        <br>
                    <div class="shop-btn">
                    <a href="#"><input type="button" value="결제하기" class="payit"></a>
                    <a href="#"><input type="button" value="장바구니" class="bagit"></a>                    
                    </div>
                        <div class="border_1"></div>
               
                        
    </div>
               
        
       </div>
       <div style="height:770px"></div>
       <div class="border">
       </div>
       <div class="click_box">
        <p>
            <a href="#sangsea">상세정보</a>
            <a href="#c1">상품평</a>
            <a href="#c2">QnA</a>
        </p>
        <div class="border"></div>
       </div>
       <div style="height:20px"></div>
        <div>
          <p id="sangsea"><img src="https://placeimg.com/600/676/tech" width="1200"></p>
        </div>
        <div>
          <p id="c1"><img src="https://placeimg.com/600/676/animal" width="1200"></p>
        </div>
        <div>
          <p id="c2"><img src="https://placeimg.com/600/676/people" width="1200"></p>
        </div>
        </div>
    </main>
    </form>
</body></html>
<jsp:include page="/template/footer.jsp"></jsp:include>  