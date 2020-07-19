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

import home.beans.dto.BoardDto;
import home.beans.dto.EstimateDto;

public class EstimateDao {

	private static DataSource src;

	static {
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

	
	
// 견적서 저장
	public void save(EstimateDto edto) throws Exception {	
			Connection con = getConnection();
			
				
			//아래와 같이 작성하면 미 작성된 항목들은 default 값이 적용
			String sql = "INSERT INTO bath VALUES(bath_seq.nextval, ?, ?, ?, ?, ?, ?, ?, sysdate,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, edto.getBath_title());
			ps.setInt(2, edto.getBath_price());
			ps.setString(3, edto.getBath_cnt());
			ps.setString(4, edto.getBath_cntt());
			ps.setString(5, edto.getBath_tub());
			ps.setString(6, edto.getBath_tile());
			ps.setString(7, edto.getBath_option());
			ps.setString(8, edto.getBath_member());
		 
			ps.execute();
			
			con.close();
		}

	
// 견적서 리스트 조회 메소드
		public List<EstimateDto> getList(String bath_member) throws Exception{
			Connection con = getConnection();//연결 시작
			
			String sql = "SELECT * FROM bath where bath_member =? ORDER BY bath_no ASC";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, bath_member);
			ResultSet rs = ps.executeQuery();
			
			List<EstimateDto> list = new ArrayList<>();//비어있는 List 준비
			while(rs.next()) {//데이터 개수만큼 반복
				EstimateDto edto = new EstimateDto(rs);// 객체 준비
				list.add(edto);//객체를 리스트에 추가
			}
			
			con.close();//연결 종료
			return list;
		}
		
// 견적서 단일 조회 메소드
		public EstimateDto get(int bath_no) throws Exception {
			Connection con = getConnection();
			
			String sql = "SELECT * FROM bath WHERE bath_no = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, bath_no);
			ResultSet rs = ps.executeQuery();

			EstimateDto edto = rs.next() ? new EstimateDto(rs) : null;//3항 연산자
			
			con.close();
			
			return edto;
		}
		
// 견적서 삭제
		public void delete(int bath_no) throws Exception {
			Connection con = getConnection();

			String sql = "DELETE bath WHERE bath_no = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, bath_no);
			ps.execute();
			
			con.close();
		}


		//목록 메소드
		public List<EstimateDto> getList() throws Exception{
			Connection con = getConnection();
			
			String sql = "SELECT * FROM bath ORDER BY bath_no DESC";
		
			PreparedStatement ps = con.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			
			List<EstimateDto> list = new ArrayList<>();
			while(rs.next()) {
	EstimateDto edto = new EstimateDto(rs);
				list.add(edto);
			}
			
			con.close();
			return list;
		}
		
	
}