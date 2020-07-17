package home.beans.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import home.beans.dto.eventDto;

public class eventDao {

   private static DataSource src;

   // static 변수의 초기화가 복잡할 경우에 사용할 수 있는 static 전용 구문
   static {
//      src=context.xml에서 관리하는 자원의 정보;
      try {
         Context ctx = new InitialContext();
         Context env = (Context) ctx.lookup("java:/comp/env");// Context 설정 찾아라
         src = (DataSource) env.lookup("jdbc/oracle");
      } catch (NamingException e) {
         e.printStackTrace();
      }
   }

   
   //연결메소드
   public Connection getConnection() throws Exception {
//      Class.forName("oracle.jdbc.OracleDriver");
//      
//      Connection con = DriverManager.getConnection(
//            "jdbc:oracle:thin:@localhost:1521:xe" , "c##kh","c##kh");
//            
//      return con;
      
      return src.getConnection();
   }

   
   //목록메소드-솔
   public List<eventDto>getList()throws Exception{
      Connection con = getConnection();
      
      String sql = "SELECT * FROM event ORDER BY event_no ASC"; //반대로 1등부터 보이게 하기
      
      PreparedStatement ps = con.prepareStatement(sql);
      ResultSet rs = ps.executeQuery();
      
      List<eventDto> list= new ArrayList<>();
      while(rs.next()) {
         eventDto edto = new eventDto(rs);
         list.add(edto);
      }
      
      con.close();
      return list;
      
   }
   
   //검색메소드 
   public List<eventDto>search(String type, String keyword) throws Exception{
      Connection con = getConnection();
      
      String sql = "SELECT * FROM event"
            + " where instr(#1, ?)>0 "
            + "ORDER BY event_no DESC";
   
      sql= sql.replace("#1", type);
      
      PreparedStatement ps = con.prepareStatement(sql);
      ps.setString(1, keyword);
      ResultSet rs = ps.executeQuery();
      
      List<eventDto>list = new ArrayList<>();
      while(rs.next()) {
         eventDto edto = new eventDto(rs);
         list.add(edto);
      }
      
      con.close();
      return list;
   }
   
   
   
   //단일조회
   
   public eventDto get(int event_no)throws Exception{
      Connection con = getConnection();
      
      String sql="SELECT* FROM event where event_no=?";
      PreparedStatement ps = con.prepareStatement(sql);
      ps.setInt(1, event_no);
      
      ResultSet rs = ps.executeQuery();
      
      eventDto edto;
      if(rs.next()) {
         edto = new eventDto(rs);
      }
      
      else {
         edto = null;
         
      }
      
      
      con.close();
      
      return edto;
   }
   
  //시퀀스 생성
   public int getSequence()throws Exception{
	   Connection con = getConnection();
	   
	   String sql = "SELECT event_seq.nextval FROM dual";
	   
	   PreparedStatement ps = con.prepareStatement(sql);
	   ResultSet rs = ps.executeQuery();
	   rs.next();
	   int seq = rs.getInt(1);
	   
	   con.close();
	   
	   return seq; 
	   
   }
   //등록
   public void write(eventDto edto)throws Exception{
	   Connection con = getConnection();
	   
	   String sql="INSERT INTO event(event_no, event_head, event_title, event_writer, event_content) VALUES(?, ?, ?, ?, ?)";
	   PreparedStatement ps = con.prepareStatement(sql);
	   ps.setInt(1, edto.getEvent_no());
	   ps.setString(2, edto.getEvent_head());
	   ps.setString(3, edto.getEvent_title());
	   ps.setString(4, edto.getEvent_writer());
	   ps.setString(5, edto.getEvent_content());
	 
	   
	   ps.execute();
	   
	   con.close();
	   
   }
   
   
   //삭제
   
   public void delete(int event_no)throws Exception{
	   Connection con = getConnection();
	   
	   String sql = "delete event where event_no=?";
	   		
	   
	   PreparedStatement ps = con.prepareStatement(sql);
	   ps.setInt(1, event_no);
	   
	   
	   ps.execute();
	   
	   con.close();
	   
   }
   
   //수정
   
   public void edit(eventDto edto)throws Exception{
	   Connection con = getConnection();
	   
	   String sql = "UPDATE event set "
	   		+ "event_head=?, event_title=?, event_content=? where event_no=?";  //"event_head=?   --> 너는 잠시 보류
	   
	   PreparedStatement ps = con.prepareStatement(sql);
	   ps.setString(1, edto.getEvent_head());
	   ps.setString(2, edto.getEvent_title());
	   ps.setString(3, edto.getEvent_content());
	   ps.setInt(4, edto.getEvent_no());
	   
	   ps.execute();
	   
	   con.close();
	   
   }
   
   }