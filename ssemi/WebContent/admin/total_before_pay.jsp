<%@page import="home.beans.dao.ItemDao"%>
<%@page import="home.beans.dto.ItemDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="home.beans.dto.MemberDto"%>
<%@page import="home.beans.dao.MemberDao"%>
<%@page import="home.beans.dto.shoppingDto"%>
<%@page import="java.util.List"%>
<%@page import="home.beans.dao.ShoppingDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <jsp:include page="/template/header.jsp"></jsp:include>
    

    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 주문 관리</title>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/admin.css?ver=1">
	
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

	    #totalcolor{
    	
    	color:#AAAAAA;
    }
    

    </style>
</head>
<body>

    <% 
    request.setCharacterEncoding("UTF-8");
    
    	String type = request.getParameter("type");
		String keyword = request.getParameter("keyword");
		String start = request.getParameter("start");
		String finish = request.getParameter("finish");
		
		
    	ShoppingDao sdao = new ShoppingDao();

    	List<shoppingDto> list ;
    	
    	if (keyword != null && !keyword.equals("") && start != null && !start.equals("") && finish != null && !finish.equals("")) {// 둘 다 있을 때 
    		
//     		list = mdao.search(type, keyword);	
    		list = sdao.search_join(type, keyword,start, finish);

    	}
    	if(keyword != null && !keyword.equals("")){
    		list = sdao.search(type, keyword);
    	}
    	else if(start !=null && !start.equals("") &&finish != null && !finish.equals("")){
    		list = sdao.search_join_k(start, finish);
    	}
    	else{
    		
    		list = new ArrayList<>();
    	}
    	
    	
    	
    %>
    
<div class="category-main fixed">
        <h3>Today</h3>

        <div class="today-cart-wrap">
            <a href="total_before_pay.jsp">
                <img class="todayimg" src="/ssemi/img/supermarket.png">
            </a>
        </div>

 <%
		
		
		
		List<shoppingDto> slist = sdao.getList();  %>
        <div class="label-wrap">
        <a href="total_before_pay.jsp" class="today-label">
                주문 (<%=slist.size() %>건)
        </a>
        </div>

        <div class="today-cart-wrap">
            <a href="total_after_pay.jsp">
                <img class="todayimg" src="/ssemi/img/money.png">
            </a>
        </div>


        <div class="label-wrap">
            <a href="total_after_pay.jsp" class="today-label">
                결제 (9건)
            </a>
        </div>


        <div class="today-cart-wrap">
            <a href="#">
                <img class="todayimg" src="/ssemi/img/customer.png">
            </a>
        </div>

	<%
	
	MemberDao mdao = new MemberDao();

	List<MemberDto> mlist;
	int count = mdao.memberCount(); %>
        <div class="label-wrap ">
            <a href="#" class="today-label">
                회원 가입(<%= count %>건)
            </a>
        </div>

    </div>



 <div class ="totaldiv">
        <h2>전체 주문 목록</h2>
       
<form action="total_before_pay.jsp" method="post">
        <table>
            <tr>
                <th class="totalth">검색어</th>
                <td class="totaltd">
            		<select name ="type">
            			<option value="shopping_member">주문자명</option>
            			<option value ="shopping_item_name">상품명</option>
            		</select>
            		<input type="text" name="keyword" >
    
               </td>
            </tr>
           
            <tr>
                <th class="totalth">주문 기간</th>
                <td class="totaltd"><input type="text" name="start">~<input type="text" name="finish"></td>
            </tr>

        </table>
        
        <input type="submit" value="검색" class="admin-submit">
    </form>
    </div>
    
   
    <!--  검색 결과 -->
    <div class="list-wrap">

			<h2 id="Ltitle">회원 주문 목록</h2>
				<p id="listcount">검색결과 <%=list.size() %>건
			</p>
			<div class="list-table-wrap">
				<table class="Ltable">
					<tr>
						
						<th>주문번호</th>
						<th>상품번호</th>
						<th >상품명</th>
						<th> 수량 </th>
						<th>결제 예정 금액</th>
						<th>결제 수단</th>
						<th>비고</th>
						
					</tr>
 					


					<% for(shoppingDto sdto : list){ %>
					<tr class="Ldata">
					
					<% 
					ItemDao idao = new ItemDao();
					ItemDto idto = idao.item_get(sdto.getShopping_item_name());%>
						<td class="Ldata"><a href = "#"><%=sdto.getShopping_no() %></a></td>
						<td class="Ldata"><a href = "#"><%=sdto.getShopping_item_name() %></a></td>
						<td class="Ldata" ><a href = "#"><%=idto.getItem_name()%> <br> <span id="totalcolor">화이트</span></a></td>
						<td class="Ldata"><%=sdto.getShopping_item_cnt() %></td>
						<td class="Ldata"><%=sdto.getShopping_total() %></td>
						<td class="Ldata"><%=sdto.getShopping_payment()%></td>
						<td class="Ldata"><a href = "#"><input type="button" value="취소"  class="beforetable" style="background-color:#C80A1E"></a></td>
				
				<%} %>
						
							
					</tr>
				</table>
				
			</div>


		</div>

	

</body>
</html>

<jsp:include page="/template/footer.jsp"></jsp:include>