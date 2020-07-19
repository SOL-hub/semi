<%@page import="home.beans.dto.ItemDto"%>
<%@page import="java.util.List"%>
<%@page import="home.beans.dao.ItemDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String type = request.getParameter("type");
String keyword = request.getParameter("keyword");

boolean isSearch = type != null && keyword != null;

 	//////////////////////////////////////////////////////////// 
 	// 페이지 계산 코드 
	//////////////////////////////////////////////////////////// 
	int pageSize = 10;//한 페이지에 표시할 데이터 개수 


	String pageStr = request.getParameter("page");
int pageNo;


try{ 
 		pageNo = Integer.parseInt(pageStr); 
		if(pageNo <= 0){ 
			throw new Exception(); 
		} 
		} 

	catch(Exception e){  
		pageNo = 1; 
 	} 

int finish = pageNo * pageSize;
int start = finish - (pageSize - 1); 

//////////////////////////////////////////////////////////////////
// 페이지 네비게이터 계산 코드 
////////////////////////////////////////////////////////////////// 

int blockSize = 10;//이 페이지에는 네비게이터 블록을 10개씩 배치하겠다! 
int startBlock = (pageNo - 1) / blockSize * blockSize + 1; 
int finishBlock = startBlock + blockSize - 1; 
  
 	ItemDao idao = new ItemDao(); 
 	 
 	//(주의!) 다음 버튼의 경우 계산을 통하여 페이지 개수를 구해야 출력 여부 판단이 가능 
 	//int count = 목록개수 or 검색개수; 
 	int count; 
 	if(isSearch){//검색 
 		count = idao.getCount(type, keyword);  
 	} 
 	else{//목록 
 		count = idao.getCount(); 
 	} 
 	int pageCount = (count + pageSize - 1) / pageSize; 
	//만약 finishBlock이 pageCount보다 크다면 수정해야 한다 
 	if(finishBlock > pageCount){ 
 		finishBlock = pageCount; 
 	} 
 	 
 
 // 	List<BoardDto> list = 목록 or 검색; 
 //	List<ItemDao> list; 
 //	if(isSearch){ 
// 		list = item.search(type, keyword, start, finish);  
 //	} 
// 	else{ 
//		list = item.getList(start, finish);  
 
 %>  

    <jsp:include page="/template/header.jsp"></jsp:include>
    
      <link rel=stylesheet type="text/css" href="<%=request.getContextPath() %>/css/bed_list.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상품리스트</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/bed_list.css">
    <style>

    </style>
</head>

<body>
   <div align center>
    <br>
    <br>
    <br>
    <br>
    <br>
    <main>
        <div>
        <!-- 여기로 오셔서 확인 -->
        <h5>keyword=<%=keyword%>
        isSerch=<%=isSearch %>
        </h5>
        <h5>pageStr=<%=pageStr%>,pageNo=<%=pageNo%>
        	start=<%=start %>finish=<%=finish %>
        </h5>
        <h5>startBlock=<%=startBlock%>
			finishBlock=<%=finishBlock%></h5>
			
			
            <p class="subject middle-font">전체</p>
            <div class="selected subject">
                <ul class="main_menu">
                    <li>
                        <a href=#>욕실</a>
                        <ul>
                            <li><a href="#">젠다이</a></li>            
                            <li><a href="#">선반</a></li>
                            <li><a href="#">비데</a></li>
                            <li><a href="#">환풍기</a></li>
                        </ul>
                    </li>
				<li>
                        <a href=#>마루</a>
                        <ul>
                            <li><a href="#">강마루</a></li>
                            <li><a href="#">강화마루</a></li>
                            <li><a href="#">합판마루</a></li>
                            <li><a href="#">원목마루</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href=#>주방</a>
                        <ul>
                            <li><a href="#">테이블</a></li>
                            <li><a href="#">냉장고</a></li>
                            <li><a href="#">선반</a></li>
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
                <div class="ln4">
                
                
                    <ul>
<%for(ItemDto idto : list) {%>
                        <li>
                            <p><img src="https://placeimg.com/274/274" width="100%"></p>
                            
                            <p><span><%=idto.getItem_name()%></span>
                            <br>
                            <span><%=idto.getItem_info()%></span>
                            <br>
                            <span class="price"><%=idto.getItem_price()%>&nbsp;원</span></p>
                            <p class="icon"><a onclick="changeimg()">
      
                                </a></p>
                        </li>
                       <%} %>
                      
                    </ul>
                   
                   
                </div>
                
                
                <!-- 페이지_네비게이터 -->
                <div class="page center_wlwjd">
                <%if(!isSearch){%>
                <a href="product_bed_list.jsp?page=<%=startBlock-1%>">[<]</a>                
                <%}else{%>
                <a href="product_bed_list.jsp?page=<%=startBlock-1%>&keyword=<%=keyword%>">[<]</a>
                <%} %>
                <%for(int i=startBlock; i<=finishBlock; i++){%>
                <%if(!isSearch){ %>
					<a href="product_bed_list.jsp?page=<%=i%>"><%=i%></a>             
                    <%}else{ %>
                    <a href="product_bed_list.jsp?page=<%=i%>&keyword=<%=keyword%>"><%=i%></a> 
                    <%} %>
                    <%} %>          
                	<%if(!isSearch){%>
                <a href="product_bed_list.jsp?page=<%=finishBlock+1%>">[>]</a>                
                <%}else{%>
                <a href="product_bed_list.jsp?page=<%=finishBlock+1%>&keyword=<%=keyword%>">[>]</a>
                <%} %>
      //          <%} %>
                </div>
                </div>
            </article>
        </div>
    </main>
</body></html> 
<jsp:include page="/template/footer.jsp"></jsp:include>  
