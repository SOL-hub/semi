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
    	// 곱하기
      function calcNow(){
    	calc.result_multiply.value = calc_multiply(calc.left.value, calc.right.value);
		}
		function calc_multiply(left, right){
    	return left * right;
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
<form method="post" name="calc">
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
            <div class="swiper-slide">
                <img src="https://placeimg.com/600/676">
            </div>
            <div class="swiper-slide">
                <img src="https://placeimg.com/600/676/tech">
            </div>
            <div class="swiper-slide">
                <img src="https://placeimg.com/600/676/people">
            </div>
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
