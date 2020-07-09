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

import home.beans.dto.BoardDto;
import home.beans.dto.ItemDto;

public class BoardDao {
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
		return src.getConnection();
	}

	// 검색 메소드
	
	public List<BoardDto> search(String type, String keyword, int start, int finish) throws Exception {
		Connection con = getConnection();

		String sql = "SELECT * FROM(SELECT ROWNUM rn, T.*FROM("
				+ "SELECT*FROM board WHERE instr(#1, ?) > 0 CONNECT BY PRIOR board_no=board_no "
				+ "START WITH super_no IS NULL ORDER SIBLINGS BY group_no DESC, board_no ASC) T ) WHERE rn BETWEEN ? and? ";
		sql = sql.replace("#1", type);
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ps.setInt(2, start);
		ps.setInt(3, finish);
		ResultSet rs = ps.executeQuery();

		List<BoardDto> list = new ArrayList<BoardDto>();
		while (rs.next()) {
			BoardDto bdto = new BoardDto();
			list.add(bdto);
		}

		con.close();
		return list;
	}

	// 목록 메소드
	public List<ItemDto> getList(int start, int finish) throws Exception{
		Connection con = getConnection();
		
//		String sql = "SELECT * FROM board ORDER BY board_no DESC";
		
//		트리 정렬 : 상하 관계로 연결되어 있는 구조의 데이터를 불러오기 위한 정렬방식
//		- CONNECT BY PRIOR를 이용하여 항목을 연결하며 상하관계를 알려준다
//		- START WITH 를 이용하여 시작 지점을 알려준다
//		- ORDER SIBLINGS BY를 이용하여 정렬 순서를 알려준다
		
//		아래의 구문은 다음의 뜻을 가진다.
//		"게시글들을 
//		board_no와 super_no가 같으면 연결되어 있는 것으로 생각하고
//		super_no가 NULL인 항목부터 시작해서 추출해라.
//		이렇게 추출되는 글 그룹들을 그룹번호 내림차순, 글번호 오름차순으로 정렬해라!"
		String sql = "SELECT*FROM(SELECT ROWNUM rn, T.*FROM("
				+ "SELECT*FROM board CONNECT BY PRIOR board_no=super_no START WITH super_no IS NULL " 
						+ "ORDER SIBLINGS BY group_no DESC, board_no ASC) T ) WHERE rn BETWEEN ? and? ";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, start);
		ps.setInt(2, finish);
		ResultSet rs = ps.executeQuery();
		
		List<ItemDto> list = new ArrayList<>();
		while(rs.next()) {
			ItemDto idto = new ItemDto(rs);
			list.add(idto);
		}
		
		con.close();
		return list;
	}
}
