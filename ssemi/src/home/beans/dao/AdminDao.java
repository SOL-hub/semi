package home.beans.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import home.beans.dto.AdminDto;


public class AdminDao {
	
	
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

	// 관리자 로그인 
	
	public AdminDto login(AdminDto adto) throws Exception{
		
		Connection con =getConnection();
		String sql = "SELECT* FROM admin WHERE admin_id=? AND admin_pw=?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, adto.getAdmin_id());
		ps.setString(2, adto.getAdmin_pw());
		ResultSet rs = ps.executeQuery();
		
		AdminDto admin;
		if(rs.next()) {
			admin = new AdminDto(rs);
		}else {
			admin= null;
			
		}
		con.close();
		return admin;
	}
	
	

}
