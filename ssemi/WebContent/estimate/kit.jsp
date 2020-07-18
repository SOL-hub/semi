<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <jsp:include page="/template/header.jsp"></jsp:include>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
	

<!DOCTYPE html>
<html lang="en">
<head>
    <title> 주방 견적 계산기 </title>
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

</head>
<body>
<div class="roww"></div>

<div class="menuu" align="center">
<a href="<%=request.getContextPath()%>/estimate/bath.jsp"> 욕실</a> 
 <a href="<%=request.getContextPath()%>/estimate/kit.jsp"><font color=#1778ba>주방</font></a>
 <a href="<%=request.getContextPath()%>/estimate/living.jsp">마루</a>
</div>

<div class="line">
<div class="main"> 

		
     <form method="post" action="kit2.jsp" name="insertForm" onsubmit="return formCheck();">
		   <div class="titlee">
   <span class="h2"> 주방 견적 계산 </span> 
   </div>

<!--옵션1-->
   	    
						<p><span class="half"> 어떤 형태의 싱크대를 시공하실 생각이세요?</span></p>
						<input class="checkbox-tools" type="radio" data-price="1600000" name="shape" checked id="shape-1" value="ㅡ형" >
						<label class="for-checkbox-tools" for="shape-1">		  <img width="100%"
               src="<%=request.getContextPath()%>/img/kit3.PNG" style="margin-bottom:10px;">	
							ㅡ형
						</label>
						<!--
						--><input class="checkbox-tools" type="radio" data-price="1800000" name="shape" id="shape-2" value="ㄱ형">
						<label class="for-checkbox-tools" for="shape-2">	  <img width="100%"
               src="<%=request.getContextPath()%>/img/kit3.PNG" style="margin-bottom:10px;">	
							ㄱ형
						</label><!--
						--><input class="checkbox-tools" value="ㄷ형" data-price="2000000" type="radio" name="shape" id="shape-3">
						<label class="for-checkbox-tools" for="shape-3">	  <img width="100%"
               src="<%=request.getContextPath()%>/img/kit3.PNG" style="margin-bottom:10px;">	
						ㄷ형
						</label>
								       <div class="row-emptyy"></div>
					
<!--옵션2-->
         	     <p><span class="half">싱크대 가로 사이즈 (가장 긴면)이 어떻게 되나요?</span></p>
					
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
						</label>
								<div class="row-emptyy"></div>
							
							
<!--옵션3-->
       	    	<p><span class="half">상판 유형은 어떤걸로 할까요? </span></p>
					
						<input class="checkbox-tools" type="radio" data-price="200000" name="toptype" checked id="toptype-1" value="PT" >
						<label class="for-checkbox-tools" for="toptype-1">		 <img width="100%"
               src="<%=request.getContextPath()%>/img/kit6.PNG" style="margin-bottom:10px;">	
							PT
						</label>
						<!--
						--><input class="checkbox-tools" type="radio" data-price="400000" name="toptype" id="toptype-2" value="인조대리석">
						<label class="for-checkbox-tools" for="toptype-2">		 <img width="100%"
               src="<%=request.getContextPath()%>/img/kit6.PNG" style="margin-bottom:10px;">	
							인조대리석
						</label>
					
							<div class="row-emptyy"></div>
					
					
			
  						
<!--옵션4-->
       	    
						<p><span class="half"> 도어 유형은 어떤걸로 할까요? </span></p>
				
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
					
							<div class="row-emptyy"></div>
					
					
						
								
<!--옵션5-->
       	    	
						<p><span class="half"> 벽 타일은 어떻게 하실 생각이세요?</span></p>
			
						<input class="checkbox-tools" type="radio" data-price="50000" name="tile" checked id="tile-1" value="기존 유지" >
						<label class="for-checkbox-tools" for="tile-1">
							기존유지
						</label>
						<!--
						--><input class="checkbox-tools" type="radio" data-price="300000" name="tile" id="tile-2" value="교체 시공">
						<label class="for-checkbox-tools" for="tile-2">
							교체시공
						</label>
					
					<div class="row-emptyy"></div>
					
<!--옵션6-->
							
						<p ><span class="half"> 추가옵션 (중복선택가능) </span></p>
	
						<input class="checkbox-tools" value="아일랜드 식탁" data-price="350000" type="checkbox" name="optionn" id="optionn-1" checked >
						<label class="for-checkbox-tools" for="optionn-1">
																		  <img width="100%"
               src="<%=request.getContextPath()%>/img/kit5.PNG" style="margin-bottom:10px;">	
					<span class="text">아일랜드 식탁</span>
						</label><!--
						--><input class="checkbox-tools" value="냉장고장" data-price="280000" type="checkbox" name="optionn" id="optionn-2">
						<label class="for-checkbox-tools" for="optionn-2">					  <img width="100%"
               src="<%=request.getContextPath()%>/img/kit5.PNG" style="margin-bottom:10px;">					
							<span class="text">냉장고장</span>
						</label><!--
						--><input class="checkbox-tools" value="키큰장" data-price="300000" type="checkbox" name="optionn" id="optionn-3">
						<label class="for-checkbox-tools" for="optionn-3">						  <img width="100%"
               src="<%=request.getContextPath()%>/img/kit5.PNG" style="margin-bottom:10px;">				
							<span class="text">키큰장</span>
						</label><!--
						--><input class="checkbox-tools" value="뒷선반" data-price="290000" type="checkbox" name="optionn" id="optionn-4">
						<label class="for-checkbox-tools" for="optionn-4">					  <img width="100%"
               src="<%=request.getContextPath()%>/img/kit5.PNG" style="margin-bottom:10px;">					
							<span class="text">뒷선반</span>
						</label><!--
						--><input class="checkbox-tools" value="쿡탑" data-price="360000" type="checkbox" name="optionn" id="optionn-5">
						<label class="for-checkbox-tools" for="optionn-5">					  <img width="100%"
               src="<%=request.getContextPath()%>/img/kit5.PNG" style="margin-bottom:10px;">					
					<span class="text">쿡탑</span>
						</label>
				
							<div class="row-emptyy"></div>
</div>

<div class="foott"> 
<button class="bubu" type="button">
<span class="standard">견적 계산 기준이 뭔가요? </span></button>
		 <input type="submit" class="submit_button fott" value="가격 확인 ">
            
    <input class="reset_button" type='reset' value="초기화" > 
		  <input type="hidden" name="pricek" value="">   
		
</div>

</form>

</body>
</html> 
<jsp:include page="/template/footer.jsp"></jsp:include>
