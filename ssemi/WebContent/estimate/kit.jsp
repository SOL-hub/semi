<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title> 주방 견적 계산기 </title>


<style>   
@import url('https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@300&display=swap');


    :root {
	--white: #ffffff;
	--light: #f0eff3;
	--black: #000000;
    --bblack: #424242;
	--dark-blue: #1f2029;
	--dark-light: #353746;
	--red: #6A89B2  ;
	--yellow: #C5C5D7;
	--grey: #ecedf3;
}
    

body{
      font-family: "Noto Sans KR", "Apple SD Gothic Neo", "맑은 고딕", "Malgun Gothic", sans-serif;
    width: 100%;
	background: var(--white);
	overflow-x: hidden;
	font-size: 15px;
    height: 100%;
	line-height: 30px;
	-webkit-transition: all 300ms linear;
	transition: all 300ms linear; 
	letter-spacing: 1px;
    -webkit-font-smoothing: antialiased;
    
}



  p{
    font-family: "Noto Sans KR", "Apple SD Gothic Neo", "맑은 고딕", "Malgun Gothic", sans-serif;
	font-size: 15px;
	line-height: 40px;
	color: var(--bblack);
	letter-spacing: -0.2px;
	font-weight: 600;
	-webkit-transition: all 300ms linear;
	transition: all 300ms linear; 
}

    .h2 {
        font-size: 28px;
      line-height: 50px;
      font-weight:700;
      text-align: center;
      
    }
    
    
::selection {
	color: var(--white);
	background-color: var(--black);
}
::-moz-selection {
	color: var(--white);
	background-color: var(--black);
}
mark{
	color: var(--white);
	background-color: var(--black);
}
.section {
    position: relative;
	width: 100%;
	display: block;
	text-align: center;
	margin: 110px auto;
}
.over-hide {
    overflow: hidden;
}
.z-bigger {
    z-index: 100 !important;
}


.background-color{
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: var(--white);
	z-index: 1;
	-webkit-transition: all 300ms linear;
	transition: all 300ms linear; 
}



[type="checkbox"]:checked,
[type="checkbox"]:not(:checked),
[type="radio"]:checked,
[type="radio"]:not(:checked){
	position: absolute;
	left: -9999px;
	width: 0;
	height: 0;
	visibility: hidden;
}
    
    

.checkbox-tools:checked + label,
.checkbox-tools:not(:checked) + label{
	position: relative;
	display: inline-block;
	padding: 20px;
	width: 110px;
    height: auto;
	font-size: 16px;
    font-weight: 600;
	line-height: 20px;
	letter-spacing: 1px;
	margin:  0 auto;
	margin-left: 5px;
	margin-right: 10px;
	margin-bottom: 10px;
	text-align: center;
	border-radius: 4px;
	overflow: hidden;
	cursor: pointer;
	text-transform: uppercase;
	color: var(--dark-blue);
	-webkit-transition: all 300ms linear;
	transition: all 300ms linear; 
}
.checkbox-tools:not(:checked) + label{
	background-color: var(--light);
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.3);
}
.checkbox-tools:checked + label{
    color:var(--light);
    font-weight: 800;
	background-color: transparent;
	box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.3);
}
.checkbox-tools:not(:checked) + label:hover{
	box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.3);
}
.checkbox-tools:checked + label::before,
.checkbox-tools:not(:checked) + label::before{
	position: absolute;
	content: '';
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	border-radius: 5px;
	background-image: linear-gradient(298deg, var(--red), var(--yellow));
	z-index: -1;
}


.checkbox:checked ~ .section .container .row .col-12 .checkbox-tools:not(:checked) + label{
	background-color: var(--light);
	color: var(--dark-blue);
	box-shadow: 0 1x 4px 0 rgba(0, 0, 0, 0.05);
}
    

    


    .line {
        position: relative;
width: 100%;
display: inline-block;
padding: 0;
margin: 0 auto;
text-align: center;
margin: 17px 0;
height: 1px;
        background-image: linear-gradient(298deg, var(--red), var(--yellow));
z-index: 100 !important;
    }
    
    
    
.form-control {
font-family: "Noto Sans KR", "Apple SD Gothic Neo", "맑은 고딕", "Malgun Gothic", sans-serif;
    position: relative;
	display: inline-block;
    transition: .2s border-color, .2s box-shadow, .2s background-color;
    box-sizing: border-box;
    height: 40px;
    text-align: center;
    width: 180px;
    padding: 0 30px 0 30px;
    margin: 0 10px 0 10px;
   margin-bottom: 10px;
    line-height: 40px;
    border-radius: 6px;
    border: solid 1px var(--red);
    background-color: #ffffff;
    color: var(--dark-blue);
    font-size: 15px;
}

    .half {
  background: linear-gradient(to top, #EAE2E5 40%, transparent 50%);
}

.row-empty {
    height: 20px;
}
    
    .foott {
  background-color: #EAE2E5 ;
  height: 60px;
  padding-top:20px;
  width: 100%;
  bottom: 0;
  position:fixed;
   z-index: 300;
   opacity: 0.8;
   text-align:center;
    }
    
    .fott{
     text-align: right;
     color: var(--white);
     font-weight: 700;
        font-family: Tahoma, "Noto Sans KR", "Apple SD Gothic Neo", "맑은 고딕", "Malgun Gothic", sans-serif;
    font-size: 20px;
    line-height: 1;
    vertical-align: -3px;
    }
    
    .submit_button {
         font-family: Tahoma, "Noto Sans KR", "Apple SD Gothic Neo", "맑은 고딕", "Malgun Gothic", sans-serif;
        color: var(--white);
        background-color: var(--red);
        height: 50px;
        width:180px;
        border-radius: 6px;
        border-color: var(--red);
        text-align: center;
        font-size: 15px;;
    cursor: pointer;
    margin-left: 10px;
    padding: 10px 0;
    line-height: 20px;
    font-weight: 700;
    }
    
    .submit_button:hover{
    background-color: #3362a1  ;
    }
    
    .reset_button {
    text-align:left;
    display: inline-block;
    padding: 5px 10px;
    border-radius: 15px;
    line-height: 20px;
    font-family: inherit;
    font-size: 13px;
    font-weight: 700;
    color: #757575;
    background-color: #f5f5f5;
    border: none;
    transition: background-color .2s;
    cursor: pointer;
}

    </style>
    
    <script>
    function formCheck(){
    
var a = document.querySelector("input[name=shape]:checked").getAttribute("data-price"); 
var b = document.querySelector("input[name=sizee]:checked").getAttribute("data-price"); 
var c = document.querySelector("input[name=toptype]:checked").getAttribute("data-price"); 
var d = document.querySelector("input[name=walltype]:checked").getAttribute("data-price"); 
var e = document.querySelector("input[name=tile]:checked").getAttribute("data-price"); 

var fa = document.querySelectorAll("input[name=optionn]:checked");
var total =0;
for(var i=0; i < fa.length; i++){
   total += parseInt(fa[i].dataset.price);
}

   var sum = parseInt(a) + parseInt(b)  + parseInt(c) + parseInt(d) + parseInt(e) + total;
   
   document.querySelector("input[name=pricek]").value=sum;
  
    
}
    
    </script>
  

</head>
<body>
		
     <form method="post" action="kit2.jsp" name="insertForm" onsubmit="return formCheck();">
		<div class="section over-hide z-bigger">
			<div class="container pb-5">
				<div class="row justify-content-center pb-5">
                     
	               
<a href="<%=request.getContextPath()%>/estimate/bath.jsp"> 욕실 </a>
 <a href="<%=request.getContextPath()%>/estimate/kit.jsp"> 주방 </a>
 <a href="<%=request.getContextPath()%>/estimate/living.jsp">마루 </a>
  <a href="<%=request.getContextPath()%>/index.jsp"> 메인페이지로 (테스트) </a>
     <div class="line"> </div>
    
	<div class="row-empty"></div>

   <span class="h2"> 주방 견적 계산 </span> 


    	<div class="row-empty"></div>

<input class="reset_button" type='reset' value="초기화" ></br>

<!--옵션1-->
   	    	<div class="col-12 pt-5">
						<p class="mb-4 pb-2"><span class="half"> 어떤 형태의 싱크대를 시공하실 생각이세요?</span></p>
					</div>
					<div class="col-12 pb-5">
						<input class="checkbox-tools" type="radio" data-price="1600000" name="shape" checked id="shape-1" value="ㅡ형" >
						<label class="for-checkbox-tools" for="shape-1">
							ㅡ형
						</label>
						<!--
						--><input class="checkbox-tools" type="radio" data-price="1800000" name="shape" id="shape-2" value="ㄱ형">
						<label class="for-checkbox-tools" for="shape-2">
							ㄱ형
						</label><!--
						--><input class="checkbox-tools" value="ㄷ형" data-price="2000000" type="radio" name="shape" id="shape-3">
						<label class="for-checkbox-tools" for="shape-3">
						ㄷ형
						</label></div>
								<div class="row-empty"></div>
					
<!--옵션2-->
         	    	<div class="col-12 pt-5">
						<p class="mb-4 pb-2"><span class="half"> 싱크대 가로 사이즈 (가장 긴면)이 어떻게 되나요?</span></p>
					</div>
					<div class="col-12 pb-5">
						<input class="checkbox-tools" type="radio" data-price="100000" name="sizee" checked id="sizee-1" value="240cm" >
						<label class="for-checkbox-tools" for="sizee-1">
							240cm
						</label>
						<!--
						--><input class="checkbox-tools" type="radio" data-price="200000" name="sizee" id="sizee-2" value="320cm">
						<label class="for-checkbox-tools" for="sizee-2">
							320cm
						</label><!--
						--><input class="checkbox-tools" value="400cm" data-price="300000" type="radio" name="sizee" id="sizee-3">
						<label class="for-checkbox-tools" for="sizee-3">
						  400cm
						</label></div>
								<div class="row-empty"></div>
							
							
<!--옵션3-->
       	    	<div class="col-12 pt-5">
						<p class="mb-4 pb-2"><span class="half"> 상판 유형은 어떤걸로 할까요? </span></p>
					</div>
					<div class="col-12 pb-5">
						<input class="checkbox-tools" type="radio" data-price="200000" name="toptype" checked id="toptype-1" value="PT" >
						<label class="for-checkbox-tools" for="toptype-1">
							PT
						</label>
						<!--
						--><input class="checkbox-tools" type="radio" data-price="400000" name="toptype" id="toptype-2" value="인조대리석">
						<label class="for-checkbox-tools" for="toptype-2">
							인조대리석
						</label>
						</div>
								<div class="row-empty"></div>
					
					
			
  						
<!--옵션4-->
       	    	<div class="col-12 pt-5">
						<p class="mb-4 pb-2"><span class="half"> 도어 유형은 어떤걸로 할까요? </span></p>
					</div>
					<div class="col-12 pb-5">
						<input class="checkbox-tools" type="radio" data-price="100000" name="walltype" checked id="walltype-1" value="하이그로시(유광)" >
						<label class="for-checkbox-tools" for="walltype-1">
							하이그로시
						</label>
						<!--
						--><input class="checkbox-tools" type="radio" data-price="200000" name="walltype" id="walltype-2" value="PET(무광)">
						<label class="for-checkbox-tools" for="walltype-2">
							PET(무광)
						</label><!--
						--><input class="checkbox-tools" value="열전사" data-price="300000" type="radio" name="walltype" id="walltype-3">
						<label class="for-checkbox-tools" for="walltype-3">
						  열전사
						</label>
							<!--
						--><input class="checkbox-tools" type="radio" data-price="500000" name="walltype" id="walltype-2" value="원목">
						<label class="for-checkbox-tools" for="walltype-2">
							원목
						</label>
						</div>
								<div class="row-empty"></div>
					
					
						
								
<!--옵션5-->
       	    	<div class="col-12 pt-5">
						<p class="mb-4 pb-2"><span class="half"> 벽 타일은 어떻게 하실 생각이세요?</span></p>
					</div>
					<div class="col-12 pb-5">
						<input class="checkbox-tools" type="radio" data-price="50000" name="tile" checked id="tile-1" value="기존 유지" >
						<label class="for-checkbox-tools" for="tile-1">
							기존유지
						</label>
						<!--
						--><input class="checkbox-tools" type="radio" data-price="300000" name="tile" id="tile-2" value="교체 시공">
						<label class="for-checkbox-tools" for="tile-2">
							교체시공
						</label>
						</div>
								<div class="row-empty"></div>
					
					
<!--옵션6-->
							<div class="col-12 pt-1">
						<p class="mb-4 pb-2"><span class="half"> 추가옵션 (중복선택가능) </span></p>
					</div>
					<div class="col-12 pb-5">
						<input class="checkbox-tools" value="아일랜드 식탁" data-price="350000" type="checkbox" name="optionn" id="optionn-1" checked >
						<label class="for-checkbox-tools" for="optionn-1">
					<span class="text">아일랜드 식탁</span>
						</label><!--
						--><input class="checkbox-tools" value="냉장고장" data-price="280000" type="checkbox" name="optionn" id="optionn-2">
						<label class="for-checkbox-tools" for="optionn-2">							
							<span class="text">냉장고장</span>
						</label><!--
						--><input class="checkbox-tools" value="키큰장" data-price="300000" type="checkbox" name="optionn" id="optionn-3">
						<label class="for-checkbox-tools" for="optionn-3">							
							<span class="text">키큰장</span>
						</label><!--
						--><input class="checkbox-tools" value="뒷선반" data-price="290000" type="checkbox" name="optionn" id="optionn-4">
						<label class="for-checkbox-tools" for="optionn-4">							
							<span class="text">뒷선반</span>
						</label><!--
						--><input class="checkbox-tools" value="쿡탑" data-price="360000" type="checkbox" name="optionn" id="optionn-5">
						<label class="for-checkbox-tools" for="optionn-5">							
					<span class="text">쿡탑</span>
						</label>
					</div>
							<div class="row-empty"></div>

<div class="foott"> 
		 <input type="submit" class="submit_button fott" value="견적계산 확인 ">
		  <input type="hidden" name="pricek" value="">   
</div>

</form>


    	</div>
			</div>	
		</div>
</body>
</html>