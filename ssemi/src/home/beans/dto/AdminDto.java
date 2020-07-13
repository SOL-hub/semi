package home.beans.dto;

import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDto {
	
	
	private int admin_no ;
	private String admin_id ;
	private String admin_pw;
	private String admin_join;
	private String admin_login;
	private String admin_auth ;
	public AdminDto() {
		
	}
	
	public AdminDto(ResultSet rs) throws SQLException {
		this.setAdmin_no(rs.getInt("admin_no"));
		this.setAdmin_id(rs.getString("admin_id"));
		this.setAdmin_pw(rs.getString("admin_pw"));
		this.setAdmin_join(rs.getString("admin_join"));
		this.setAdmin_login(rs.getString("admin_login"));
		this.setAdmin_auth(rs.getString("admin_auth"));
		
	}
	public int getAdmin_no() {
		return admin_no;
	}
	public void setAdmin_no(int admin_no) {
		this.admin_no = admin_no;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_pw() {
		return admin_pw;
	}
	public void setAdmin_pw(String admin_pw) {
		this.admin_pw = admin_pw;
	}
	public String getAdmin_join() {
		return admin_join;
	}
	public void setAdmin_join(String admin_join) {
		this.admin_join = admin_join;
	}
	public String getAdmin_login() {
		return admin_login;
	}
	public void setAdmin_login(String admin_login) {
		this.admin_login = admin_login;
	}
	public String getAdmin_auth() {
		return admin_auth;
	}
	public void setAdmin_auth(String admin_auth) {
		this.admin_auth = admin_auth;
	}
	
	
}
