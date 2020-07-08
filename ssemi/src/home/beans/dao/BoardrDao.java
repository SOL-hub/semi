package home.beans.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import home.beans.dto.BoardDto;

public List<BoardDto> search(String type, String keyword, int start, int finish) throws Exception{
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
	
	List<BoardDto> list = new ArrayList<>();
	while(rs.next()) {
		BoardDto bdto = new BoardDto(rs);
		list.add(bdto);
	}
	
	con.close();
	return list;
}
