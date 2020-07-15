package home.beans.dto;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;


public class EstimateDto {
	private int bath_no, bath_price;
	private String bath_cnt, bath_cntt, bath_tub, bath_tile, bath_option, bath_date, bath_member;
	
	
	
	 public String getBath_member() {
		return bath_member;
	}
	public void setBath_member(String bath_member) {
		this.bath_member = bath_member;
	}
	public String getBath_date() {
		return bath_date;
	}
	public void setBath_date(String bath_date) {
		this.bath_date = bath_date;
	}
	public EstimateDto() {
	      super();
	   }
	 public EstimateDto(ResultSet rs) throws SQLException{
		   
	      this.setBath_no(rs.getInt("bath_no"));
	      this.setBath_price(rs.getInt("bath_price"));
	      this.setBath_cnt(rs.getString("bath_cnt"));
	      this.setBath_cntt(rs.getString("bath_cntt"));
	      this.setBath_tub(rs.getString("bath_tub"));
	      this.setBath_tile(rs.getString("bath_tile"));
	      this.setBath_option(rs.getString("bath_option"));
	      this.setBath_date(rs.getString("bath_date"));
	      this.setBath_member(rs.getString("bath_member"));
	   }

	 
	//메소드 2개를 추가
		//[1] getBath_time() : 시간을 반환하는 메소드
		//[2] getBath_day() : 날짜를 반환하는 메소드
		//[3] getBath_autotime() : 자동으로 오늘날짜에는 시간을, 아닌 경우는 날짜를 반환
		public String getBath_time() {
			return bath_date.substring(11, 16);
		}
		
		public String getBath_day() {
			return bath_date.substring(0, 10);
		}
		
		public String getBath_autotime() {

			String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
			if(getBath_day().equals(today)) {//오늘 작성한 글이라면
				return getBath_time();
			}
			else {//아니라면
				return getBath_day();
			}
		}
		
		
	 
	public int getBath_no() {
		return bath_no;
	}
	public void setBath_no(int bath_no) {
		this.bath_no = bath_no;
	}
	public int getBath_price() {
		return bath_price;
	}
	public void setBath_price(int bath_price) {
		this.bath_price = bath_price;
	}
	public String getBath_cnt() {
		return bath_cnt;
	}
	public void setBath_cnt(String bath_cnt) {
		this.bath_cnt = bath_cnt;
	}
	public String getBath_cntt() {
		return bath_cntt;
	}
	public void setBath_cntt(String bath_cntt) {
		this.bath_cntt = bath_cntt;
	}
	public String getBath_tub() {
		return bath_tub;
	}
	public void setBath_tub(String bath_tub) {
		this.bath_tub = bath_tub;
	}
	public String getBath_tile() {
		return bath_tile;
	}
	public void setBath_tile(String bath_tile) {
		this.bath_tile = bath_tile;
	}
	public String getBath_option() {
		return bath_option;
	}
	public void setBath_option(String bath_option) {
		this.bath_option = bath_option;
	}

	
	
	
}















	




