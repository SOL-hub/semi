package home.beans.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import home.beans.dto.MemberDto;

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
	
	
	
	
	//로그인 메소드
	public MemberDto login(MemberDto mdto) throws Exception{
		Connection con= getConnection();
		
		String sql = "SELECT * FROM member WHERE member_id=? AND member_pw=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, mdto.getMember_id());
		ps.setString(2, mdto.getMember_pw());
		ResultSet rs = ps.executeQuery();
		
		MemberDto user;
		if(rs.next()) {//데이터가 있으면, 
			user = new MemberDto();
			
			user.setMember_no(rs.getInt("member_no"));
		 user.setMember_id(rs.getString("member_id"));
		 user.setMember_pw(rs.getString("member_pw"));
		 user.setMember_name(rs.getString("member_name"));
		 user.setMember_nick(rs.getString("member_nick"));
		 user.setMember_birth(rs.getString("member_birth"));
		 user.setMember_phone(rs.getString("member_phone"));
		 user.setMember_email(rs.getString("member_email"));
		 user.setMember_post(rs.getString("member_post"));
		 user.setMember_base_addr(rs.getString("member_base_addr"));
		 user.setMember_extra_addr(rs.getString("member_extra_addr"));
		user.setMember_point(rs.getInt("member_point"));
		user.setMember_auth(rs.getString("member_auth"));
		user.setMember_join(rs.getString("member_join"));
		user.setMember_login(rs.getString("member_login"));
		user.setMember_image(rs.getString("member_image"));
		user.setMember_consult_list(rs.getNString("member_consult_list"));
		}
		
		else {
			user=null;
		}
		
		con.close();
		
		return user;
	}
	
	//로그인 시작 갱신 메소드
	public void updateLoginTime(String id)throws Exception{
		Connection con=getConnection();
		
		String sql="update member set member_login=sysdate where member_id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);
		ps.execute();
		
		con.close();
	}
	
	//아이디 찾기 
	public String findId(MemberDto mdto)throws Exception{
		Connection con = getConnection();
		
		String sql = "SELECT member_id FROM MEMBER WHERE member_name=? AND MEMBER_PHONE =?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, mdto.getMember_name());
		ps.setString(2, mdto.getMember_phone());
		
		ResultSet rs = ps.executeQuery();
		
		String member_id;
		if(rs.next()) {
			member_id=rs.getString("member_id");
		}
		
		else {
			member_id=null;
		}
		
				con.close();
				
				return member_id;
		}
	
	//비밀번호 변경 전 검사
	
	public String CheckPw(MemberDto mdto) throws Exception{
		Connection con = getConnection();
		
		String sql = "SELECT member_pw FROM member where member_id=? and member_nick=? member_phone=?";
		
		PreparedStatement ps = con.prepareStatement(sql);

		ps.setString(1, mdto.getMember_id());
		ps.setString(2, mdto.getMember_nick());
		ps.setString(3, mdto.getMember_phone());
		
		ResultSet rs = ps.executeQuery();
	
		String member_pw;
		if(rs.next()) {
			member_pw=rs.getString("member_pw");
		}
		
		else {
		member_pw=null;
	}
		con.close();
		
		return member_pw;
		}
	

	
	//비밀번호 변경
	
	//public String CheckPw(MemberDto mdto) throws Exception{
	//	Connection con = getConnection();
		
	//	String sql = "UPDATE member set member_pw? "
			//	+ "where member_id=? and member_nick=? member_phone";
		
	//	PreparedStatement ps = con.prepareStatement(sql);
	//	ps.setString(1, mdto.getMember_pw());
	//	ps.setString(2, mdto.getMember_id());
	//	ps.setString(3, mdto.getMember_nick());
	//	ps.setString(4, mdto.getMember_phone());
	//	
	//	ps.execute();
		
	//	con.close();
	//}
	
	
	
}

