package home.beans.dto;

import java.sql.ResultSet;
import java.sql.SQLException;

public class WishDto {
	int wish_no;
	int wish_item_name;
	int wish_member;
	String wish_date;
	
	public WishDto() {
		super();
	}
	
	public WishDto(ResultSet rs) throws SQLException{
		
		this.setWish_no(rs.getInt("wish_no"));
		this.setWish_item_name(rs.getInt("wish_item_name"));
		this.setWish_member(rs.getInt("wish_member"));
		this.setWish_date(rs.getString("wish_date"));
		
	}
	
	public int getWish_no() {
		return wish_no;
	}

	public void setWish_no(int wish_no) {
		this.wish_no = wish_no;
	}

	public int getWish_item_name() {
		return wish_item_name;
	}

	public void setWish_item_name(int wish_item_name) {
		this.wish_item_name = wish_item_name;
	}

	public int getWish_member() {
		return wish_member;
	}

	public void setWish_member(int wish_member) {
		this.wish_member = wish_member;
	}

	public String getWish_date() {
		return wish_date;
	}

	public void setWish_date(String wish_date) {
		this.wish_date = wish_date;
	}
	
	
}
