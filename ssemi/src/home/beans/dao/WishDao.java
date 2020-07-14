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

import home.beans.dto.CartDto;
import home.beans.dto.WishDto;

public class WishDao {
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
	
//	진빈 위시리스트 db데이터 추가 코드
	public void wish_add(WishDto wdto) throws Exception{
		Connection con = getConnection();
		
		String sql="insert into wish values(wish_seq.nextval, ?, ?, sysdate)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, wdto.getWish_item_name());
		ps.setInt(2, wdto.getWish_member());
		ps.execute();
		
		con.close();
	}
	
//	진빈 위시리스트 리스트 조회(로그인한 아이디별)
	public List<WishDto> get_wishList(int wish_member) throws Exception{
		Connection con = getConnection();
		
		String sql="select * from wish where wish_member=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, wish_member);
		
		ResultSet rs = ps.executeQuery();
		
		List<WishDto> list = new ArrayList<>();
		while(rs.next()) {
			WishDto wdto = new WishDto(rs);
			
			list.add(wdto);
		}
		
		con.close();
		
		return list;
	}
	
//	진빈 위시리스트 리스트 조회(로그인한 아이디별)
	public List<WishDto> get_wishList(int wish_member, int start, int finish) throws Exception{
		Connection con = getConnection();
		
		String sql="SELECT * FROM (SELECT rownum rn, T.* from(select * from wish where wish_member=?)T )where rn between ? and ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, wish_member);
		ps.setInt(2, start);
		ps.setInt(3, finish);
		
		ResultSet rs = ps.executeQuery();
		
		List<WishDto> list = new ArrayList<>();
		while(rs.next()) {
			WishDto wdto = new WishDto(rs);
			
			list.add(wdto);
		}
		
		con.close();
		
		return list;
	}
	
//	진빈 위시리스트 단일조회(로그인한 아이디별)	
	public WishDto get_wish(int wish_member)throws Exception {
		Connection con = getConnection();
		
		String sql = "select * from wish where wish_member=?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, wish_member);
		ResultSet rs = ps.executeQuery();
		
		WishDto wdto;
		if(rs.next()) {
			wdto = new WishDto(rs);
		}
		else {
			wdto = null;
		}
		
		con.close();
		return wdto;
	}
	
	// 위시리스트 삭제
		public void wishDelete(int wish_no)throws Exception{
			Connection con = getConnection();
			
			String sql = "delete from wish where wish_no=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, wish_no);
			ps.execute();
			
			
			con.close();
		
		}
	// 위시리스트 목록 개수 계산
		public int getCount() throws Exception{
			Connection con = getConnection();
			String sql = "select count(*) from wish";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			int count = rs.getInt(1);
			
			con.close();
			
			return count;
		}
}
