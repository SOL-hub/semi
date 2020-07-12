package home.beans.dto;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CartDto {
	int cart_no;
	int cart_item_name;
	int cart_cnt;
	int cart_total_price;
	int cart_member;
	
	
	public CartDto() {
		super();
	}
	
	public CartDto(ResultSet rs) throws SQLException{
		this.setCart_no(rs.getInt("cart_no"));
		this.setCart_item_name(rs.getInt("cart_item_name"));
		this.setCart_cnt(rs.getInt("cart_cnt"));
		this.setCart_total_price(rs.getInt("cart_total_price"));
		this.setCart_member(rs.getInt("cart_member"));
		
	}
	
	public int getCart_no() {
		return cart_no;
	}

	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}


	public int getCart_cnt() {
		return cart_cnt;
	}

	public void setCart_cnt(int cart_cnt) {
		this.cart_cnt = cart_cnt;
	}

	public int getCart_total_price() {
		return cart_total_price;
	}

	public void setCart_total_price(int cart_total_price) {
		this.cart_total_price = cart_total_price;
	}

	public int getCart_member() {
		return cart_member;
	}

	public void setCart_member(int cart_member) {
		this.cart_member = cart_member;
	}

	public int getCart_item_name() {
		return cart_item_name;
	}

	public void setCart_item_name(int cart_item_name) {
		this.cart_item_name = cart_item_name;
	}

	

	
	
	
}
