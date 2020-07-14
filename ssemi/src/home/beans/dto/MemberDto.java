package home.beans.dto;

import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDto {
	int member_no;
	String member_id;
	String member_pw;
	String member_name;
	String member_nick;
	String member_birth;
	String member_phone;
	String member_email;
	String member_post;
	String member_base_addr;
	String member_extra_addr;
	int member_point;
	String member_auth;
	String member_join;
	String member_login;
	String member_image;
	String member_consult_list;

	public MemberDto() {
		super();
	}

	public MemberDto(ResultSet rs) throws SQLException {

		this.setMember_no(rs.getInt("member_no"));
		this.setMember_id(rs.getString("member_id"));
		this.setMember_pw(rs.getString("member_pw"));
		this.setMember_name(rs.getString("member_name"));
		this.setMember_nick(rs.getString("member_nick"));
		this.setMember_birth(rs.getString("member_birth"));
		this.setMember_phone(rs.getString("member_phone"));
		this.setMember_email(rs.getString("member_email"));
		this.setMember_post(rs.getString("member_post"));
		this.setMember_base_addr(rs.getString("member_base_addr"));
		this.setMember_extra_addr(rs.getString("member_extra_addr"));
		this.setMember_point(rs.getInt("member_point"));
		this.setMember_auth(rs.getString("member_auth"));
		this.setMember_join(rs.getString("member_join"));
		this.setMember_login(rs.getString("member_login"));
		this.setMember_image(rs.getString("member_image"));
		this.setMember_consult_list(rs.getString("member_consult_list"));

	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_pw() {
		return member_pw;
	}

	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_nick() {
		return member_nick;
	}

	public void setMember_nick(String member_nick) {
		this.member_nick = member_nick;
	}

	public String getMember_birth() {
		return member_birth;
	}

	public void setMember_birth(String member_birth) {
		this.member_birth = member_birth;
	}

	public String getMember_phone() {
		return member_phone;
	}

	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getMember_post() {
		return member_post;
	}

	public void setMember_post(String member_post) {
		this.member_post = member_post;
	}

	public String getMember_base_addr() {
		return member_base_addr;
	}

	public void setMember_base_addr(String member_base_addr) {
		this.member_base_addr = member_base_addr;
	}

	public String getMember_extra_addr() {
		return member_extra_addr;
	}

	public void setMember_extra_addr(String member_extra_addr) {
		this.member_extra_addr = member_extra_addr;
	}

	public int getMember_point() {
		return member_point;
	}

	public void setMember_point(int member_point) {
		this.member_point = member_point;
	}

	public String getMember_auth() {
		return member_auth;
	}

	public void setMember_auth(String member_auth) {
		this.member_auth = member_auth;
	}

	public String getMember_join() {
		return member_join;
	}

	public void setMember_join(String member_join) {
		this.member_join = member_join;
	}

	public String getMember_login() {
		return member_login;
	}

	public void setMember_login(String member_login) {
		this.member_login = member_login;
	}

	public String getMember_image() {
		return member_image;
	}

	public void setMember_image(String member_image) {
		this.member_image = member_image;
	}

	public String getMember_consult_list() {
		return member_consult_list;
	}

	public void setMember_consult_list(String member_consult_list) {
		this.member_consult_list = member_consult_list;
	}

	// 멤버 생일이 년도만 나오게 하는 DTO -- 임새봄

	public String getMember_birth_day() {

		return member_birth.substring(0, 4);

	}
	
	// 멤버 생일이 시간 빼고 생년 월일만 나오게 하는 dto -- 임새봄 
	public String getMember_birth_year() {

		return member_birth.substring(0, 10);

	}


	// 멤버 생일로 나이를 구하는 DTO -- 임새봄
	public int getMember_age() {
		String a = getMember_birth_day();
		int b = Integer.parseInt(a);
		int age = 2020 - b + 1;
		return age;
	}

	// 가입 날짜만 보이게 하는 DTO -- 임새봄
	public String getMember_join_day() {
		return member_join.substring(0, 10);
	}
	
	

	public int getMember_no() {
		return member_no;
	}
}
