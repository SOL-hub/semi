
<%@page import="home.beans.dao.MemberDao"%>
<%@page import="home.beans.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<% MemberDto user = (MemberDto) session.getAttribute("userinfo");
	int member_no = user.getMember_no();
%>


<!-- 선착순 게시글 작성 -->
    <jsp:include page="/template/header.jsp"></jsp:include>
    
<!DOCTYPE html>
    <link
	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
  
  text-align:center;
}

* {
   box-sizing: border-box;
   margin: 0px;
   padding: 0px;
   font-family: 'Noto Sans KR', sans-serif;
   letter-spacing: -1.5px;
}


.container {
 width:70%;
  padding: 16px;
  background-color: white;
}

textarea{
  width: 70%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

input[type=text], input[type=password] {
  width: 70%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
  width:70%:
}

.registerbtn {
  background-color: #BA3028;
  color: white;
  padding: 16px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 70%;
  opacity: 0.9;
}

.registerbtn:hover {
  opacity: 1;
}

.roww{
height:40px;
}

.rowww{
height:150px;
}



.signin {
  background-color: #f1f1f1;
  text-align: center;
}
</style>
</head>
<body>
<div align="center">
  <div class="rowww"></div>
    <form action = "event1_writer.do" method="get">
  <div class="container">
    <h1>EVENT</h1>

    <hr>

    <label for="event_head"><b>말머리</b></label><br> <br> 
    <div>
    <select name= "event_head">
    <option value="">선택</option>
    <option value="주방">주방</option>
    <option value="마루"> 마루</option>
    <option value="욕실">욕실</option>
    </select>
    </div>
    
  <div class="roww"></div>
   


    <label for="event_title"><b>제목</b></label> <br>
    <br>
    <input type="text" placeholder="Enter" name="event_title" required> <br>
  <div class="roww"></div>

    <label for="event_content"><b>내용</b></label> <br><br>
    <textarea name="event_content"placeholder="Enter"  required rows="15" cols="70"></textarea>
      <div class="roww"></div>
    <hr>

    <button type="submit" class="registerbtn">등록</button>
  </div>

</form>
</div>

</body>
</html>

    
    <jsp:include page="/template/footer.jsp"></jsp:include>