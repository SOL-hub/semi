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
import sun.text.normalizer.Replaceable;

public class MemberDao {
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
	
	public void join(MemberDto mdto)throws Exception{
		Connection con = getConnection();
		String sql = "insert into member values(member_seq.nextval,?,?,?,?,?,?,?,?,?,?,100,'일반',sysdate,null,null,null)";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, mdto.getMember_id());
		ps.setString(2, mdto.getMember_pw());
		ps.setString(3, mdto.getMember_name());
		ps.setString(4, mdto.getMember_nick());
		ps.setString(5, mdto.getMember_birth());
		ps.setString(6, mdto.getMember_phone());
		ps.setString(7, mdto.getMember_email());
		ps.setString(8, mdto.getMember_post());
		ps.setString(9, mdto.getMember_base_addr());
		ps.setString(10, mdto.getMember_extra_addr());
		
		ps.execute();
		
		con.close();
		
	}
	
	public String idCheck(MemberDto mdto)throws Exception{
		
		
		Connection con = getConnection();
		String sql = "select * from member where member_id=?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, mdto.getMember_id());
		
		ResultSet rs = ps.executeQuery();
		String rst;
		if(rs.next()) {
			rst = rs.getString("member_id");
		}
		else {
			rst = null;
		}
		
		con.close();
		return rst;
		
	}
	

	
	
	// 관리자 회원 검색 --임새봄
	public List<MemberDto> search(String type, String keyword) throws Exception {
		Connection con = getConnection();
		String sql = "SELECT * FROM member WHERE instr(#1, ?)>0 ORDER BY #1 ASC";
		sql= sql.replace("#1", type);
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ResultSet rs = ps.executeQuery();
		
		
		List<MemberDto> list = new ArrayList<>();
		while(rs.next()) {
			MemberDto mdto = new MemberDto(rs);
			list.add(mdto);
		}
		con.close();
		return list;
	}
	
}
