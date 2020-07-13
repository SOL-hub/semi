<%@page import="home.beans.dto.ItemDto"%>
<%@page import="java.util.List"%>
<%@page import="home.beans.dao.ItemDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//이 페이지를 출력하기 위한 프로그래밍 처리
	//1. 준비물(입력) : 검색창의 입력값 - type, keyword (둘다 있으면 검색)
	//2. 처리
	//		- isSearch라는 변수에 검색인지 아닌지 판정하여 저장
	//		- isSearch의 값에 따라 "목록" 또는 "검색" 결과를 저장
	//3. 결과물(출력) : 게시글 리스트 - List<BoardDto>
	
	String keyword = request.getParameter("keyword");
	
	boolean isSearch = keyword != null;
	
	ItemDao idao = new ItemDao();
// 	List<BoardDto> list = 목록 or 검색;
	List<ItemDto> list;
	if(isSearch){
		list = idao.search(keyword);
	}
	else{
		list = idao.getList();
	}
%> 
    <jsp:include page="/template/header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>일룸</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/bed_list.css">
    <style>

    </style>
</head>

<body>
    <script>
        /*내가해보는거*/
        var cnt = 1;

        function changeimg() {
            var img1 = document.getElementById("img1");

            if (cnt % 2 == 1) {
                img1.src = "../img/heart_none.png";

            } else {
                img1.src = "../img/heart.png";

            }
            cnt++;
        }
    </script>
    <main>
        <div>
            <p class="subject middle-font">침대</p>
            <div class="selected subject">
                <ul class="main_menu">
                    <li>
                        <a href=#>전체</a>
                    </li>
                    <li>
                        <a href=#>일반침대</a>
                        <ul>
                            <li><a href="#">싱글</a></li>
                            <li><a href="#">듀얼</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href=#>매트리스</a>
                        <ul class="sub_menu">
                            <li><a href="#">싱글</a></li>
                            <li><a href="#">듀얼</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="border">
                <div class="ssmall-font xyz
       main_menu frt selected sort">
                    <span><a href=#>조회순</a></span>
                    <span><a href=#>높은가격순</a></span>
                    <span><a href=#>낮은가격순</a></span>
                </div>
            </div>
            <article>
            <%for(ItemDto idto : list){ %>
                <div class="ln4">
                    <ul>

                        <li>
                            <p><img src="<%=idto.getItem_image()%>" width="100%"></p>
                            <p><span><%=idto.getItem_name()%></span><br><span><%=idto.getItem_info() %></span><br><span class="price"><%=idto.getItem_price()%>&nbsp;원</span></p>
                            <p class="icon"><a onclick="changeimg()">
                                    <img src="../img/heart_none.png" id="img1" width="17" height="16">
                                </a></p>
                        </li>
                        <li>
                            <p><img src="<%=idto.getItem_image()%>" width="100%"></p>
                            <p><span><%=idto.getItem_name()%></span><br><span><%=idto.getItem_info() %></span><br><span class="price"><%=idto.getItem_price()%>&nbsp;원</span></p>
                            <p class="icon"><a onclick="changeimg()">
                                    <img src="../img/heart_none.png" id="img1" width="17" height="16">
                                </a></p>
                        </li>
                        <li>
                            <p><img src="<%=idto.getItem_image()%>" width="100%"></p>
                            <p><span><%=idto.getItem_name()%></span><br><span><%=idto.getItem_info() %></span><br><span class="price"><%=idto.getItem_price()%>&nbsp;원</span></p>
                            <p class="icon"><a onclick="changeimg()">
                                    <img src="../img/heart_none.png" id="img1" width="17" height="16">
                                </a></p>
                        </li>
                        <li>
                            <p><img src="<%=idto.getItem_image()%>" width="100%"></p>
                            <p><span><%=idto.getItem_name()%></span><br><span><%=idto.getItem_info() %></span><br><span class="price"><%=idto.getItem_price()%>&nbsp;원</span></p>
                            <p class="icon"><a onclick="changeimg()">
                                    <img src="../img/heart_none.png" id="img1" width="17" height="16">
                                </a></p>
                        </li>

                    </ul>
                    <ul>

                        <li>
                            <p><img src="<%=idto.getItem_image()%>" width="100%"></p>
                            <p><span><%=idto.getItem_name()%></span><br><span><%=idto.getItem_info() %></span><br><span class="price"><%=idto.getItem_price()%>&nbsp;원</span></p>
                            <p class="icon"><a onclick="changeimg()">
                                    <img src="../img/heart_none.png" id="img1" width="17" height="16">
                                </a></p>
                        </li>
                        <li>
                            <p><img src="<%=idto.getItem_image()%>" width="100%"></p>
                            <p><span><%=idto.getItem_name()%></span><br><span><%=idto.getItem_info() %></span><br><span class="price"><%=idto.getItem_price()%>&nbsp;원</span></p>
                            <p class="icon"><a onclick="changeimg()">
                                    <img src="../img/heart_none.png" id="img1" width="17" height="16">
                                </a></p>
                        </li>
                        <li>
                            <p><img src="<%=idto.getItem_image()%>" width="100%"></p>
                            <p><span><%=idto.getItem_name()%></span><br><span><%=idto.getItem_info() %></span><br><span class="price"><%=idto.getItem_price()%>&nbsp;원</span></p>
                            <p class="icon"><a onclick="changeimg()">
                                    <img src="../img/heart_none.png" id="img1" width="17" height="16">
                                </a></p>
                        </li>
                        <li>
                            <p><img src="<%=idto.getItem_image()%>" width="100%"></p>
                            <p><span><%=idto.getItem_name()%></span><br><span><%=idto.getItem_info() %></span><br><span class="price"><%=idto.getItem_price()%>&nbsp;원</span></p>
                            <p class="icon"><a onclick="changeimg()">
                                    <img src="../img/heart_none.png" id="img1" width="17" height="16">
                                </a></p>
                        </li>

                    </ul>
                    <ul>

                        <li>
                            <p><img src="<%=idto.getItem_image()%>" width="100%"></p>
                            <p><span><%=idto.getItem_name()%></span><br><span><%=idto.getItem_info() %></span><br><span class="price"><%=idto.getItem_price()%>&nbsp;원</span></p>
                            <p class="icon"><a onclick="changeimg()">
                                    <img src="../img/heart_none.png" id="img1" width="17" height="16">
                                </a></p>
                        </li>
                        <li>
                            <p><img src="<%=idto.getItem_image()%>" width="100%"></p>
                            <p><span><%=idto.getItem_name()%></span><br><span><%=idto.getItem_info() %></span><br><span class="price"><%=idto.getItem_price()%>&nbsp;원</span></p>
                            <p class="icon"><a onclick="changeimg()">
                                    <img src="../img/heart_none.png" id="img1" width="17" height="16">
                                </a></p>
                        </li>
                        <li>
                            <p><img src="<%=idto.getItem_image()%>" width="100%"></p>
                            <p><span><%=idto.getItem_name()%></span><br><span><%=idto.getItem_info() %></span><br><span class="price"><%=idto.getItem_price()%>&nbsp;원</span></p>
                            <p class="icon"><a onclick="changeimg()">
                                    <img src="../img/heart_none.png" id="img1" width="17" height="16">
                                </a></p>
                        </li>
                        <li>
                            <p><img src="<%=idto.getItem_image()%>" width="100%"></p>
                            <p><span><%=idto.getItem_name()%></span><br><span><%=idto.getItem_info() %></span><br><span class="price"><%=idto.getItem_price()%>&nbsp;원</span></p>
                            <p class="icon"><a onclick="changeimg()">
                                    <img src="../img/heart_none.png" id="img1" width="17" height="16">
                                </a></p>
                        </li>

                    </ul>
                    <ul>

                        <li>
                            <p><img src="<%=idto.getItem_image()%>" width="100%"></p>
                            <p><span><%=idto.getItem_name()%></span><br><span><%=idto.getItem_info() %></span><br><span class="price"><%=idto.getItem_price()%>&nbsp;원</span></p>
                            <p class="icon"><a onclick="changeimg()">
                                    <img src="../img/heart_none.png" id="img1" width="17" height="16">
                                </a></p>
                        </li>
                        <li>
                            <p><img src="<%=idto.getItem_image()%>" width="100%"></p>
                            <p><span><%=idto.getItem_name()%></span><br><span><%=idto.getItem_info() %></span><br><span class="price"><%=idto.getItem_price()%>&nbsp;원</span></p>
                            <p class="icon"><a onclick="changeimg()">
                                    <img src="../img/heart_none.png" id="img1" width="17" height="16">
                                </a></p>
                        </li>
                        <li>
                            <p><img src="<%=idto.getItem_image()%>" width="100%"></p>
                            <p><span><%=idto.getItem_name()%></span><br><span><%=idto.getItem_info() %></span><br><span class="price"><%=idto.getItem_price()%>&nbsp;원</span></p>
                            <p class="icon"><a onclick="changeimg()">
                                    <img src="../img/heart_none.png" id="img1" width="17" height="16">
                                </a></p>
                        </li>
                        <li>
                            <p><img src="<%=idto.getItem_image()%>" width="100%"></p>
                            <p><span><%=idto.getItem_name()%></span><br><span><%=idto.getItem_info() %></span><br><span class="price"><%=idto.getItem_price()%>&nbsp;원</span></p>
                            <p class="icon"><a onclick="changeimg()">
                                    <img src="../img/heart_none.png" id="img1" width="17" height="16">
                                </a></p>
                        </li>

                    </ul>
                </div>
                <%} %>
                <!-- 네비게이터 -->
                <div class="page center_wlwjd">
                    <ul>
                        <li class="on"><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li><a href="#">></a></li>
                    </ul>
                </div>
            </article>
        </div>
    </main>
</body></html> 
<jsp:include page="/template/footer.jsp"></jsp:include>  
