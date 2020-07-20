<%@page import="java.text.DecimalFormat"%>
<%@page import="home.beans.dto.ItemFileDto"%>
<%@page import="java.util.List"%>
<%@page import="home.beans.dao.ItemFileDao"%>
<%@page import="home.beans.dto.ItemDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

	ItemDto idto = (ItemDto)request.getSession().getAttribute("iteminfo");//idto애들 불러오기위해 필요
	ItemFileDao ifdao = new ItemFileDao();
	List<ItemFileDto> file_list = ifdao.getList(idto.getItem_no());
	
	DecimalFormat formatter = new DecimalFormat("###,###");
%>
 <jsp:include page="/template/header.jsp"></jsp:include>   
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link
	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
    <style>
        * {
	box-sizing: border-box;
	font-family: 'Noto Sans KR', sans-serif;
}
        main{
            width: 1250px;
            height: 1000px;
            margin: auto;
            
        }
        .center{
            text-align: center;
        }
        .left{
            text-align: left;
        }
        .right{
            text-align: right;
        }
        .img-size{
            width: 600px;
            height: 700px;
            float: left;
            padding-right: 700px;
        }
        .row-empty{
            height: 20px;
        }
        .item-name{
            font-size: 20px;
        }
        .item-info{
            font-size: 25px;
            color: darkblue;
        }
        .item-price{
            font-size: 20px;
            color: firebrick;
        }
        
         /*가격_버튼*/
        .pay-btn{
            width: 205px;
            height: 50px;
            margin: 0 5px 0px 0px;
            background-color: #c80a1e;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 20px;
        }
        /*장바구니_버튼*/
        .bag-btn{
            width: 205px;
            height: 50px;
            margin-top: -50px;
            background-color: gray;
            border: none;
            color: white;
            cursor: pointer;
            font-size: 20px;
        }
        .ggim-btn{
             width: 50px;
            height: 50px;
            margin-top: -50px;
            background-color: chocolate;
            border: none;
            color: white;
            cursor: pointer;
            font-size: 20px;
        }
        
        .bottom-outline{
            border-bottom: 1px solid #aaa;
        }
        .top-outline{
            border-bottom: 1px solid #aaa;
        }
        
        .item-haha>li{
            display: inline-block;
            padding-left: 100px;
            
        }
        
        .selectbox { 
        width: 200px; /* 원하는 너비설정 */ 
        padding: .8em .5em; /* 여백으로 높이 설정 */ 
        font-family: inherit; /* 폰트 상속 */ 
        background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%; /* 네이티브 화살표 대체 */ 
        border: 1px solid #999; 
        border-radius: 0px; /* iOS 둥근모서리 제거 */ 
        -webkit-appearance: none; /* 네이티브 외형 감추기 */ 
        -moz-appearance: none; 
        appearance: none;
        font-size: 15px;
         }
        
        .selectbox:focus { 
        width: 200px; /* 원하는 너비설정 */ 
        padding: .8em .5em; /* 여백으로 높이 설정 */ 
        font-family: inherit; /* 폰트 상속 */ 
        background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%; /* 네이티브 화살표 대체 */ 
        border: 1px solid #999; 
        border-radius: 0px; /* iOS 둥근모서리 제거 */ 
        -webkit-appearance: none; /* 네이티브 외형 감추기 */ 
        -moz-appearance: none; 
        appearance: none;
        outline: none;
        font-size: 15px;
         }
    </style>
    <script>
		function checkAdd() {
			var result = confirm("정말 추가하시겠습니까??");
	        if (!result){ 
//	             document.form.submit();
	        	return false;

	        }
	        else{  

//	             return;
	            document.form.submit();

	        	}

		}
		function button_event(){
			var result = confirm("정말 결제하시겠습니까??");
	        if (!result){ 
//	             document.form.submit();
	        	return false;

	        }
	        else{  

//	             return;
	            document.form.submit();

	        	}

	        }

	</script>
</head>
<body>
    <main>
        <section>
            <article style="padding-top: 200px">
                <%
				for (ItemFileDto ifdto : file_list) {
				%>
				<div class="img-size">
					<img src="<%=request.getContextPath()%>/member/download2.do?item_file_no=<%=ifdto.getItem_file_no()%>"	width="600px" height="700px">
				</div>
				<%
					}
				%>
                <div class="row-empty"></div>
                <div class="row-empty"></div>
                <div class="row-empty"></div>
                <div class="row-empty"></div>
               <form method="post">
                <div>
                    <div class="item-name">
                       [<%=idto.getItem_kingtype()%>] <%=idto.getItem_name()%>
                    </div>
                    <div class="row-empty"></div>
                    <div class="item-info">
                        [상품 정보] <%=idto.getItem_info()%>
                    </div>
                    <div class="row-empty"></div>
                    <div class="item-price">
                        [상품 가격] <%=formatter.format(idto.getItem_price())%>원
                    </div>
                    
                    <div class="row-empty"></div>
                    <div class="row-empty"></div>
                    <div class="row-empty">
                    	배송방법 : 택배<br><br> 
                    	배송비 : 2,500원<br><br>
                    	배송비 결제 : 주문시 결제 
                    </div>                    
                    <div class="row-empty"></div>
                    <div class="row-empty"></div>
                    <div class="row-empty"></div>
                    <div class="row-empty"></div>
                    <div class="row-empty"></div>
                    
                    <div style="padding-left: 920px;">
                        	수량 : <select class="selectbox" name="cart_cnt">                  
                        <%
                        for(int i=1; i<100; i++){
                        %>
                            <option><%=i %></option>
                         <% }%>
                        </select>
                    </div>
                      <div class="row-empty"></div>
                        <div class="row-empty"></div>
                    
                    <div class="row-empty"></div>
                    <div class="row-empty"></div>
                    <div class="row-empty"></div>
                    <div>
                        <input class="pay-btn" type="submit" formaction="<%=request.getContextPath()%>/buypage/buy_page_detail.jsp" value="결제하기" onclick="return button_event();">
                        <input class="bag-btn" type="submit" formaction="cart_add.do" value="장바구니에 넣기" onclick="return checkAdd();">
                        <input class="ggim-btn" type="submit" formaction="wish_add.do" value="찜" onclick="return checkAdd();">
                    </div>
                </div>
                </form>
            </article>
            <article>
                <div>
                    <div class="row-empty"></div>
                    <div class="row-empty"></div>
                    <div class="row-empty"></div>
                    <div class="row-empty"></div>
                    <div class="row-empty"></div>
                    <div class="row-empty"></div>
                    <div class="row-empty"></div>
                    <div class="row-empty"></div>
                    <div class="row-empty"></div>
                    <div class="bottom-outline"></div>
                    <div class="row-empty"></div>
                    <div class="row-empty">
                        
                        
                    </div>
                   
                   
                </div>
            </article>
        </section>
    </main>
</body>
</html>

<jsp:include page="/template/footer.jsp"></jsp:include> 