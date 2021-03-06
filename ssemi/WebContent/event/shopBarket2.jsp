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
	href="<%=request.getContextPath()%>/css/shopBarket2.css">
	
    <link
	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">


  
<form action="cart_add.do" method="post">

<div class = "img-wrap">
   <article>
   <br><br><br><br><br><!-- 임시공간맞추기담당 -->
  <!-- <h1>reemD </h1> -->
    <br>
    <h4>01 장바구니 - 02주문서 작성 - 03주문완료</h4>
    <br>
    <h1 style =font-size:50px;>장바구니</h1>
    <br>

    <h5 style= font-size:30px; width:1000px;>함께 사면 좋은 제품 추천</h5>
    <hr class="hr-twolow">
    <!--제품관련 스타일-->
    <ul>
    <li><img class="img-shadow" src="https://placehold.it/180x180?text=TEST1" ><h5>넘편해소파<br>130,000</h5></li>
   
        <li><img class="img-shadow" src="https://placehold.it/180x180?text=TEST2"><h5>2인용인듯한침대<br>26,000,000</h5></li>
    
        <li><img class="img-shadow" src="https://placehold.it/180x180?text=TEST3"><h5>계속앉고파의자<br>4,560,000</h5></li>
    
        <li><img class="img-shadow" src="https://placehold.it/180x180?text=TEST4"><h5>세상포근쿠션<br>25,000</h5></li>
        
        <li><img class="img-shadow" src="https://placehold.it/180x180?text=TEST4"><h5>우리아들책상<br>95,000</h5></li>
    
    <li><img class="img-shadow" src="https://placehold.it/180x180?text=TEST4"><h5>이가격에이가죽소파<br>670,000,000</h5></li>
    </ul>
    <!-- 테이블 시작!> -->
    
    <script type="text/javascript" src="/JaueryStudy/js/jquery-3.3.1.min.js"></script>
    
      


<body class="Body">
   <div id="frame">
       <form>
           <div id="frame2">
               <!-- <span style="font-size: 30pt; font-weight: bold;" >장바구니</span>-->
             
               <span class="home">홈>장바구니</span>
               <span></span>
           </div>
           
           <br/>
           <div>
               
              <h3 style="text-align: center; margin: 10px 100px 10px 10px;">주문하실 상품을 선택해주세요</h3>
           </div>
           <br/>
           
          <%--상품정보 테이블--%>
           
              <div>
               
               <table class="calculation1">
                   <thead>
                       
                    <tr>
                        <th><input style="width: 10px;" type="checkbox" name="checkbox" id="check"/></th>
                        <th style="width: 280px; height: 50px;"><span>이미지</span></th>
                        <th style="width: 450px;"><span>상품정보</span></th>
                        <th style="width: 80px;">판매가</th>
                        
                      
                        <th style="width: 20px;">수량</th>
                        <th style="width: 80px;">적립금</th>
                     
                        <th style="width: 100px;">배송비</th>
                        
                        <th style="width: 90px;">선택</th>
                        
                    </tr>
                   </thead>
                   
                   <tbody>
                       <tr style="height: 90px; background-color: #fff;">
                          <td style="text-align: left; text-align: center;border-right: none;">
                              <input type="checkbox" name="checkbox"/>
                          </td>
                          <td style="border-left: none; border-right:none;"><img style="width: 80%;" src="/img/의자.png"></td>
                          
                          <td style="text-align: left; padding-left: 10px; border-left: none; font-weight: bold;">뭘까/JOYMENT-COTTON LOGO J BALL CAP</td>
                          
                          <td><span style="padding-left: 10px;">0</span>원</td>
                          
                         
                           
                          
                       <td style="width:90px;">
                       <form action="cart_add.do" name="form1" method="post">
                        <input type="hidden" name="item_no" value="goodbed">
                        <select name="amount">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                        </select>&nbsp;개
                        <input type="submit" value="장바구니에 담기">
                         </form>
                           </td>
                           
                           <td style="width:90px;"></td>
                           <td>2,500원<br/>고정</td>
                                                    
                      
                       <td>
                           <button class="btn default" style=" width: 90px; padding: 10px; margin-bottom: 3px; font-size: 15px; background: white">바로구매</button>
                           <button class="btn default" style=" width: 90px; padding: 10px; margin-bottom: 3px; font-size: 15px;">찜 등록</button>
                           <button class="btn default" style="width: 90px; padding: 10px; margin-bottom: 3px; font-size: 15px">삭제하기</button>
                       </td>
                   </tr> 
                   </tbody>
                   
                   <tfoot>
                       <tr style="height: 60px;">
                       <td colspan="5" style="border-right: none; text-align: left; padding-left: 10px;">
                           <span>[기본배송]</span>
                           </td>
                           <td colspan="5" style="border-left: nonoe; text-align: right; padding-right: 10px;">
                           상품금액<span>0</span>+ <span>배송비 2,500=합계</span>&nbsp;<span style="font-weight: bold; font-size: 15pt;">0</span>
                       </td>
                        </tr>
                        
                        
                   </tfoot>
               </table>
               
               <div style="border: border:solid 1px #e0e0b; padding: 15px 0;">
                   <img src="/semiProject/image/주의!.png" style="margin-left: 5px; position: relative; top:4.5px;">
                   <span style="font-size: 10pt; color: gray;">할인적용 금액은 주문서 작성의 결제예정금액에서 확인 가능합니다.</span>
                   
               </div> 
               
           </div>

           
           
           <%--결제예정금액 테이블--%></%--결제예정금액>
           
           <table class="calculation2">
               <tr>
                   <th>총 상품금액</th>
                   <th>총 배송비</th>
                   <th style="width: 750px; padding: 22px 0;"><span>결제예정금액</span></th>
               </tr>
               
               <tr style="background-color: #fff;">
                  <td style="padding: 22px 0;"><span class="price">0</span>원</td>
                  <td>+<span class ="price">0</span>원</td>
                  <td>-<span class ="price">0</span>원</td>
                   
               </tr>
           </table>
           <br/><br/>
           
           
           
           
           
           
             <div style="margin: 10px 10;">

               <button class="btn default backBtn btnfloat2" style="background-color: gray; color: #fff;"> 전체 삭제하기</button>
               
               <button class="btn default backBtn btnfloat2"> 장바구니 비우기</button>
               <button class="btn default backBtn btnfloat2"> 내 견적서 보기</button>
               <span class="clearboth"></span>
           </div>
           <br/><br/>
           <br>
           
           
           
                         <div align="center">
               <button class="btn default " id="productClear">전체상품주문</button>
               
               <button class="btn default backBtn" id="productClear">선택상품주문</button>
               <br><br><br>
               <button class = "btn default footerbtn" id="footerbtn">쇼핑계속하기</button>
               <span class="clearboth"></span>
               
           </div>
           <br/><br/><br/><br/><br/>
           
           <div style="border: solid 1px #3333; padding: 10px 0; font-size: 12pt; background-color: antiquewhite; padding-left: 10px; text align = center">배송 예약 시스템안내
           </div>
           <div style="border: solid 1px #3333; height: 220px; font-size: 12pt; padding-left: 10px;">
           <br/>
           
           <ol>
             
               <li class="lifont"> 제품은 단품이 각각 포장되어 직접 배송/시공해드립니다.(일부 택배 품목 제외)</li>
               <li class="lifont"> 또한, 저의 "reemD는 고객님들의 편의를 위하여 배송일을 좀 더 정확하고 확정할 수 있는 서비스를 제공하도록 노력하고있습니다."</li>
               <li class="lifont"> 배송 희망일을 선택하시면 온라인 담당자와 시공담당자가 세부일정을 확정해 알려드리는 시스템을 실행하고 있습니다.</li>
               <li class="lifont"> 배송시간은 확실하게 지정할 수 없으며 배송 전 시공사가 연락드릴 예정입니다.</li>
               <li class="lifont"> 성수기인 1월~6월사이에는 납기가 많이 지연되는 점, 양해부탁드리며 시공에 다라 희망 배송일이 변경될 수 있습니다. 
               <br>따라서 변경 시 온라인 담당자가 연락을 드리며 일정을 최대한 맞춰드리도록 하겠습니다.</li>
               
           </ol>
           
           
           
           
           </div>
           
           <br/><br/><br/><br/><br/>
           
           <div style="border: solid 1px #3333; padding: 10px 0; font-size: 12pt; background-color: antiquewhite; padding-left: 10px;">결제 전 확인사항
           </div>
           <div style="border: solid 1px #3333; height: 120px; font-size: 12pt; padding-left: 10px;">
    
           <ol>
             
               <li class="lifont">고객의 단순한 변심으로 교환, 반품 빛 환불을 요구할 때 수반되는 배송비는 고객님께서 부담하셔야합니다.</li>
               <br>
               <li class="lifont">상품을 개봉했거나 설치한 후에는 상품의 재판매가 불가능하므로 고객님의 변심에 대한 교환, 반품이 불가능함을 양지해 주시기 바랍니다.</li>
              <br>
               <br>
           </ol>
           
           
           
           
           </div>
           </%--상품정보>
       </form>
    </div>
    
    <jsp:include page="/template/footer.jsp"></jsp:include>