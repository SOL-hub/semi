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

import home.beans.dto.EstimateDto;
import home.beans.dto.LivingDto;


public class LivingDao {

// 연결
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
		public void save(LivingDto ldto) throws Exception {	
				Connection con = getConnection();
				
					
				//아래와 같이 작성하면 미 작성된 항목들은 default 값이 적용
				String sql = "INSERT INTO living VALUES(living_seq.nextval,?, ?, ?, ?, ?, ?, sysdate,?)";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, ldto.getLiving_title());
				ps.setInt(2, ldto.getLiving_price());
				ps.setString(3, ldto.getLiving_type());
				ps.setString(4, ldto.getLiving_pattern());
				ps.setString(5, ldto.getLiving_color());
				ps.setString(6, ldto.getLiving_brand());
				ps.setString(7, ldto.getLiving_member());
			
				ps.execute();
				
				con.close();
			}

		
	// 견적서 리스트 조회 메소드
			public List<LivingDto> getList(String living_member) throws Exception{
				Connection con = getConnection();//연결 시작
				
				String sql = "SELECT * FROM living where living_member =? ORDER BY living_no ASC";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, living_member);
				ResultSet rs = ps.executeQuery();
				
				List<LivingDto> list = new ArrayList<>();//비어있는 List 준비
				while(rs.next()) {//데이터 개수만큼 반복
					LivingDto ldto = new LivingDto(rs);// 객체 준비
					list.add(ldto);//객체를 리스트에 추가
				}
				
				con.close();//연결 종료
				return list;
			}
			
	// 견적서 단일 조회 메소드
			public LivingDto get(int living_no) throws Exception {
				Connection con = getConnection();
				
				String sql = "SELECT * FROM living WHERE living_no = ?";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setInt(1, living_no);
				ResultSet rs = ps.executeQuery();

				LivingDto ldto = rs.next() ? new LivingDto(rs) : null;//3항 연산자
				
				con.close();
				
				return ldto;
			}
			
	// 견적서 삭제
			public void delete(int living_no) throws Exception {
				Connection con = getConnection();

				String sql = "DELETE living WHERE living_no = ?";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setInt(1, living_no);
				ps.execute();
				
				con.close();
			}

	
			//목록 메소드
			public List<LivingDto> getList() throws Exception{
				Connection con = getConnection();
				
				String sql = "SELECT * FROM living ORDER BY living_no DESC";
			
				PreparedStatement ps = con.prepareStatement(sql);

				ResultSet rs = ps.executeQuery();
				
				List<LivingDto> list = new ArrayList<>();
				while(rs.next()) {
					LivingDto ldto = new LivingDto(rs);
					list.add(ldto);
				}
				
				con.close();
				return list;
			}
}