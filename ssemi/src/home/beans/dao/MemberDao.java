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


public class MemberDao {
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

//	진빈(회원가입 완료)
	public void join(MemberDto mdto) throws Exception {

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

	   public MemberDto idCheck(String member_id) throws Exception {
		      Connection con = getConnection();
		      String sql = "select * from member where instr(member_id,?)>0";
		      PreparedStatement ps = con.prepareStatement(sql);
		      ps.setString(1, member_id);

		      ResultSet rs = ps.executeQuery();
		      MemberDto mdto;
		      if (rs.next()) {
		         mdto = new MemberDto(rs);
		      } else {
		         mdto = null;
		      }
		      con.close();
		      return mdto;
		   }


	// 진빈(회원탈퇴) ---> 솔이가 밑에 다 씀

	//public void member_out(int member_no) throws Exception {
		//Connection con = getConnection();

		//String sql = "delete member where member_no=?";

		//PreparedStatement ps = con.prepareStatement(sql);

		//ps.setInt(1, member_no);
		//ps.execute();

		//con.close();
	//}




	// 진빈(유저 단일조회)
	public MemberDto get(int member_no) throws Exception {

		Connection con = getConnection();
		String sql = "select * from member where member_no=?";
		PreparedStatement ps = con.prepareStatement(sql);

		ps.setInt(1, member_no);
		ResultSet rs = ps.executeQuery();

		MemberDto mdto;
		if (rs.next()) {
			mdto = new MemberDto(rs);

		} else {
			mdto = null;
		}

		con.close();

		return mdto;

	}
	

	// 진빈(회원정보수정)
	public void user_info_update(MemberDto mdto) throws Exception {

		Connection con = getConnection();

		String sql = "update member set " + "member_nick=?, member_birth=?, member_phone=?, member_email=?,"
				+ "member_post=?, member_base_addr=?, member_extra_addr=? where member_no=?";
		PreparedStatement ps = con.prepareStatement(sql);

		ps.setString(1, mdto.getMember_nick());
		ps.setString(2, mdto.getMember_birth());
		ps.setString(3, mdto.getMember_phone());
		ps.setString(4, mdto.getMember_email());
		ps.setString(5, mdto.getMember_post());
		ps.setString(6, mdto.getMember_base_addr());
		ps.setString(7, mdto.getMember_extra_addr());
		ps.setInt(8, mdto.getMember_no());

		ps.execute();

		con.close();

	}

	// 진빈(회원탈퇴)

	public void member_out(int member_no) throws Exception {
		Connection con = getConnection();

		String sql = "delete from member where member_no=?";

		PreparedStatement ps = con.prepareStatement(sql);

		ps.setInt(1, member_no);
		ps.execute();

		con.close();
	}


	// 로그인 메소드 -솔
	public MemberDto login(MemberDto mdto) throws Exception {
		Connection con = getConnection();

		String sql = "SELECT * FROM member WHERE member_id=? AND member_pw=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, mdto.getMember_id());
		ps.setString(2, mdto.getMember_pw());
		ResultSet rs = ps.executeQuery();

		MemberDto user;
		if (rs.next()) {// 데이터가 있으면,
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
			user = null;
		}

		con.close();

		return user;
	}

	// 로그인 시작 갱신 메소드
	public void updateLoginTime(String id) throws Exception {
		Connection con = getConnection();

		String sql = "update member set member_login=sysdate where member_id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);
		ps.execute();

		con.close();
	}

	// 아이디 찾기
	public String findId(MemberDto mdto) throws Exception {
		Connection con = getConnection();

		String sql = "SELECT member_id FROM MEMBER WHERE member_name=? AND MEMBER_PHONE =?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, mdto.getMember_name());
		ps.setString(2, mdto.getMember_phone());

		ResultSet rs = ps.executeQuery();

		String member_id;
		if (rs.next()) {
			member_id = rs.getString("member_id");
		}

		else {
			member_id = null;
		}

		con.close();

		return member_id;
	}


	// 비밀번호 변경 전 검사--솔

	// 비밀번호 변경 전 검사


	 public String CheckPw(MemberDto mdto) throws Exception {
	      Connection con = getConnection();

	      String sql = "SELECT member_pw FROM member where member_id=?";

	      PreparedStatement ps = con.prepareStatement(sql);

	      ps.setString(1, mdto.getMember_id());
	      

	      ResultSet rs = ps.executeQuery();

	      String member_pw;
	      if (rs.next()) {
	         member_pw = rs.getString("member_pw");
	      }

	      else {
	         member_pw = null;
	      }
	      con.close();

	      return member_pw;
	   }



	// 비밀번호 변경 --솔
	public void ChangePw(MemberDto mdto) throws Exception {
		Connection con = getConnection();
	
		String sql = "update member set member_pw=? where member_id=?";
				
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, mdto.getMember_pw());
		ps.setString(2, mdto.getMember_id());

		ps.execute();

		con.close();
		
	}
	
//	//탈퇴 (user_out)-- 솔
//	public void user_out(String member_id)throws Exception{
//		Connection con = getConnection();
//		
//		String sql = "DELETE member where member_id=?";
//		PreparedStatement ps = con.prepareStatement(sql);
//		
//		ps.setString(1, member_id);
//		
//		ps.execute();
//		
//		con.close();
//	
//	}
//	

	
//관리자 회원 검색 --임새봄
	public List<MemberDto> search(String type, String keyword) throws Exception {
		Connection con = getConnection();
		String sql = "SELECT * FROM member WHERE instr(#1, ?)>0 ORDER BY #1 ASC";
		sql = sql.replace("#1", type);

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ResultSet rs = ps.executeQuery();

		List<MemberDto> list = new ArrayList<>();
		while (rs.next()) {
			MemberDto mdto = new MemberDto(rs);
			list.add(mdto);
		}

		con.close();

		return list;

}
	
	// 관리자가 회원 날짜로 검색 -- 임새봄 
		public List<MemberDto> search_join(String type, String keyword,String start , String finish) throws Exception {

			Connection con = getConnection();

			String sql = "SELECT * FROM MEMBER WHERE instr(#1, ?)>0 and member_join "
					+"BETWEEN to_date(? || '00:00:00','YYYY-MM-DD HH24:MI:SS') and to_date(? || '23:59:59'  ,'YYYY-MM-DD HH24:MI:SS') ORDER BY #1 ASC";
			sql = sql.replace("#1", type);
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, keyword);
			ps.setString(2, start);
			ps.setString(3, finish);
			ResultSet rs = ps.executeQuery();

			List<MemberDto> list = new ArrayList<>();
			while (rs.next()) {
				MemberDto mdto = new MemberDto(rs);
				list.add(mdto);
			}
			con.close();
			return list;

		}
		
		public List<MemberDto> search_join_k(String start , String finish) throws Exception {
			Connection con = getConnection();

			String sql = "SELECT * FROM MEMBER WHERE member_join "
					+"BETWEEN to_date(? || '00:00:00','YYYY-MM-DD HH24:MI:SS') and to_date(? || '23:59:59'  ,'YYYY-MM-DD HH24:MI:SS') ";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, start);
			ps.setString(2, finish);
			ResultSet rs = ps.executeQuery();

			List<MemberDto> list = new ArrayList<>();
			while (rs.next()) {
				MemberDto mdto = new MemberDto(rs);
				list.add(mdto);
			}
			con.close();
			return list;
		}

		// 관리자가 회원 탈퇴 시키는거! -- 임새봄
		public void exit(String member_no) throws Exception {
			Connection con = getConnection();


			String sql = "DELETE member WHERE member_no= ?";

			

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, member_no);
			ps.execute();

			con.close();
		}

		
		// 관리자가 회원 수정 -- 임새봄 
		
		public void editByAdmin(MemberDto mdto) throws Exception{
			Connection con = getConnection();
			
			String sql = "update member set " + "member_pw=? ,member_nick=?, member_birth=?, member_phone=?, member_email=?,"
					+ "member_post=?, member_base_addr=?, member_extra_addr=?, member_point=? where member_no=?";
			
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(1, mdto.getMember_pw());
			ps.setString(2, mdto.getMember_nick());
			ps.setString(3, mdto.getMember_birth());
			ps.setString(4, mdto.getMember_phone());
			ps.setString(5, mdto.getMember_email());
			ps.setString(6, mdto.getMember_post());
			ps.setString(7, mdto.getMember_base_addr());
			ps.setString(8, mdto.getMember_extra_addr());
			ps.setInt(9, mdto.getMember_point());
			ps.setInt(10, mdto.getMember_no());
			
			

			ps.execute();

			con.close();
		
		}



		
		// 총 가입한 사람 카운트 - 임새봄 
		
		public int memberCount() throws Exception{
				
			Connection con = getConnection();
			
			String sql = "SELECT count(*) FROM MEMBER";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			rs.next();
			int count = rs.getInt(1);
			
	
			con.close();
			return count;
			
		}
			

		// 이벤트를 통한 포인트 적립-솔
		public void pointadd(int member_no) throws Exception {

			Connection con = getConnection();

			String sql = "update member set member_point = member_point + 1000 where member_no=?";
			PreparedStatement ps = con.prepareStatement(sql);

			
			ps.setInt(1, member_no);

			ps.execute();

			con.close();


		}
		
		//진빈 구매 포인트 차감
		public void buy_point_min(int member_no, int member_point) throws Exception{
			Connection con = getConnection();
			
			String sql = "update member set member_point = (member_point - ?) where member_no=?";
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setInt(1, member_point);
			ps.setInt(2, member_no);
			ps.execute();
			
			con.close();
		}
		
		//진빈 구매 취소시 포인트 되돌리기
				public void buy_point_cancle(int member_no, int member_point) throws Exception{
					Connection con = getConnection();
					
					String sql = "update member set member_point = (member_point + ?) where member_no=?";
					PreparedStatement ps = con.prepareStatement(sql);
					
					ps.setInt(1, member_point);
					ps.setInt(2, member_no);
					ps.execute();
					
					con.close();
				}
		
		
	
}
	


