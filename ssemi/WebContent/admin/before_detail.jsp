<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <jsp:include page="/template/header.jsp"></jsp:include>

<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/admin.css">
<script>
        function changeCheckbox(){
            //해야할 일
            //1. .select-all의 체크상태를 불러온다.
            var selectAll = document.querySelector(".select-all").checked;
            
            //2. 1번에서 불러온 값으로 모든 .select-item에 check 여부를 설정    
            
            //(주의) document.querySelector()로는 태그를 1개밖에 선택할 수 없다.
            // - document.querySelectorAll()로 태그를 모두 선택할 수 있다.
            // - 위의 명령은 사용 시 결과가 "배열"로 전달된다.
            var selectItem = document.querySelectorAll(".select-item");
            //for(var i=0; i < selectItem.length; i++){
            for(var i in selectItem){
                selectItem[i].checked = selectAll;    
            }
            
        }
    </script>

	
 <style>
 
 		.totaldiv{
 			margin-top:150px;
 			margin-left: 750px;
 		}
 
 
        h2 {

            color: #C80A1E;
        }

        .totalth {

            width: 100px;
            padding: 10px;
            color: #C80A1E;
        }

        .totaltd {
            padding-left: 15px;
            width: 450px;

        }

        select {
            margin-right: 5px;
        }

        .admin-submit {
            width: 150px;
            margin-left: 350px;
        }
        
        
        
        .list-table-wrap {
        	width:900px;
        	margin-right:1000px;
        	
        }
        
        
        
    .beforetable{
    	
    	color:white;
    	border: 1px solid transparent; 
    }

	.functionbutton{
		
		margin-bottom: 5px;
		color:white;
    	border: 1px solid transparent; 
	}
	    #totalcolor{
    	
    	color:#AAAAAA;
    }
    
    .list-wrap{
    	margin-top: 200px;
    	margin-left:200px;
    }


input[id="cb1"],input[id="cb2"]{
	display: none;
}

input[id="cb1"]+label,input[id="cb2"]+label {
	width: 10%;
	height: 20px;
	padding-left: 30px;
	height: 20px;
	background: url("/ssemi/img/nonCheck.png") 4px no-repeat;
	background-size: 18px;
	text-align: left;
	color: #AAAAAA;
}

input[id="cb1"]+label :after,input[id="cb2"]+label :after {
	content: "";
	display: block;
}

input[id="cb1"]:checked+label,input[id="cb2"]:checked+label {
	background: url("/ssemi/img/checked.png") 4px no-repeat;
	background-size: 18px;
}
    </style>



</head>
<body>

<div class="list-wrap">

			<h2 id="Ltitle">회원 주문 목록</h2>
		
			<a href = "#"><input type="button" value="입금 확인"  class="functionbutton" style="background-color:#C80A1E"></a>
			<div class="list-table-wrap">
				<table class="Ltable">
					<tr>
						<th><input type="checkbox" class="select-all" id="cb1" onchange="changeCheckbox();"><label for="cb1"></label></th>
						<th>주문번호</th>
						<th>상품번호</th>
						<th >상품명</th>
						<th> 수량 </th>
						<th>결제 예정 금액</th>
						<th>결제 수단</th>
						<th>비고</th>
					</tr>

					<tr class="Ldata">
						<td><input type="checkbox" class="select-item" id="cb2"><label for="cb2"></label></td>
						<td class="Ldata"><a href = "#">123456</a></td>
						<td class="Ldata"><a href = "#">T12345</a></td>
						<td class="Ldata" ><a href = "#">예쁜 서랍</a> <br> <a href = "#"><span id="totalcolor">화이트</span></a></td>
						<td class="Ldata">3</td>
						<td class="Ldata">562,150원</td>
						<td class="Ldata">무통장 입금</td>
						<td class="Ldata"><a href = "#"><input type="button" value="취소"  class="beforetable" style="background-color:#C80A1E"></a></td>
				
						
							
					</tr>
				
				</table>
				
			</div>
		

		</div>


</body>
</html>

<jsp:include page="/template/footer.jsp"></jsp:include>