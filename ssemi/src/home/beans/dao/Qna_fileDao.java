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

import home.beans.dto.Qna_fileDto;

public class Qna_fileDao {

	private static DataSource src;
	static {
		try {
			Context ctx = new InitialContext();
			Context env = (Context) ctx.lookup("java:/comp/env");
			src = (DataSource) env.lookup("jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public Connection getConnection() throws Exception{
		return src.getConnection();
	}
	
	//시퀀스 생성 메소드
	public int getSequence() throws Exception {
		Connection con = getConnection();
		
		String sql = "SELECT qna_file_seq.nextval FROM dual";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int seq = rs.getInt(1);//rs.getInt("NEXTVAL");
		
		con.close();
		
		return seq;
	}
	
	//저장 메소드
	// - 시퀀스 번호까지 이미 뽑혀 있으므로 자동 생성할 데이터가 없다
	public void save(Qna_fileDto qfdto) throws Exception {
		Connection con = getConnection();
		
		String sql = "INSERT INTO qna_file VALUES(?, ?, ?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, qfdto.getQna_file_no());
		System.out.println(qfdto.getQna_file_no());
		ps.setInt(2, qfdto.getQna_file_origin());
		ps.setString(3, qfdto.getQna_file_name());
		ps.setLong(4, qfdto.getQna_file_size());
		ps.setString(5, qfdto.getQna_file_type());
		ps.execute();
		
		con.close();
	}
	
	//게시글 첨부파일 조회(댓글 조회와 동일)
	public List<Qna_fileDto> getList(int qna_no) throws Exception {
		Connection con = getConnection();
		String sql = "SELECT * FROM qna_file WHERE qna_file_origin = ? ORDER BY qna_file_no ASC";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, qna_no);
		ResultSet rs = ps.executeQuery();
		List<Qna_fileDto> list = new ArrayList<>();
		while(rs.next()) {
			Qna_fileDto qfdto = new Qna_fileDto(rs);
			list.add(qfdto);
		}
		con.close();
		return list;
	}
	
	//단일조회 기능
	public Qna_fileDto get(int qna_file_no) throws Exception {
		Connection con = getConnection();
		
		String sql = "SELECT * FROM qna_file WHERE qna_file_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, qna_file_no);
		ResultSet rs = ps.executeQuery();
		
		Qna_fileDto qfdto;
		if(rs.next()) {
			qfdto = new Qna_fileDto(rs);
		}
		else {
			qfdto = null;
		}
		
		con.close();
		return qfdto;
	}

}
