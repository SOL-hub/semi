package home.beans.dto;

import java.sql.ResultSet;
import java.sql.SQLException;

public class LivingDto {

	private int living_no, living_price;
	private String living_title, living_type, living_pattern, living_color, living_brand, living_date, living_member;
	
	 public LivingDto(ResultSet rs) throws SQLException{
		   
		  this.setLiving_title(rs.getString("living_title"));
	      this.setLiving_no(rs.getInt("living_no"));
	      this.setLiving_price(rs.getInt("living_price"));
	      this.setLiving_type(rs.getString("living_type"));
	      this.setLiving_pattern(rs.getString("living_pattern"));
	      this.setLiving_color(rs.getString("living_color"));
	      this.setLiving_brand(rs.getString("living_brand"));
	      this.setLiving_date(rs.getString("living_date"));
	      this.setLiving_member(rs.getString("living_member"));
	   }
	
	
	 public String getLiving_title() {
		return living_title;
	}

	public void setLiving_title(String living_title) {
		this.living_title = living_title;
	}


	public LivingDto() {
	      super();
	   }
	 
	 
	public int getLiving_no() {
		return living_no;
	}
	public void setLiving_no(int living_no) {
		this.living_no = living_no;
	}
	public int getLiving_price() {
		return living_price;
	}
	public void setLiving_price(int living_price) {
		this.living_price = living_price;
	}
	public String getLiving_type() {
		return living_type;
	}
	public void setLiving_type(String living_type) {
		this.living_type = living_type;
	}
	public String getLiving_pattern() {
		return living_pattern;
	}
	public void setLiving_pattern(String living_pattern) {
		this.living_pattern = living_pattern;
	}
	public String getLiving_color() {
		return living_color;
	}
	public void setLiving_color(String living_color) {
		this.living_color = living_color;
	}
	public String getLiving_brand() {
		return living_brand;
	}
	public void setLiving_brand(String living_brand) {
		this.living_brand = living_brand;
	}
	public String getLiving_date() {
		return living_date;
	}
	public void setLiving_date(String living_date) {
		this.living_date = living_date;
	}
	public String getLiving_member() {
		return living_member;
	}
	public void setLiving_member(String living_member) {
		this.living_member = living_member;
	} 

	
}