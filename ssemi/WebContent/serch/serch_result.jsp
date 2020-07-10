<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상품결과_페이지</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/bed_list.css">
</head>
<body>
    <main>
    <div>
    <div>
            <p class="subject middle-font">keyword&nbsp검색결과</p>
            </div>
            <p>??개의 상품이 검색되었습니다.</p>
             <div class="ssmall-font xyz
       main_menu frt selected sort">
                    <span><a href=#>조회순</a></span>
                    <span><a href=#>높은가격순</a></span>
                    <span><a href=#>낮은가격순</a></span>
                </div>
                <div class="ln4">
                    <ul>

                        <li>
                            <p><img src="https://placeimg.com/274/274" width="100%"></p>
                            <p><span>이름</span><br><span>설명</span><br><span class="price">0&nbsp;원</span></p>
                            <p class="icon"><a onclick="changeimg()">
                                    <img src="../img/heart_none.png" id="img1" width="17" height="16">
                                </a></p>
                        </li>
                        <li>
                            <p><img src="https://placeimg.com/274/274" width="100%"></p>
                            <p><span>이름</span><br><span>설명</span><br><span class="price">0&nbsp;원</span></p>
                            <p class="icon"><a onclick="changeimg()">
                                    <img src="../img/heart_none.png" id="img1" width="17" height="16">
                                </a></p>
                        </li>

                        <li>
                            <p><img src="https://placeimg.com/274/274" width="100%"></p>
                            <p><span>이름</span><br><span>설명</span><br><span class="price">0&nbsp;원</span></p>
                            <p class="icon"><a onclick="changeimg()">
                                    <img src="../img/heart_none.png" id="img1" width="17" height="16">
                                </a></p>
                        </li>
            </ul>
            </div>
    </main>
</body>
</html>
<jsp:include page="/template/footer.jsp"></jsp:include>