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
    
    
    <h1 style =font-size:50px;>위시리스트</h1>
    <br>

    
    <hr class="hr-twolow">



<body class="Body">
   <div id="frame">
       <form>
           <div id="frame2">
               <!-- <span style="font-size: 30pt; font-weight: bold;" >장바구니</span>-->
             
               <span class="home">홈>위시리스트</span>
               <span></span>
           </div>
           
              <div>
               
               <table class="calculation1">
                   <thead>
                       
                    <tr>
                        <th><input style="width: 10px;" type="checkbox" name="checkbox" id="check"/></th>
                        <th style="width: 280px; height: 50px;"><span>이미지</span></th>
                        <th style="width: 450px;"><span>상품정보</span></th>
                        <th style="width: 80px;">판매가</th>
                        <th style="width: 20px;">수량</th>
             
                        <th style="width: 90px;">주문</th>
                        
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
                              <input type="number" style="text-align: right; width: 40px; margin-bottom: 3px;" min="1" max="99" step="1" value="1">
                              <button class="btn default" style="border-radius: 3px; size: 10px;">변경</button>
                          </td>
                          
                        
                                                    
                      
                       <td>
                           
                           <button class="btn default" style=" width: 90px; padding: 10px; margin-bottom: 3px; font-size: 15px;">상세보기</button>
                           <button class="btn default" style="width: 90px; padding: 10px; margin-bottom: 3px; font-size: 15px">삭제</button>
                       </td>
                   </tr> 
                   </tbody>
                   
                   <tfoot>
             
                        
                   </tfoot>
               </table>
               
              
               
           </div>

           
        
           
           <br/><br/>
           
           
           
             <div align = "left" style="margin: 10px 10;">

               <button class="btn default backBtn btnfloat2" style="background-color: gray; color: #fff;"> 전체 삭제하기</button>
               
               <button class="btn default backBtn btnfloat2"> 선택상품 삭제</button>
             
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
           
           
           <br/>
          
           
           
           </div>
           
           <br/><br/><br/><br/><br/>
           
       </form>
    </div>
    
    <jsp:include page="/template/footer.jsp"></jsp:include>
    
