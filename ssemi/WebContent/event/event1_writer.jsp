<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 선착순 게시글 작성 -->
    <jsp:include page="/template/header.jsp"></jsp:include>
    
    <div style= padding-top:200px; align="center">
    <h2>선착순 게시글 작성</h2>
    
    <form action = "event1_writer.do" method=post>
    <table border="1">
    <tbody>
    
   
    <tr>
    <th>말머리</th>
    <td><select name= "event_head">
    <option value="">선택</option>
    <option value="주방">주방</option>
    <option value="마루"> 마루</option>
    <option value="욕실">욕실</option>
    </select></td>
    </tr>
    
    <tr>
    <th>제목</th>
    <td>
    <input type ="text" name = "event_title" size="68" required>
    </td>
    
    </tr>
    
    <tr>
    <th>내용</th>
    <td><textarea name="event_content" required rows="15" cols="70"></textarea></td>
    </tr>
    

   
    
    <tr><td colspan="2" align ="center">
    <input type ="submit" value = "등록하기">
    </td>
    </tr>
  </tbody>
    </table>
    
    </form>
    </div>
    
    <jsp:include page="/template/footer.jsp"></jsp:include>