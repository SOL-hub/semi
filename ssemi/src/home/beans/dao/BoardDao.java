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

	public List<BoardDto> search(String type, String keyword, int start, int finish) throws Exception {
		Connection con = getConnection();

		String sql = "SELECT * FROM(SELECT ROWNUM rn, T.*FROM("
				+ "SELECT*FROM board WHERE instr(#1, ?) > 0 CONNECT BY PRIOR board_no=super_no "
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

}
