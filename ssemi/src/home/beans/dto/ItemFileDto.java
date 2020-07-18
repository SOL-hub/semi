package home.beans.dto;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ItemFileDto {
	private int item_file_no;
	private String item_file_name;
	private String item_file_type;
	private long item_file_size;
	private int item_origin;
	
	public ItemFileDto() {
		super();
	}
	
	public ItemFileDto(ResultSet rs) throws SQLException{
		this.setItem_file_no(rs.getInt("item_file_no"));
		this.setItem_file_name(rs.getString("item_file_name"));
		this.setItem_file_type(rs.getString("item_file_type"));
		this.setItem_file_size(rs.getInt("item_file_size"));
		this.setItem_origin(rs.getInt("item_origin"));
	}
	
	public int getItem_file_no() {
		return item_file_no;
	}

	public void setItem_file_no(int item_file_no) {
		this.item_file_no = item_file_no;
	}

	public String getItem_file_name() {
		return item_file_name;
	}

	public void setItem_file_name(String item_file_name) {
		this.item_file_name = item_file_name;
	}

	public String getItem_file_type() {
		return item_file_type;
	}

	public void setItem_file_type(String item_file_type) {
		this.item_file_type = item_file_type;
	}

	public long getItem_file_size() {
		return item_file_size;
	}

	public void setItem_file_size(long item_file_size) {
		this.item_file_size = item_file_size;
	}

	public int getItem_origin() {
		return item_origin;
	}

	public void setItem_origin(int item_origin) {
		this.item_origin = item_origin;
	}
	
	
}
