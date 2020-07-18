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
    
    {  
            var a = document.querySelector("select[name=bath_gong]");
             var options = a.querySelectorAll("option");
             for(var i=0; i < options.length; i++){

        if(options[i].selected){
       var aa = options[i].getAttribute("data-price"); 
        }
    }
       
             var b = document.querySelector("select[name=bath_sohyung]");
             var optionss = b.querySelectorAll("option");
             for(var i=0; i < optionss.length; i++){

        if(optionss[i].selected){
       var bb = optionss[i].getAttribute("data-price"); 
        }
    }

    
var c = document.querySelector("input[name=tools]:checked").getAttribute("data-price"); 
   
var d = document.querySelector("input[name=bigtools]:checked").getAttribute("data-price"); 
  
var edata = document.querySelectorAll("input[name=chutools]:checked");
var total =0;
for(var i=0; i < edata.length; i++){
   total += parseInt(edata[i].dataset.price);
}

   var sum = parseInt(c) + parseInt(d) + total + parseInt(aa) + parseInt(bb);
   
   document.querySelector("input[name=pricee]").value=sum;
   
}
   
   
    {
    	var ba = document.insertForm;
    	if(ba.bath_gong.value==""){
    		ba.bath_gong.focus(); 
       alert(" 공용(거실)을 선택해주세요!");
    		return false;
    	}
 
            if(ba.bath_sohyung.value==""){
    		ba.bath_sohyung.focus();
            alert(" 소형(안방)을 선택해주세요!");
    		return false;
    		}
               	if(ba.bath_sohyung.value && ba.bath_gong.value ==""){
    		ba.bath_sohyung.focus();
            alert(" 욕실이 있어야 합니다! ");
    		return false;
    		}
            
    	return true;
    }
    }

    
    </script>
</head>
<body>
<div class="roww"></div>

<div class="menuu" align="center">
<a href="<%=request.getContextPath()%>/estimate/bath.jsp"> <font color=#1778ba>욕실</font></a> 
 <a href="<%=request.getContextPath()%>/estimate/kit.jsp">주방</a>
 <a href="<%=request.getContextPath()%>/estimate/living.jsp">마루</a>
</div>

<div class="line">
<div class="main"> 

        <form method="post" action="bath2.jsp" name="insertForm" onsubmit="return formCheck();">
        <div class="titlee">
   <span class="h2"> 욕실 견적 계산 </span> 
   </div>
 


<!--옵션1-->
  <p><span class="half"> 시공할 욕실이 몇 개인가요?</span> </p>
  
  	<select class="form-control
         		" name="bath_gong" style="vertical-align: middle; text-align-last: center">
							<option style="color:#DDD7E4" selected value disabled> - 공용(거실) - </option>
							<option value="1개" data-price="1800000">공용 1개</option>
							<option value="2개" data-price="3600000">공용 2개</option>
							<option value="3개" data-price="5400000">공용 3개</option>
							<option value="0"data-price="0">없음</option>
						</select>
                        
                        <select class="form-control" name="bath_sohyung" style="vertical-align: middle; text-align-last: center">
				 			<option style="color:#DDD7E4" selected value disabled> - 소형(안방) - </option>
							<option value="1개"data-price="1200000">소형 1개</option>
							<option value="2개"data-price="2400000">소형 2개</option>
							<option value="3개"data-price="3600000">소형 3개</option>
							<option value="0"data-price="0">없음</option>
						</select>
                        
  <div class="row-emptyy"></div>
  
  
  
  <!--옵션2-->
 	<p><span class="half"> 어떤 욕실 유형을 선호하세요?</span></p> 
  	<input class="checkbox-tools" type="radio" data-price="500000" name="tools" checked id="tools-1" value="욕조형" >
						<label class="for-checkbox-tools" for="tools-1">
						       <img width="100%"
               src="<%=request.getContextPath()%>/image/exex.PNG" style="margin-bottom:10px;"> 
							욕조형
						</label>
						<!--
						--><input class="checkbox-tools" type="radio" data-price="400000" name="tools" id="tools-2" value="샤워부스형">
						<label class="for-checkbox-tools" for="tools-2">  <img width="100%"
               src="<%=request.getContextPath()%>/image/exex2.PNG" style="margin-bottom:10px;"> 
							샤워부스형
						</label><!--
						--><input class="checkbox-tools" value="파우더형" data-price="800000" type="radio" name="tools" id="tools-3">
						<label class="for-checkbox-tools" for="tools-3">
						  <img width="100%"
               src="<%=request.getContextPath()%>/image/exex3.PNG" style="margin-bottom:10px;"> 
						파우더형
						</label>
							
                                <div class="row-emptyy"></div>
  
  <!--옵션3-->
                  <p><span class="half">타일은 어디에 시공할까요?</span></p>
					
						<input class="checkbox-tools" value="벽" type="radio" data-price="300000" name="bigtools" id="bigtools-1" checked>
						<label class="for-checkbox-tools" for="bigtools-1">
							<span data-hover="벽">벽</span>
						</label><!--
						--><input class="checkbox-tools" value="바닥" type="radio" data-price="200000" name="bigtools" id="bigtools-2">
						<label class="for-checkbox-tools" for="bigtools-2">							
							<span data-hover="바닥">바닥</span>
						</label><!--
						--><input class="checkbox-tools" value="벽+바닥" type="radio" data-price="500000" name="bigtools" id="bigtools-3">
						<label class="for-checkbox-tools" for="bigtools-3">							
							<span data-hover="벽+바닥">벽+바닥</span>
						</label>
				
						
								<div class="row-emptyy"></div>
<!--옵션4-->
	
						<p><span class="half"> 추가옵션 (중복선택가능) </span></p>
						<input class="checkbox-tools" value="젠다이" data-price="250000" type="checkbox" name="chutools" id="chutools-1" checked >
						<label class="for-checkbox-tools" for="chutools-1">
						  <img width="100%"
               src="<%=request.getContextPath()%>/image/exex5.PNG" style="margin-bottom:10px;"> 
					<span class="text">젠다이</span>
						</label>
                        <!--
						--><input class="checkbox-tools" value="거울수납장" data-price="150000" type="checkbox" name="chutools" id="chutools-2">
						<label class="for-checkbox-tools" for="chutools-2">		
												  <img width="100%"
               src="<%=request.getContextPath()%>/image/exex5.PNG" style="margin-bottom:10px;">					
							<span class="text">거울수납장</span>
						</label><!--
						--><input class="checkbox-tools" value="선반" data-price="100000" type="checkbox" name="chutools" id="chutools-3">
						<label class="for-checkbox-tools" for="chutools-3">		
												  <img width="100%"
               src="<%=request.getContextPath()%>/image/exex5.PNG" style="margin-bottom:10px;">					
							<span class="text">선반</span>
						</label><!--
						--><input class="checkbox-tools" value="비데" data-price="300000" type="checkbox" name="chutools" id="chutools-4">
						<label class="for-checkbox-tools" for="chutools-4">		
												  <img width="100%"
               src="<%=request.getContextPath()%>/image/exex5.PNG" style="margin-bottom:10px;">					
							<span class="text">비데</span>
						</label><!--
						--><input class="checkbox-tools" value="환풍기" data-price="400000" type="checkbox" name="chutools" id="chutools-5">
						<label class="for-checkbox-tools" for="chutools-5">			
												  <img width="100%"
               src="<%=request.getContextPath()%>/image/exex5.PNG" style="margin-bottom:10px;">				
					<span class="text">환풍기</span>
						</label>
					
							<div class="row-emptyy"></div>
</div>

<div class="foott"> 
<button class="bubu" type="button">
<span class="standard">견적 계산 기준이 뭔가요? </span></button>
		 <input type="submit" class="submit_button fott" value="가격 확인 ">
            
    <input class="reset_button" type='reset' value="초기화" > 
		  <input type="hidden" name="pricee" value="">   
		
</div>

</form>

</body>
</html> 
<jsp:include page="/template/footer.jsp"></jsp:include>
