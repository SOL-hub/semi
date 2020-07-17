<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<jsp:include page="/template/header.jsp"></jsp:include>

<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/main.css">
	<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">

    <script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	
	<style>
	    * {
        box-sizing: border-box;
        margin: 0px;
        padding: 0px;
        font-family: 'Noto Sans KR', sans-serif;
    }
        #container {
        width: 100%;
        display: flex;
        
        position: fixed;
        background-color: rgba(255, 255, 255, 0.95);
        height: 110px;
        padding-bottom:20px;
    }
        /* 카테고리 상세 */
    .menu_left_innerMenu {
        display: none;
        position: absolute;
        font-weight: normal;
        border: 1px solid #333;
        width: 70px;
        
        font-size: 12px;
        background-color: rgba(255, 255, 255, 0.95);
    }
    
    
     .swiper-container {
            width: 100%;
            height: 20%;
            z-index:-1;
        }
        
        .main_img {
        	width:100%;
        
        	margin-top:100px;
        }
        
    

	.swiper-pagination > .swiper-pagination-bullet {
    opacity: 1;
    border: white solid 1px;
    background-color: transparent;
}

.swiper-pagination > .swiper-pagination-bullet-active {
    background-color: white;
}

.imgdiv-wrap{
	margin-left: 250px;
	width:467px; height: 570px;
	display:inline;
	
}


.maindiv{
	
	display:inline-block; 
	overflow:hidden;
	

}




.maindiv a img {


transform: scale(1.0);
	transition: all 0.5s linear;
	
}

.maindiv a img:hover {	
transform: scale(1.1);
-webkit-transform: scale(1.1);


}

#a-img{
	margin-left:10px;
	margin-right:10px;
}


	
	</style>
	
	    <script>
        // 창의 로딩이 완료되었을 때 실행할 코드를 예약 
        window.onload = function() {
            // swiper 관련 코드를 이곳에 작성
            var mySwiper = new Swiper('.swiper-container', {

                // swiper에 적용할 옵션들을 작성


                direction: 'horizontal', // 표시 방식 (수직 : vertical , 수평: horizontal)
                loop: true,

                autoplay: {
                    delay: 3000 // 1c초 = 1000
                },

                // 페이지 네비게이터 옵션 그룹 
                pagination: {
                    el: '.swiper-pagination', // element
                    type: 'bullets',

                },

                // Navigation arrows
                navigation: {
                    nextEl: '.swiper-button-next',
                    prevEl: '.swiper-button-prev',
                },

                //추가 적으로 알면 좋은 옵션

                effect: 'fade',

                // And if we need scrollbar
                // scrollbar: {
                //    el: '.swiper-scrollbar',
                // },
            })

        }
    </script>
<article class="w-100">
	<div class="row">
		<h2 class="center"></h2>
	</div>
	<div class="row center">


    <!-- 이미지 슬라이더 영역 -->
    <div class="swiper-container">
        <!-- 필수 영역 -->
        <div class="swiper-wrapper">
            <!-- 실제 배치되는 이미지 또는 화면-->
            <div class="swiper-slide">
                <img src="<%=request.getContextPath()%>/img/index_1.jpg" class="main_img"  height="900px">
            </div>
            <div class="swiper-slide">
               <img src="<%=request.getContextPath()%>/img/index_2.jpg" class="main_img"   height="900px">
            </div>
            <div class="swiper-slide">
               <img src="<%=request.getContextPath()%>/img/index_3.jpg" class="main_img"  height="900px">
            </div>
            ...
        </div>
        <!-- 페이지 위치 표시 영역(선택) -->
        <div class="swiper-pagination"></div>

    </div>

	</div>
</article>


<div class ="imgdiv-wrap">
<div class="maindiv">    
	<a href="<%=request.getContextPath()%>/event/event.jsp"><img src="<%=request.getContextPath()%>/img/event.PNG" ></a>
	</div>
	<div class="maindiv">
	<a href="<%=request.getContextPath()%>/shop/alist.jsp" id="a-img"><img src="<%=request.getContextPath()%>/img/liftstyle.PNG"  ></a>
	</div>
	<div class="maindiv">
	<a href="<%=request.getContextPath()%>/"><img src="<%=request.getContextPath()%>/img/review.PNG"></a>
	</div>
</div>



<jsp:include page="/template/footer.jsp"></jsp:include>




