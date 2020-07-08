<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>일룸</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/bed_list.css">
    <style>
        /*첫번쨰 사진 위치*/
        .f-pic {
            position: relative;
            /*margin: 120px 800px 0px 0px;*/
            float: left;
            /*margin: 120px 0px 800px 0px;*/

        }

        /*사진들_전체위치*/
        .section-box{
            margin: auto;
        }

        /*첫번쨰 사진과 두번쨰 사진 간격*/
        .tw-pic {
            margin: 30px 0px 0px 0px;/*높이*/
            text-align: left;
        }

        /*두번쨰 사이들간의 간격*/
        .tw-pic>img {
            margin-right: 8.3px;
            position: relative;
            margin-left: -2px
        }

        /*깔창넣기*/
        .gkaljzang {
            height: 15px;
        }

        /*폰트사이즈*/
        .f20 {
            font-size: 20;
        }

        .f25 {
            font-size: 25px;
        }

        .right-box {
           
            width: 490px;
            position: absolute;
            margin: 95px 700px
        }

        /*margin-bottom*/
        .mar-b12 {
            margin-bottom: 12px;
        }

        .mar-b20 {
            margin-bottom: 20px;
        }

        .mar-b60 {
            margin-bottom: 60px;
        }

        /*bold*/

        /*폰트_색깔*/
        .colorred {
            color: #c80a1e
        }

        /*delivery*/
        .delivery {
            margin: 20px 0px 40px 0px;
        }

        .delivery>span {
            padding: 2px;
        }
        /*박스_너비_속성*/
        .select_option{
            width:490px;
            font-size: 20px;
        }
        /*필수_선택_박스_위치*/
        .eeee{
            margin: 10px 0px 0px 0px;
        }
        
        /*total_price*/
        .total_price{
            text-align: left;
        }
        
        
        /*가격 오른쪽으로 가시오*/
        .f-right{
            float: right;
            
        }
        /*shop-btn*/
       .shop-btn{
            margin: 15px 0px 15px;
        }
        
        /*가격_버튼*/
        .payit{
            width: 205px;
            height: 50px;
            margin: 0 5px 0px 0px;
            background-color: #c80a1e;
            color: white;
            border: none;
        }
        /*장바구니_버튼*/
        .bagit{
            width: 205px;
            height: 50px;
            margin-top: -50px;
            background-color: gray;
            border: none;
            color: white;
        }
        /*border-1*/
        .border_1{
            border-top: 1px solid #E0E0E0;
            border-collapse: collapse;
            
        }
        /*border-2*/
        .border-2{
            border-bottom: 1px solid #E0E0E0;
            border-collapse: collapse;
            margin: 1000px 350px 0px 350px
        
            
        }
          
        .h60{
            height: 300px;
        }
    </style>
</head>

<body>
  <main>
   <div>
    <div class="section-box">
        <div class="f-pic">
            <img src="https://placeimg.com/274/274" width="600" height="600">
        </div>
    
    <div class=right-box>
        <div class="gkaljzang"></div>
        <div class="f20 mar-b12">안녕하세요</div>
        <div class="f25 mar-b20">모션베드 캐주얼(라텍스,책상형)</div>
        <div class="f25 colorred mar-b60">39,900원</div>
        
           
            <div class="delivery">
                <span>배송기간:</span>
                <span>내일</span>
                <span><b>배송료:</b></span>
                <span>5,000</span>
                <span><b>제품넘버:</b></span>
                <span>제품id쓰시오</span>
            </div>
            <div class="eeee">
                             <div>
                              <select class="select_option mar-b12"name="area">
                                  <option value="#">[필수]색깔을 선택해주세요</option>
                                  <option value="#">빨</option>
                                  <option value="#">주</option>
                                  <option value="#">노</option>
                                  <option value="#">초</option>
                                  <option value="#">파</option>
                                  <option value="#">람</option>
                                  <option value="#">보</option>
                              </select>
                              </div>
                              <div>
                              <select class="select_option mar-b12"name="area">
                                  <option value="#">[선택]</option>
                                  <option value="#">바보</option>
                                  <option value="#">똥개</option>
                                  <option value="#">멍청이</option>
                                  <option value="#">말미잘</option>
                                  <option value="#">탕수육</option>
                                  <option value="#">육개장</option>
                                  <option value="#">람보</option>
                              </select>
                              </div>
                        </div>
                        <div class="total_price">
                            <b>총구매가</b>
                            <span class="f-right colorred">FREE</span>
                        </div>
                    <div class="shop-btn">
                    <input type="button" value="결제하기" class="payit">
                    <input type="button" value="장바구니" class="bagit">
                    </div>
                        <div class="border_1"></div>
                        <div class="tw-pic">
                <img src="https://placeimg.com/274/274" width="112">
                <img src="https://placeimg.com/274/274" width="112">
                <img src="https://placeimg.com/274/274" width="112">
                <img src="https://placeimg.com/274/274" width="112">
            </div>
    </div>
      </div>
      
      </div>
    </main>
</body></html>