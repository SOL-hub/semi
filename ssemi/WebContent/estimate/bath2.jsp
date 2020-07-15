<%@page import="home.beans.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
    <title>견적서처리</title>
    <style>
        #wrap{
            margin-left:auto; 
            margin-right:auto;
            text-align:center;
        }
        
        table{
            
            margin-left:auto; 
            margin-right:auto;
          
        }
        
        td{
            
        
        #title{
        background-color:red;
 
   
        }
    </style>
</head>
<body>

<% 
    request.setCharacterEncoding("UTF-8");
    
    String bath_gong = request.getParameter("bath_gong");
    String bath_sohyung = request.getParameter("bath_sohyung");
    String tools = request.getParameter("tools");
    String bigtools = request.getParameter("bigtools");
   String[] chutools = request.getParameterValues("chutools");
   
   int pricee =Integer.parseInt(request.getParameter("pricee"));
  
	MemberDto mdto = (MemberDto) session.getAttribute("userinfo");
	boolean isLogin = mdto != null;

   
  
    %>
    
    
    <div id="wrap">
        <br><br>
        <b><font size="5" color="gray">견적서테스트</font></b>
        <br><br>
            	<%
				if (isLogin) {
			%>
        <font color="blue">묭묭</font>님의 견적서 입니다. <%} else{ %>
        <font color="blue"> 견적서 입니다.  </font> <%} %>
        <br>
        <form action="saveesti.do" method="post" >
        
		
        <h2> 
        가격: 
        <input type="text" name="bath_price" value="<%=pricee%>" readonly></h2>
                
        <table>
           <tr>
                <td id="title">공용(거실) : </td>
           <td>
           <%=bath_gong %>
           <input type ="hidden" name="bath_cnt" value="<%=bath_gong %>"></td>
            </tr>
                        
                        
            <tr>
                <td id="title">소형(안방) : </td>
                <td><%=bath_sohyung%>
                <input type ="hidden" name="bath_cntt" value="<%=bath_sohyung%>"readonly></td>
            </tr>
                        
            <tr>
                <td id="title">욕실유형 : </td>
                <td><input type="text" name="bath_tub" value="<%=tools %>" readonly></td>
            </tr>
            
             <tr>
                <td id="title">타일시공 : </td>
                <td><input type="text" name="bath_tile" value="<%=bigtools %>" readonly></td>
            </tr>
                    
            <tr>
                <td id="title">추가옵션 : </td>
                <td>
                <input type ="text" name="bath_option" value="<%for(int i=0; i<chutools.length; i++){out.println(" " + chutools[i]);}%>" readonly></td>
             
             
            </tr>
                    
    
        </table>
        
        <br>
      	<%
				if (isLogin) {
			%>
        	<input type="submit" value="작성">
        <input type="button" value="재견적">
        <% } else{%>
          <input type="button" value="재견적">
          <%} %>
    </div>
    </form>
                       
</body>
</html>