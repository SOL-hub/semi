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

import home.beans.dto.MemberDto;
import home.beans.dto.shoppingDto;

public class ShoppingDao {
	private static DataSource src;

	// static 변수의 초기화가 복잡할 경우에 사용할 수 있는 static 전용 구문
	static {
//		src=context.xml에서 관리하는 자원의 정보;
		try {
			Context ctx = new InitialContext();
			Context env = (Context) ctx.lookup("java:/comp/env");// Context 설정 찾아라
			src = (DataSource) env.lookup("jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	public Connection getConnection() throws Exception {

//		Class.forName("oracle.jdbc.OracleDriver");
//		
//		Connection con = DriverManager.getConnection(
//				"jdbc:oracle:thin:@localhost:1521:xe" , "c##kh","c##kh");
//				
//		return con;
		return src.getConnection();
	}
	
	
	// 구매내역 목록 -- 임새봄 
	public List<shoppingDto> getList() throws Exception {
		Connection con = getConnection();
		
		String sql = "SELECT*FROM shopping ORDER BY shopping_no DESC";
		PreparedStatement ps =con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<shoppingDto> list = new ArrayList<>();
		while(rs.next()) {
			shoppingDto sdto = new shoppingDto(rs);
			list.add(sdto);
		}
		
		con.close();
		return list;
	}
	
	// 관리자가 회원 주문 내역 검색 -- 새봄 
	public List<shoppingDto> search (String type, String keyword) throws Exception {
		
		Connection con = getConnection();
		String sql = "SELECT * FROM shopping WHERE instr(#1, ?)>0 ORDER BY #1 ASC";
		sql=sql.replace("#1", type);
		
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1	,keyword );
		ResultSet rs = ps.executeQuery();
		
		List<shoppingDto> list = new ArrayList<>();
		
		while(rs.next()) {
			shoppingDto sdto = new shoppingDto(rs);
			list.add(sdto);
			
		}
		con.close();
		
		return list;
	}

	// 관리자가 회원 주문내역 검색 날짜,키워드함께 검색 -- 새봄 
	public List<shoppingDto> search_join(String type, String keyword, String start, String finish) throws Exception{
		
		
		Connection con = getConnection();
		String sql= "SELECT * FROM shopping WHERE instr(#1,?)>0 and shopping_date "
				+ "BETWEEN to_date(?,'YYYY-MM-DD') and to_date(?,'YYYY-MM-DD') ORDER BY #1 DESC";
		sql = sql.replace("#1", type);
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ps.setString(2, start);
		ps.setString(3, finish);
		ResultSet rs = ps.executeQuery();
		
		List<shoppingDto> list = new ArrayList<>();
		while(rs.next()) {
			shoppingDto sdto = new shoppingDto();
			list.add(sdto);
		}
		
		con.close();
		return list;
	}
	
	// 주문내역 날짜만 검색  -- 새봄 
	public List<shoppingDto> search_join_k(String start , String finish) throws Exception {
		Connection con = getConnection();

		String sql = "SELECT * FROM shopping WHERE shopping_date "
				+"BETWEEN to_date(?,'YYYY-MM-DD') and to_date(?,'YYYY-MM-DD')";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, start);
		ps.setString(2, finish);
		ResultSet rs = ps.executeQuery();

		List<shoppingDto> list = new ArrayList<>();
		while (rs.next()) {
			shoppingDto sdto = new shoppingDto(rs);
			list.add(sdto);
		}
		con.close();

		return list;
	}
	
	// 아이템 이름 조회 
	public String getItem(int item_no) throws Exception{
		Connection con = getConnection();
		
		String sql = "SELECT * FROM item INNER JOIN shopping ON shopping.shopping_item_name=item.item_no WHERE item_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, item_no);
		ResultSet rs = ps.executeQuery();
		rs.next();
		String item_name = rs.getString(1);
		
		con.close();
		return item_name;
	}
	
	public void delete(String shopping_no) throws Exception {
		Connection con = getConnection();

		String sql = "DELETE shopping WHERE shopping_no= ?";

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, shopping_no);
		ps.execute();

		con.close();
	}
	

	
	//진빈 구매내역 추가 (db로)
	public void buy_list_add(shoppingDto sdto) throws Exception{
		Connection con = getConnection();
		String sql = "insert into shopping values(shopping_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, null, ?, ?, ?, null, null, sysdate)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, sdto.getShopping_item_name());
		ps.setInt(2, sdto.getShopping_item_cnt());
		ps.setInt(3, sdto.getShopping_member());
		ps.setString(4, sdto.getShopping_recive_name());
		ps.setString(5, sdto.getShopping_recive_phone());
		ps.setString(6, sdto.getShopping_recive_post());
		ps.setString(7, sdto.getShopping_recive_base_addr());
		ps.setString(8, sdto.getShopping_recive_extra_addr());
		ps.setString(9, sdto.getShopping_recive_content());
		ps.setString(10, sdto.getShopping_payment());
		ps.setString(11, sdto.getShopping_paybank());
		ps.setString(12, sdto.getShopping_paybank_num());

		
		ps.execute();
		
		con.close();
		
	}
	//진빈 아이디별 주문내역 조회
	public List<shoppingDto> buy_list(int shopping_member) throws Exception {
		Connection con = getConnection();
		
		String sql = "SELECT*FROM shopping where shopping_member=? ORDER BY shopping_no DESC";
		PreparedStatement ps =con.prepareStatement(sql);
		ps.setInt(1, shopping_member);
		ResultSet rs = ps.executeQuery();
		
		List<shoppingDto> list = new ArrayList<>();
		while(rs.next()) {
			shoppingDto sdto = new shoppingDto(rs);
			list.add(sdto);
		}
		
		con.close();
		return list;
	}
	//진빈 주문취소 db삭제
	public void delete_buy_list(int shopping_no)throws Exception{
		Connection con = getConnection();
		String sql = "delete from shopping where shopping_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, shopping_no);
		ps.execute();
		
		con.close();
		
	}
}
