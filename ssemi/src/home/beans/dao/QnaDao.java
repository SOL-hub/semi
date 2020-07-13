package home.beans.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import home.beans.dto.QnaDto;
import home.beans.dto.QnaDto;

public class QnaDao {
	private static DataSource src;// 리모컨 선언
	static {
		try {
			Context ctx = new InitialContext();// 탐색 도구
			Context env = (Context) ctx.lookup("java:/comp/env");// Context 설정 탐색
			src = (DataSource) env.lookup("jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	// 연결 메소드
	public Connection getConnection() throws Exception {
		return src.getConnection();
	}

	// 목록 메소드
	public List<QnaDto> getList() throws Exception {
		Connection con = getConnection();

		String sql = "SELECT*FROM qna ORDER BY qna_no DESC ";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();

		List<QnaDto> list = new ArrayList<>();
		while (rs.next()) {
			QnaDto qdto = new QnaDto(rs);
			list.add(qdto);
		}
		con.close();
		return list;
	}

	// 개수 조회 메소드
	public int getCount() throws Exception {
		Connection con = getConnection();
		String sql = "SELECT count(*) FROM qna";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next(); // 데이터는 무조건 1개가 나오므로 이동
		int count = rs.getInt(1); // 또는 rs.getInt("count(*)");
		con.close();
		return count;
	}

	public int getCount(String type, String keyword) throws Exception {
		Connection con = getConnection();
		String sql = "SELECT count(*) FROM qna WHERE instr(#1,?)>0";
		sql = sql.replace("#1", type);
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ResultSet rs = ps.executeQuery();
		rs.next(); // 데이터는 무조건 1개가 나오므로 이동
		int count = rs.getInt(1); // 또는 rs.getInt("count(*)");
		con.close();
		return count;
	}

	// 검색 메소드
	public List<QnaDto> search(String type, String keyword) throws Exception {
		Connection con = getConnection();

		String sql = "SELECT*FROM qna WHERE instr(#1, ?) > 0 ";
		sql = sql.replace("#1", type);
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ResultSet rs = ps.executeQuery();

		List<QnaDto> list = new ArrayList<>();
		while (rs.next()) {
			QnaDto qdto = new QnaDto(rs);
			list.add(qdto);
		}

		con.close();
		return list;
	}

	// 시퀀스 생성
	// - dual 테이블은 오라클이 제공하는 임시 테이블
	public int getSequence() throws Exception {
		Connection con = getConnection();

		String sql = "SELECT qna_seq.nextval FROM dual";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int seq = rs.getInt(1);// rs.getInt("NEXTVAL");

		con.close();

		return seq;
	}

	// 단일조회 (Qna_content.jsp)
	public QnaDto get(int qna_no) throws Exception {
		Connection con = getConnection();
		String sql = "SELECT*FROM qna WHERE qna_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, qna_no);
		ResultSet rs = ps.executeQuery();
		QnaDto qdto = rs.next() ? new QnaDto(rs) : null;	// 3항 연산자
		con.close();
		return qdto;
	}
	
	// 단일조회2 (Qna_content.jsp)
		public QnaDto get_id(int qna_writer) throws Exception {
			Connection con = getConnection();
			String sql = "SELECT*FROM qna WHERE qna_writer=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, qna_writer);
			ResultSet rs = ps.executeQuery();
			
				QnaDto qdto = rs.next() ? new QnaDto(rs) : null;	// 3항 연산자	
			
			con.close();
			return qdto;
		}
	
	// 아이디 단일조회 (member_no 대신 아이디 불러오기)
	public String getWriter(int member_no) throws Exception {
		Connection con = getConnection();
		String sql="SELECT member.member_id FROM member inner join qna on member.member_no=qna.qna_writer WHERE member_no=?";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setInt(1, member_no);
		ResultSet rs=ps.executeQuery();
		
		rs.next();
		String member_id=rs.getString(1);
		
		con.close();
		return member_id;
	}
	
	// 게시글 등록 메소드
	public void write(QnaDto qdto) throws Exception {
		Connection con = getConnection();
		String sql = "INSERT INTO qna(qna_no, qna_title, qna_writer, qna_content) VALUES(?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, qdto.getQna_no());
		ps.setString(2, qdto.getQna_title());
		ps.setInt(3, qdto.getQna_writer());
		ps.setString(4, qdto.getQna_content());
		ps.execute();
		
		con.close();
	}
	
	// 수정 메소드
	public void edit(QnaDto qdto) throws Exception {
		Connection con = getConnection();
		
		String sql="UPDATE qna SET qna_title=?, qna_content=? WHERE qna_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, qdto.getQna_title());
		ps.setString(2, qdto.getQna_content());
		ps.setInt(3, qdto.getQna_no());
		ps.execute();
		con.close();
	}
	
	// 게시글 삭제
	public void delete(int qna_no) throws Exception {
		Connection con = getConnection();
		String sql="DELETE qna WHERE qna_no=?";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setInt(1, qna_no);
		ps.execute();
		con.close();
	}
	
}
