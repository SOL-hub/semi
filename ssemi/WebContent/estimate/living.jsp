<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <jsp:include page="/template/header.jsp"></jsp:include>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
	

<!DOCTYPE html>
<html lang="en">
<head>
    <title> 욕실 견적 계산기 </title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>




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


* {
   box-sizing: border-box;
   font-family: 'Noto Sans KR', sans-serif;
   
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
    }

.main {
  padding: 40px 0 0 0;
  text-align:center;

  
}

.roww {
height:130px;
}

   .h2 {
        font-size: 28px;
      line-height: 50px;
      font-weight:700;
      text-align: center;
      
    }



.row-emptyy {
    height: 30px;
}

 .reset_button {
 float: right;
    display: inline-block;
    margin-right:150px;
    margin-top:15px;
    border-radius: 15px;
    line-height: 20px;
    font-size: 13px;
    font-weight: 700;
    color: #757575;
    background-color: #f5f5f5;
    border: none;
    cursor: pointer;
}

  .half {
  background: linear-gradient(to top, #EAE2E5 40%, transparent 50%);
}

p{
    font-family: "Noto Sans KR", "Apple SD Gothic Neo", "맑은 고딕", "Malgun Gothic", sans-serif;
	font-size: 15px;
	line-height: 40px;
	color: var(--bblack);
	font-weight: 600;
    	letter-spacing: -0.2px;
}


.form-control {
font-family: "Noto Sans KR", "Apple SD Gothic Neo", "맑은 고딕", "Malgun Gothic", sans-serif;
    position: relative;
	display: inline-block;
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

.overl{
background-color: var(--red);
font-family: "Noto Sans KR", "Apple SD Gothic Neo", "맑은 고딕", "Malgun Gothic", sans-serif;
	font-size: 18px;
	line-height: 40px;
	font-weight: 600;
	color: var(--white);
    	letter-spacing: -0.2px;
}
.titlee{
padding-bottom:15px;
text-align:center;
}


    .foott {
  background-color: #EAE2E5 ;
  width: 100%;
  height: 80px;
  padding-top: 15px;
  width: 100%;
  bottom: 5px;
  position: fixed;
   z-index: 300;
   opacity: 0.8;
   text-align:center;
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
        font-size: 15px;
    cursor: pointer;
    margin: 0 60px 0 30px;
    line-height: 20px;
    font-weight: 700;
    }
    
    .submit_button:hover{
    background-color: #3362a1  ;
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
	width: 150px;
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



.menuu a {
    margin-top: 10px;
    margin-bottom: 10px;
    padding: 12px 10px 12px 10px;
    text-decoration: none;
    font-size: 16px;
    color: #C5C5D7;
    display: inline;
    text-align: center;
    font-weight: 900;
    cursor:pointer;

}
.menuu a:hover {
  color: #1778ba;

}

.standard {
font-size:14px;

}

.standard:hover {
text-decoration:underline; 
color: var(--red);
cursor:pointer; 
}


.bubu
{flex: 0 1 auto;
 float: left;
 
    margin: 15px 0 0 50px;
    padding: 0;
    background: none;
    border: none;
    font-family: inherit;
    font-weight: 400;
    font-size: 14px;
    line-height: 1.3;
    color: var(--black);}
    
#overlay {
  position: fixed;
  display: none;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: rgba(0,0,0,0.7;
  z-index: 2;
  cursor: pointer;
}

#textt{
  position: absolute;
  top:50%;
  left:50%;
  text-align:center;
  font-size: 18px;
  color: white;
  transform: translate(-50%,-50%);
  -ms-transform: translate(-50%,-50%);
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
    
    
    function on() {
  	  document.getElementById("overlay").style.display = "block";
  	}

  	function off() {
  	  document.getElementById("overlay").style.display = "none";
  	}
  	
    </script>
  

</head>
<body>
		<div class="roww"></div>

<div class="menuu" align="center">
<a href="<%=request.getContextPath()%>/estimate/bath.jsp"> 욕실</a> 
 <a href="<%=request.getContextPath()%>/estimate/kit.jsp">주방</a>
 <a href="<%=request.getContextPath()%>/estimate/living.jsp"><font color=#1778ba>마루</font></a>
</div>

<div class="line">
<div class="main"> 

        <form method="post" action="living2.jsp" name="insertForm" onsubmit="return formCheck();">
        <div class="titlee">
   <span class="h2"> 마루 견적 계산 </span> 
   </div>
 


<!--옵션1-->
   	    
						<p ><span class="half"> 시공할 마루 종류를 선택해주세요 </span></p>
						<input class="checkbox-tools" type="radio" data-price="200000" name="type" checked id="type-1" value="강마루" >
						<label class="for-checkbox-tools" for="type-1"> <img width="110px" height="110px"
               src="<%=request.getContextPath()%>/image/maruu.PNG" style="margin-bottom:10px;">	
							강마루
						</label>
						<!--
						--><input class="checkbox-tools" type="radio" data-price="300000" name="type" id="type-2" value="원목마루">
						<label class="for-checkbox-tools" for="type-2"><img width="110px" height="110px"
               src="<%=request.getContextPath()%>/image/maruu.PNG" style="margin-bottom:10px;">	
							원목마루
						</label><!--
						--><input class="checkbox-tools" value="강화마루" data-price="400000" type="radio" name="type" id="type-3">
						<label class="for-checkbox-tools" for="type-3"><img width="110px" height="110px"
               src="<%=request.getContextPath()%>/image/maruu.PNG" style="margin-bottom:10px;">	
						강화마루
						</label><!--
						--><input class="checkbox-tools" value="온돌마루" data-price="500000" type="radio" name="type" id="type-4">
						<label class="for-checkbox-tools" for="type-4"><img width="110px" height="110px"
               src="<%=request.getContextPath()%>/image/maruu.PNG" style="margin-bottom:10px;">	
						온돌마루
						</label> <div class="row-emptyy"></div>
  

								
<!--옵션2-->
       	    	
						<p><span class="half"> 마루 패턴은 어떻게 하실 생각이세요?</span></p>
				
						<input class="checkbox-tools" type="radio" data-price="100000" name="pattern" checked id="pattern-1" value="벽돌(Brick)" >
						<label class="for-checkbox-tools" for="pattern-1">
						<img width="110px" height="110px"
               src="<%=request.getContextPath()%>/image/maru2.PNG" style="margin-bottom:10px;">
							벽돌<br>(Brick)
						</label>
						<!--
						--><input class="checkbox-tools" type="radio" data-price="150000" name="pattern" id="pattern-2" value="헤링본(Herringbone)">
						<label class="for-checkbox-tools" for="pattern-2">
						<img width="110px" height="110px"
               src="<%=request.getContextPath()%>/image/maru2.PNG" style="margin-bottom:10px;">
							헤링본<br>(Herringbone)
						</label>
						<!--
						--><input class="checkbox-tools" type="radio" data-price="250000" name="pattern" id="pattern-3" value="파케이(Parquet)">
						<label class="for-checkbox-tools" for="pattern-3">
						<img width="110px" height="110px"
               src="<%=request.getContextPath()%>/image/maru2.PNG" style="margin-bottom:10px;">
							파케이<br>(Parquet)
						</label>
					
						 <div class="row-emptyy"></div>
  	

								
<!--옵션3-->
       	    
						<p><span class="half"> 마루 수종을 선택해주세요 </span></p>
				
						<input class="checkbox-tools" type="radio" data-price="250000" name="color" checked id="color-1" value="오크(Oak)" >
						<label class="for-checkbox-tools" for="color-1">
							오크 <br>(Oak)
						</label>
						<!--
						--><input class="checkbox-tools" type="radio" data-price="360000" name="color" id="color-2" value="메이플(Maple)">
						<label class="for-checkbox-tools" for="color-2">
							메이플<Br>(Maple)
						</label>
						<!--
						--><input class="checkbox-tools" type="radio" data-price="280000" name="color" id="color-3" value="이로코(Iroko)">
						<label class="for-checkbox-tools" for="color-3">
							이로코<br>(Iroko)
						</label><!--
						--><input class="checkbox-tools" type="radio" data-price="180000" name="color" id="color-4" value="멀바우(Merbau)">
						<label class="for-checkbox-tools" for="color-4">
							멀바우<br>(Merbau)
						</label>
						<!--
						--><input class="checkbox-tools" type="radio" data-price="220000" name="color" id="color-5" value="월넛(Walnut)">
						<label class="for-checkbox-tools" for="color-5">
							월넛<br>(Walnut)
						</label>
						<!--
						--><input class="checkbox-tools" type="radio" data-price="300000" name="color" id="color-6" value="티크(Teak)">
						<label class="for-checkbox-tools" for="color-6">
							티크<br>(Teak)
						</label>
						 <div class="row-emptyy"></div>
  
  						
<!--옵션4-->
						<p><span class="half"> 마루 브랜드는 어떤걸 선호하시나요? </span></p>
				
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
		
						 <div class="row-emptyy"></div>
  
				</div>

<div class="foott"> 

		 <input type="submit" class="submit_button fott" value="가격 확인 ">
            
    <input class="reset_button" type='reset' value="초기화" > 
		  <input type="hidden" name="pricee" value="">   


</form>
<button class="bubu" onclick="on()">
<span class="standard" >견적 계산 기준이 뭔가요? </span></button>


<div id="overlay" onclick="off()">
  <div id="textt">
  <p class="overl" > <b> 견적 계산 기준이 뭔가요? </b> </p>
  
							<div class="row-emptyy"></div>
					
  보편적인 계산법을 활용하였습니다. <br>
  시공 현장의 상태, 자재 및 인건비 차이, 시장 상황 변동 등으로 인해<br> 실제 견적과 다소 차이가 날 수 있습니다.<br>
  보다 정확한 견적은 카카오톡 채널에서 직접 상담신청을 통해 문의하실 수 있습니다.<br>
  견적계산 기능이 더욱 정확할 수 있게 지속해서 개선해 나가겠습니다.<br>
  </div>
</div>
</div>
</body>
</html> 
<jsp:include page="/template/footer.jsp"></jsp:include>