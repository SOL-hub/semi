<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title> 마루 견적 계산기 </title>


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
    
var a = document.querySelector("input[name=type]:checked").getAttribute("data-price"); 
var b = document.querySelector("input[name=pattern]:checked").getAttribute("data-price"); 
var c = document.querySelector("input[name=color]:checked").getAttribute("data-price"); 
var d = document.querySelector("input[name=brand]:checked").getAttribute("data-price"); 

   var sum = parseInt(a) + parseInt(b)  + parseInt(c) + parseInt(d) ;
   
   document.querySelector("input[name=pricee]").value=sum;
  
    
}
    
    </script>
  

</head>
<body>
		
     <form method="post" action="living2.jsp" name="insertForm" onsubmit="return formCheck();">
		<div class="section over-hide z-bigger">
			<div class="container pb-5">
				<div class="row justify-content-center pb-5">
                    
	          
 <a href="<%=request.getContextPath()%>/estimate/bath.jsp"> 욕실 </a>
 <a href="<%=request.getContextPath()%>/estimate/kit.jsp"> 주방 </a>
 <a href="<%=request.getContextPath()%>/estimate/living.jsp">마루 </a>
   <a href="<%=request.getContextPath()%>/index.jsp"> 메인페이지로 (테스트) </a>
     <div class="line"> </div>
    
	<div class="row-empty"></div>

   <span class="h2"> 마루 견적 계산 </span> 


    	<div class="row-empty"></div>

<input class="reset_button" type='reset' value="초기화" ></br>

<!--옵션1-->
   	    	<div class="col-12 pt-5">
						<p class="mb-4 pb-2"><span class="half"> 시공할 마루 종류를 선택해주세요 </span></p>
					</div>
					<div class="col-12 pb-5">
						<input class="checkbox-tools" type="radio" data-price="200000" name="type" checked id="type-1" value="강마루" >
						<label class="for-checkbox-tools" for="type-1">
							강마루
						</label>
						<!--
						--><input class="checkbox-tools" type="radio" data-price="300000" name="type" id="type-2" value="원목마루">
						<label class="for-checkbox-tools" for="type-2">
							원목마루
						</label><!--
						--><input class="checkbox-tools" value="강화마루" data-price="400000" type="radio" name="type" id="type-3">
						<label class="for-checkbox-tools" for="type-3">
						강화마루
						</label><!--
						--><input class="checkbox-tools" value="온돌마루" data-price="500000" type="radio" name="type" id="type-4">
						<label class="for-checkbox-tools" for="type-4">
						온돌마루
						</label></div>
								<div class="row-empty"></div>

								
<!--옵션2-->
       	    	<div class="col-12 pt-5">
						<p class="mb-4 pb-2"><span class="half"> 마루 패턴은 어떻게 하실 생각이세요?</span></p>
					</div>
					<div class="col-12 pb-5">
						<input class="checkbox-tools" type="radio" data-price="100000" name="pattern" checked id="pattern-1" value="벽돌(Brick)" >
						<label class="for-checkbox-tools" for="pattern-1">
							벽돌<br>(Brick)
						</label>
						<!--
						--><input class="checkbox-tools" type="radio" data-price="150000" name="pattern" id="pattern-2" value="헤링본(Herringbone)">
						<label class="for-checkbox-tools" for="pattern-2">
							헤링본(Herringbone)
						</label>
						<!--
						--><input class="checkbox-tools" type="radio" data-price="250000" name="pattern" id="pattern-3" value="파케이(Parquet)">
						<label class="for-checkbox-tools" for="pattern-3">
							파케이(Parquet)
						</label>
					
						</div>
								<div class="row-empty"></div>					

								
<!--옵션3-->
       	    	<div class="col-12 pt-5">
						<p class="mb-4 pb-2"><span class="half"> 마루 수종을 선택해주세요 </span></p>
					</div>
					<div class="col-12 pb-5">
						<input class="checkbox-tools" type="radio" data-price="250000" name="color" checked id="color-1" value="오크(Oak)" >
						<label class="for-checkbox-tools" for="color-1">
							오크 <br>(Oak)
						</label>
						<!--
						--><input class="checkbox-tools" type="radio" data-price="360000" name="color" id="color-2" value="메이플(Maple)">
						<label class="for-checkbox-tools" for="color-2">
							메이플(Maple)
						</label>
						<!--
						--><input class="checkbox-tools" type="radio" data-price="280000" name="color" id="color-3" value="이로코(Iroko)">
						<label class="for-checkbox-tools" for="color-3">
							이로코(Iroko)
						</label><!--
						--><input class="checkbox-tools" type="radio" data-price="180000" name="color" id="color-4" value="멀바우(Merbau)">
						<label class="for-checkbox-tools" for="color-4">
							멀바우(Merbau)
						</label>
						<!--
						--><input class="checkbox-tools" type="radio" data-price="220000" name="color" id="color-5" value="월넛(Walnut)">
						<label class="for-checkbox-tools" for="color-5">
							월넛(Walnut)
						</label>
						<!--
						--><input class="checkbox-tools" type="radio" data-price="300000" name="color" id="color-6" value="티크(Teak)">
						<label class="for-checkbox-tools" for="color-6">
							티크<br>(Teak)
						</label>
						</div>
								<div class="row-empty"></div>		
  						
<!--옵션4-->
       	    	<div class="col-12 pt-5">
						<p class="mb-4 pb-2"><span class="half"> 마루 브랜드는 어떤걸 선호하시나요? </span></p>
					</div>
					<div class="col-12 pb-5">
						<input class="checkbox-tools" type="radio" data-price="500000" name="brand" checked id="brand-1" value="브랜드" >
						<label class="for-checkbox-tools" for="brand-1">
							브랜드
						</label>
						<!--
						--><input class="checkbox-tools" type="radio" data-price="280000" name="brand" id="brand-2" value="비브랜드">
						<label class="for-checkbox-tools" for="brand-2">
							비브랜드
						</label><!--
						--><input class="checkbox-tools" value="무관" data-price="300000" type="radio" name="brand" id="brand-3">
						<label class="for-checkbox-tools" for="brand-3">
						  무관
						</label>
		
						</div>
								<div class="row-empty"></div>
					
	

<div class="foott"> 
		 <input type="submit" class="submit_button fott" value="견적계산 확인 ">
		  <input type="hidden" name="pricee" value="">   
</div>

</form>


    	</div>
			</div>	
		</div>
</body>
</html>