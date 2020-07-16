package home.beans.dto;

import java.sql.ResultSet;
import java.sql.SQLException;

public class KitDto {
	private int kit_no, kit_price;
	private String kit_shape, kit_sinksize, kit_toptype, kit_walltype, kit_tile, kit_option, kit_date, kit_member;

	
	
	public String getKit_tile() {
		return kit_tile;
	}
	public void setKit_tile(String kit_tile) {
		this.kit_tile = kit_tile;
	}
	public int getKit_no() {
		return kit_no;
	}
	public void setKit_no(int kit_no) {
		this.kit_no = kit_no;
	}
	public int getKit_price() {
		return kit_price;
	}
	public void setKit_price(int kit_price) {
		this.kit_price = kit_price;
	}
	public String getKit_shape() {
		return kit_shape;
	}
	public void setKit_shape(String kit_shape) {
		this.kit_shape = kit_shape;
	}
	public String getKit_sinksize() {
		return kit_sinksize;
	}
	public void setKit_sinksize(String kit_sinksize) {
		this.kit_sinksize = kit_sinksize;
	}
	public String getKit_toptype() {
		return kit_toptype;
	}
	public void setKit_toptype(String kit_toptype) {
		this.kit_toptype = kit_toptype;
	}
	public String getKit_walltype() {
		return kit_walltype;
	}
	public void setKit_walltype(String kit_walltype) {
		this.kit_walltype = kit_walltype;
	}
	
	public String getKit_option() {
		return kit_option;
	}
	public void setKit_option(String kit_option) {
		this.kit_option = kit_option;
	}
	public String getKit_date() {
		return kit_date;
	}
	public void setKit_date(String kit_date) {
		this.kit_date = kit_date;
	}
	public String getKit_member() {
		return kit_member;
	}
	public void setKit_member(String kit_member) {
		this.kit_member = kit_member;
	}
	
	public KitDto(ResultSet rs) throws SQLException{
		   
	      this.setKit_no(rs.getInt("kit_no"));
	      this.setKit_price(rs.getInt("kit_price"));
	      this.setKit_shape(rs.getString("kit_shape"));
	      this.setKit_sinksize(rs.getString("kit_sinksize"));
	      this.setKit_toptype(rs.getString("kit_toptype"));
	      this.setKit_walltype(rs.getString("kit_walltype"));
	      this.setKit_tile(rs.getString("kit_tile"));
	      this.setKit_date(rs.getString("kit_date"));
	      this.setKit_member(rs.getString("kit_member"));
	   }
	
	
	

}