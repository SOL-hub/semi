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
import home.beans.dto.KitDto;

public class KitDao {

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
		public void save(KitDto kdto) throws Exception {	
				Connection con = getConnection();
				
					
				//아래와 같이 작성하면 미 작성된 항목들은 default 값이 적용
				String sql = "INSERT INTO kit VALUES(kit_seq.nextval, ?, ?, ?, ?, ?, ?, ?,?, sysdate,?)";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, kdto.getKit_title());
				ps.setInt(2, kdto.getKit_price());
				ps.setString(3, kdto.getKit_shape());
				ps.setString(4, kdto.getKit_sinksize());
				ps.setString(5, kdto.getKit_toptype());
				ps.setString(6, kdto.getKit_walltype());
				ps.setString(7, kdto.getKit_tile());
				ps.setString(8, kdto.getKit_option());
				ps.setString(9, kdto.getKit_member());
			 
				ps.execute();
				
				con.close();
			}

		
	// 견적서 리스트 조회 메소드
			public List<KitDto> getList(String kit_member) throws Exception{
				Connection con = getConnection();//연결 시작
				
				String sql = "SELECT * FROM kit where kit_member =? ORDER BY kit_no ASC";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, kit_member);
				ResultSet rs = ps.executeQuery();
				
				List<KitDto> list = new ArrayList<>();//비어있는 List 준비
				while(rs.next()) {//데이터 개수만큼 반복
					KitDto kdto = new KitDto(rs);// 객체 준비
					list.add(kdto);//객체를 리스트에 추가
				}
				
				con.close();//연결 종료
				return list;
			}
			
	// 견적서 단일 조회 메소드
			public KitDto get(int kit_no) throws Exception {
				Connection con = getConnection();
				
				String sql = "SELECT * FROM kit WHERE kit_no = ?";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setInt(1, kit_no);
				ResultSet rs = ps.executeQuery();

				KitDto kdto = rs.next() ? new KitDto(rs) : null;//3항 연산자
				
				con.close();
				
				return kdto;
			}
			
	// 견적서 삭제
			public void delete(int kit_no) throws Exception {
				Connection con = getConnection();

				String sql = "DELETE kit WHERE kit_no = ?";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setInt(1, kit_no);
				ps.execute();
				
				con.close();
			}
			
			//목록 메소드
			public List<KitDto> getList() throws Exception{
				Connection con = getConnection();
				
				String sql = "SELECT * FROM kit ORDER BY kit_no DESC";
			
				PreparedStatement ps = con.prepareStatement(sql);

				ResultSet rs = ps.executeQuery();
				
				List<KitDto> list = new ArrayList<>();
				while(rs.next()) {
					KitDto kdto = new KitDto(rs);
					list.add(kdto);
				}
				
				con.close();
				return list;
			}
	

}