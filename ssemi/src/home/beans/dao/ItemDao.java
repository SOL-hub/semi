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

import home.beans.dto.ItemDto;
import home.beans.dto.MemberDto;

public class ItemDao {

//	context.xml에서 관리하는 자원 객체를 참조할 수 있도록 연결 코드 구현
	private static DataSource src;
	
	//static 변수의 초기화가 복잡할 경우에 사용할 수 있는 static 전용 구문
	static {
//		src=context.xml에서 관리하는 자원의 정보;
		try {
			Context ctx = new InitialContext();
			Context env = (Context) ctx.lookup("java:/comp/env");//Context 설정 찾아라
			src = (DataSource) env.lookup("jdbc/oracle");
		} 
		catch (NamingException e) {			
			e.printStackTrace();
		}
	}
	
	public Connection getConnection() throws Exception{
		
//		Class.forName("oracle.jdbc.OracleDriver");
//		
//		Connection con = DriverManager.getConnection(
//				"jdbc:oracle:thin:@localhost:1521:xe" , "c##kh","c##kh");
//				
//		return con;
		return src.getConnection();
	}
	
	//상품 검색 메소드
	//이름 : getList
	//결과 : 상품 목록 == search<ProductDto>
	//준비물 : X
	public List<ItemDto> search(String keyword) throws Exception {
		Connection con = getConnection();
		
		String sql = "SELECT * FROM item WHERE instr(item_name,?)>0 ORDER BY item_no ASC";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ResultSet rs = ps.executeQuery();
	
		List<ItemDto> list = new ArrayList<>();//데이터들을 보관할 목록 저장소 생성
		while(rs.next()) {//데이터 개수만큼 반복하도록 지시
			ItemDto idto = new ItemDto(rs);			
			list.add(idto);//준비된 저장소에 옮겨담은 데이터 객체를 추가한다
		}
		con.close();	
		//연결이 종료된 후 복제한 저장소를 반환
		return list;
	}
	
	// 목록 메소드
	public List<ItemDto> getList() throws Exception {
		Connection con = getConnection();
		
		String sql = "SELECT * FROM item ORDER BY item_no ASC";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ResultSet rs = ps.executeQuery();
		
		List<ItemDto> list = new ArrayList<>();
		while(rs.next()) {
			
			ItemDto idto = new ItemDto(rs);
			list.add(idto);
		}
		
		con.close();
		
		return list;	
	}
	
//	진빈(아이템 단일조회)
	
	   public ItemDto item_get(int item_no)throws Exception{
	      
	      Connection con = getConnection();
	      String sql = "select * from item where item_no=?";
	      PreparedStatement ps = con.prepareStatement(sql);
	      
	      ps.setInt(1, item_no);
	      ResultSet rs = ps.executeQuery();
	      
	      ItemDto idto;
	      if(rs.next()) {
	         idto = new ItemDto(rs);
	         
	      }
	      else {
	         idto = null;
	      }
	      
	      con.close();
	      
	      return idto;
	      
	   }
	
}