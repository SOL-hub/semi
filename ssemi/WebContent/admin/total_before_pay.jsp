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
	href="<%=request.getContextPath()%>/css/admin.css">
	
 <style>
 
 		.totaldiv{
 			margin-top:150px;
 			margin-left: 650px;
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
    </style>
</head>
<body>
<div class="category-main fixed">
        <h3>Today</h3>

        <div class="today-cart-wrap">
            <a href="total_before_pay.jsp">
                <img class="todayimg" src="/ssemi/img/supermarket.png">
            </a>
        </div>

 
        <div class="label-wrap">
        <a href="total_before_pay.jsp" class="today-label">
                주문 (15건)
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


        <div class="label-wrap ">
            <a href="#" class="today-label">
                회원 가입(30건)
            </a>
        </div>

    </div>



<form action="total_before_pay.jsp" method="get">
 <div class ="totaldiv">
        <h2>전체 주문 목록</h2>
        <table>
            <tr>
                <th class="totalth">검색어</th>
                <td class="totaltd"><select>
                        <option>주문번호</option>
                        <option>주문자명</option>
                    </select><input type="text"></td>
            </tr>
            <tr>
                <th class="totalth">상품</th>

                <td class="totaltd"><select>
                        <option>상품명</option>
                        <option>상품번호</option>
                    </select><input type="text"></td>
            </tr>

            <tr>
                <th class="totalth">주문 기간</th>
                <td class="totaltd"><input type="text">~<input type="text"></td>
            </tr>

        </table>
        
        <input type="button" value="검색" class="admin-submit">
    </div>
    </form>
    
    
    
</body>
</html>

<jsp:include page="/template/footer.jsp"></jsp:include>