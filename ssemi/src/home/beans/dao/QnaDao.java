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
	private static DataSource src;//리모컨 선언
	static {
		try {
			Context ctx = new InitialContext();//탐색 도구
			Context env = (Context) ctx.lookup("java:/comp/env");//Context 설정 탐색
			src = (DataSource) env.lookup("jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
		
	//연결 메소드
	public Connection getConnection() throws Exception {
	return src.getConnection();
	}
	
	// 목록 메소드
	public List<QnaDto> getList(int start, int finish) throws Exception{
		Connection con = getConnection();

		String sql = "SELECT*FROM(SELECT ROWNUM rn, T.*FROM("
				+ "SELECT*FROM qna CONNECT BY PRIOR qna_no=super_no START WITH super_no IS NULL " 
						+ "ORDER SIBLINGS BY group_no DESC, qna_no ASC) T ) WHERE rn BETWEEN ? and? ";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, start);
		ps.setInt(2, finish);
		ResultSet rs = ps.executeQuery();
		
		List<QnaDto> list = new ArrayList<>();
		while(rs.next()) {
			QnaDto qdto = new QnaDto(rs);
			list.add(qdto);
		}
		con.close();
		return list;
	}
	
	// 개수 조회 메소드
	public int getCount() throws Exception{
		Connection con=getConnection();
		String sql="SELECT count(*) FROM qna";
		PreparedStatement ps=con.prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		rs.next();		//	데이터는 무조건 1개가 나오므로 이동
		int count=rs.getInt(1);		//	또는 rs.getInt("count(*)");
		con.close();
		return count;
	}
	public int getCount(String type, String keyword) throws Exception {
		Connection con=getConnection();
		String sql="SELECT count(*) FROM qna WHERE instr(#1,?)>0";
		sql=sql.replace("#1", type);
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1, keyword);
		ResultSet rs=ps.executeQuery();
		rs.next();		//	데이터는 무조건 1개가 나오므로 이동
		int count=rs.getInt(1);		//	또는 rs.getInt("count(*)");
		con.close();
		return count;
	}
	
	//검색 메소드
	public List<QnaDto> search(String type, String keyword, int start, int finish) throws Exception{
		Connection con = getConnection();
		
		String sql = "SELECT * FROM(SELECT ROWNUM rn, T.*FROM("
				+ "SELECT*FROM qna WHERE instr(#1, ?) > 0 CONNECT BY PRIOR qna_no=super_no "
				+ "START WITH super_no IS NULL ORDER SIBLINGS BY group_no DESC, qna_no ASC) T ) WHERE rn BETWEEN ? and? ";
		sql = sql.replace("#1", type);
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ps.setInt(2, start);
		ps.setInt(3, finish);
		ResultSet rs = ps.executeQuery();
		
		List<QnaDto> list = new ArrayList<>();
		while(rs.next()) {
			QnaDto qdto = new QnaDto(rs);
			list.add(qdto);
		}
		
		con.close();
		return list;
	}
	
	// 시퀀스 생성
	// - dual 테이블은 오라클이 제공하는 임시 테이블
	public int getSequence() throws Exception{
		Connection con = getConnection();
		
		String sql = "SELECT qna_seq.nextval FROM dual";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int seq = rs.getInt(1);//rs.getInt("NEXTVAL");
		
		con.close();
		
		return seq;
	}
	
	// 작성 메소드
	public void write(QnaDto qdto) throws Exception {
		if(qdto.getSuper_no() == 0) {//새글이면
			//qdto에는 5개의 정보가 들어있다(번호,말머리,제목,작성자,내용)
			//- 추가로 그룹번호를 설정해주어야 한다(나머지는 0)
			qdto.setGroup_no(qdto.getQna_no());
			//qdto.setSuper_no(0);
			//qdto.setDepth(0);
		}

		
		//위의 코드를 지나면 qdto에는 총 ?개의 정보가 들어간다.
		
		Connection con = getConnection();
		
		//아래와 같이 작성하면 미 작성된 항목들은 default 값이 적용
		String sql = "INSERT INTO Qna"
								+ "("
									+ "Qna_no, "
									+ "Qna_title, "
									+ "Qna_writer, "
									+ "Qna_content,"
									+ "super_no, "
									+ "group_no, "
									+ "depth"
								+ ") "
						+ "VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, qdto.getQna_no());
		ps.setString(3, qdto.getQna_title());
		ps.setString(4, qdto.getQna_writer());
		ps.setString(5, qdto.getQna_content());
		if(qdto.getSuper_no() == 0) {//새글이면 NULL을 설정
			ps.setNull(6, Types.INTEGER);
		}
		else {//답글이면 번호를 설정
			ps.setInt(6, qdto.getSuper_no());
		}
		ps.setInt(7, qdto.getGroup_no());
		ps.setInt(8, qdto.getDepth());
		ps.execute();
		
		con.close();
	}
}
