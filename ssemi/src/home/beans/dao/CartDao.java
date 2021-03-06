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
import home.beans.dto.ItemDto;
import home.beans.dto.MemberDto;

public class CartDao {
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
	
//	진빈 장바구니 db데이터 추가 코드
	public void cart_add(CartDto cdto) throws Exception{
		Connection con = getConnection();
		
		String sql="insert into cart values(cart_seq.nextval,?,?,null,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, cdto.getCart_item_name());
		ps.setInt(2, cdto.getCart_cnt());
		ps.setInt(3, cdto.getCart_member());
		ps.execute();
		
		con.close();
	}
	
// 주석 처리 커밋용ㅇㅇㅇㅇ	
//	진빈 아이디별로 장바구니 추가된 데이터 불러오는 코드
	public List<CartDto> getList(int cart_member) throws Exception {
		Connection con = getConnection();
		
		String sql = "SELECT * FROM cart WHERE cart_member=? ORDER BY cart_no DESC";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, cart_member);
		ResultSet rs = ps.executeQuery();
		
		List<CartDto> list = new ArrayList<>();
		while(rs.next()) {
			
			CartDto cdto = new CartDto(rs);
			list.add(cdto);
		}
		
		con.close();
		
		return list;	
	}
	public List<CartDto> getList2(CartDto cdto) throws Exception {
		Connection con = getConnection();
		
		String sql = "SELECT * FROM cart WHERE cart_no=? ORDER BY cart_no ASC";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, cdto.getCart_no());
		ResultSet rs = ps.executeQuery();
		
		List<CartDto> list = new ArrayList<>();
		while(rs.next()) {
			
			CartDto cdto2 = new CartDto(rs);
			list.add(cdto2);
		}
		
		con.close();
		
		return list;	
	}
	
	public List<CartDto> getList(int cart_member,int start, int finish) throws Exception{
		Connection con = getConnection();
		

		String sql = "SELECT rownum rn, cart.* from cart where cart_member=? and rownum between ? and ?";	
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, cart_member);
		ps.setInt(2, start);
		ps.setInt(3, finish);
		ResultSet rs = ps.executeQuery();
		
		List<CartDto> list = new ArrayList<>();
		while(rs.next()) {
			CartDto cdto = new CartDto(rs);
			list.add(cdto);
		}
		
		con.close();
		return list;
	}
	
	
// 장바구니 삭제
	public void cartDelete(int cart_no)throws Exception{
		Connection con = getConnection();
		
		String sql = "delete from cart where cart_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, cart_no);
		ps.execute();
		
		
		con.close();
	
	}
	
	// 선택구매시 장바구니 리스트삭제
		public void cartDelete_buy(int cart_item_name)throws Exception{
			Connection con = getConnection();
			
			String sql = "delete from cart where cart_item_name=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, cart_item_name);
			ps.execute();
			
			
			con.close();
		
		}
	
	
	// 장바구니 단일조회(아이디별)
		public CartDto get_cart(int cart_member)throws Exception{
			Connection con = getConnection();
			
			String sql = "select * from cart where cart_member=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, cart_member);
			ResultSet rs =ps.executeQuery();
			
			CartDto cdto;
			if(rs.next()) {
				cdto = new CartDto(rs);
			}
			else {
				cdto = null;
			}
			
			con.close();
			return cdto;
		}
		
		// 장바구니 단일조회(장바구니 넘버로)
				public CartDto get_cart2(int cart_no)throws Exception{
					Connection con = getConnection();
					
					String sql = "select * from cart where cart_no=?";
					PreparedStatement ps = con.prepareStatement(sql);
					ps.setInt(1, cart_no);
					ResultSet rs =ps.executeQuery();
					
					CartDto cdto;
					if(rs.next()) {
						cdto = new CartDto(rs);
					}
					else {
						cdto = null;
					}
					
					con.close();
					return cdto;
				}
		
//		장바구니 수량 변경 
		public void cart_cnt_change(int cart_cnt,int cart_no) throws Exception{
			Connection con = getConnection();
			
			String sql = "update cart set cart_cnt=? where cart_no=? ";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, cart_cnt);
			ps.setInt(2, cart_no);
			
			ps.execute();
			
			con.close();
			
		}
		
}
