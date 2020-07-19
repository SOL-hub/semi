<%@page import="java.util.List"%>
<%@page import="home.beans.dao.MemberDao"%>
<%@page import="home.beans.dto.ItemDto"%>
<%@page import="home.beans.dao.ItemDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
 
    <%
    MemberDao mdao = new MemberDao();
    String type = request.getParameter("type");
    String keyword = request.getParameter("keyword");
    
   
   boolean isSearch = type != null && keyword != null;
   
   ////////////////////////////////////////////////////////////
   // 페이지 계산 코드
   ////////////////////////////////////////////////////////////
   int pageSize = 10;//한 페이지에 표시할 데이터 개수
   
   //page 번호를 계산하기 위한 코드
   // - 이상한 값은 전부다 1로 변경
   // - 멀쩡한 값은 그대로 숫자로 변환
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
   
   //시작 글 순서와 종료 글 순서를 계산
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
   
   
//    List<BoardDto> list = 목록 or 검색;
   List<ItemDto> list;
   if(isSearch){
      list = idao.search(type, keyword, start, finish); 
   }
   else{
      list = idao.getList(start, finish);  
   }
%> 
 
    
    
     <jsp:include page="/template/header.jsp"></jsp:include>
     
       
    <link rel=stylesheet type="text/css" href="<%=request.getContextPath() %>/css/bed_list.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
     
   
       
</head>

<body>
<div align center>
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
                
                   

   <!-- 네비게이터 -->
   <h6>[이전]
   <!-- 이동 숫자에 반복문 적용 -->
   <%for(int i = 1; i <=10; i++){ %>
   <a href="allist2.jsp?page=<%=i%>"><%=i%></a>
   }else{
   <a href="allist2.jsp?page=<%=i%>"><%=i%></a>
   <%} %>
   
   [다음]
   </h6>
   
   <h4>
   
   <!-- 
      이전 버튼을 누르면 startBlock - 1 에 해당하는 페이지로 이동해야 한다
      (주의) startBlock이 1인 경우에는 출력하지 않는다
    -->
   <%if(startBlock > 1){ %>
   
      <%if(!isSearch){ %> 
         <a href="list.jsp?page=<%=startBlock-1%>">[이전]</a>
      <%}else{ %>
         <a href="list.jsp?page=<%=startBlock-1%>&type=<%=type%>&keyword=<%=keyword%>">[이전]</a>
      <%} %>
      
   <%} %>
   
   <!-- 
      이동 숫자에 반복문을 적용 
      범위는 startBlock부터 finishBlock까지로 설정(상단에서 계산을 미리 해두었음)
   -->
   
   <%for(int i=startBlock; i <= finishBlock; i++){ %>
      <%if(!isSearch){ %>
      <!-- 목록일 경우 페이지 번호만 전달 -->
      <a href="list.jsp?page=<%=i%>"><%=i%></a>
      <%}else{ %>
      <!-- 검색일 경우 페이지 번호와 검색 분류(type), 검색어(keyword)를 전달 -->
      <a href="list.jsp?page=<%=i%>&type=<%=type%>&keyword=<%=keyword%>"><%=i%></a>
      <%} %>
   <%} %>
   
   <!-- 
      다음 버튼을 누르면 finishBlock + 1 에 해당하는 페이지로 이동해야 한다
      (주의!) 다음이 없는 경우에는 출력하지 않는다(pageCount <= finishBlock)
    -->
   <%if(pageCount > finishBlock){ %>
      <%if(!isSearch){ %> 
         <a href="list.jsp?page=<%=finishBlock + 1%>">[다음]</a>
      <%}else{ %>
         <a href="list.jsp?page=<%=finishBlock + 1%>&type=<%=type%>&keyword=<%=keyword%>">[다음]</a>
      <%} %>
   <%} %>
   </h4>
   
   <!-- 검색창 -->
   <form action="test.jsp" method="get">
      <!-- 검색분류 -->
      <select name="type">
         <option value="item_kingtype">제목만</option>
      </select>
      
      <!-- 검색어 -->
      <input type="text" name="keyword" required>
       
      <!-- 전송버튼 -->
      <input type="submit" value="검색">
   </form>
</div></div>

<jsp:include page="/template/footer.jsp"></jsp:include>
</div>
