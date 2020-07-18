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

import home.beans.dto.ItemFileDto;

public class ItemFileDao {
//	context.xml에서 관리하는 자원 객체를 참조할 수 있도록 연결 코드 구현
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
	
	//진빈
	//단일조회 기능
		public ItemFileDto get(int item_file_no) throws Exception {
			Connection con = getConnection();
			
			String sql = "SELECT * FROM item_file WHERE item_file_no = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, item_file_no);
			ResultSet rs = ps.executeQuery();
			
			ItemFileDto ifdto;
			if(rs.next()) {
				ifdto = new ItemFileDto(rs);
			}
			else {
				ifdto = null;
			}
			
			con.close();
			return ifdto;
		}
		
		public int getSequence() throws Exception{
			Connection con = getConnection();
			
			String sql = "select item_file_seq.nextval from dual";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			int seq = rs.getInt(1);
			
			con.close();
			
			return seq;
		}
		
		public void save(ItemFileDto ifdto) throws Exception{
			Connection con = getConnection();
			
			String sql = "insert into item_file values(?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, ifdto.getItem_file_no());
			ps.setString(2, ifdto.getItem_file_name());
			ps.setString(3, ifdto.getItem_file_type());
			ps.setLong(4, ifdto.getItem_file_size());
			ps.setInt(5, ifdto.getItem_origin());
			ps.execute();
			
			
			con.close();
		}
		
		public List<ItemFileDto> getList(int item_no) throws Exception{
			Connection con = getConnection();
			
			String sql = "select * from item_file where item_origin=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, item_no);
			ResultSet rs = ps.executeQuery();
			
			List<ItemFileDto> list = new ArrayList<>();
			while(rs.next()) {
				ItemFileDto ifdto = new ItemFileDto(rs);
				list.add(ifdto);
			}
			
			con.close();
			return list;
		}
		
		
}
