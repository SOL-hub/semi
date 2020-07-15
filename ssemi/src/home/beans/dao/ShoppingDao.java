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

	
	
	
	
	
}
