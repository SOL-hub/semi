package home.beans.dto;

import java.sql.ResultSet;
import java.sql.SQLException;

public class shoppingDto {

	private int shopping_no;
	private int shopping_member;
	private String shopping_recive_name;
	private String shopping_recive_phone;
	private String shopping_recive_post;
	private String shopping_recive_base_addr;
	private String shopping_recive_extra_addr;
	private String shopping_recive_content;
	private int shopping_item_name;
	private int shopping_item_cnt;
	private String shopping_statue;
	private String shopping_payment;
	private String shopping_paybank;
	private String shopping_paybank_num;
	private int shopping_total;
	private int shopping_disc;
	private String shopping_date;

	
	public shoppingDto() {
		
	}

	public shoppingDto(ResultSet rs) throws SQLException {

		this.setShopping_no(rs.getInt("shopping_no"));
		this.setShopping_member(rs.getInt("shopping_member"));
		this.setShopping_recive_name(rs.getString("shopping_recive_name"));
		this.setShopping_recive_phone(rs.getString("shopping_recive_phone"));
		this.setShopping_recive_post(rs.getString("shopping_recive_post"));
		this.setShopping_recive_base_addr(rs.getString("shopping_recive_base_addr"));
		this.setShopping_recive_extra_addr(rs.getString("shopping_recive_extra_addr"));
		this.setShopping_recive_content(rs.getString("shopping_recive_content"));
		this.setShopping_item_name(rs.getInt("shopping_item_name"));
		this.setShopping_item_cnt(rs.getInt("shopping_item_cnt"));
		this.setShopping_statue(rs.getString("shopping_statue"));
		this.setShopping_payment(rs.getString("shopping_payment"));
		this.setShopping_paybank(rs.getString("shopping_paybank"));
		this.setShopping_paybank_num(rs.getString("shopping_paybank_num"));
		this.setShopping_total(rs.getInt("shopping_total"));
		this.setShopping_disc(rs.getInt("shopping_disc"));
		this.setShopping_date(rs.getString("shopping_date"));

	}

	public int getShopping_no() {
		return shopping_no;
	}

	public void setShopping_no(int shopping_no) {
		this.shopping_no = shopping_no;
	}

	public int getShopping_member() {
		return shopping_member;
	}

	public void setShopping_member(int shopping_member) {
		this.shopping_member = shopping_member;
	}

	public String getShopping_recive_name() {
		return shopping_recive_name;
	}

	public void setShopping_recive_name(String shopping_recive_name) {
		this.shopping_recive_name = shopping_recive_name;
	}

	public String getShopping_recive_phone() {
		return shopping_recive_phone;
	}

	public void setShopping_recive_phone(String shopping_recive_phone) {
		this.shopping_recive_phone = shopping_recive_phone;
	}

	public String getShopping_recive_post() {
		return shopping_recive_post;
	}

	public void setShopping_recive_post(String shopping_recive_post) {
		this.shopping_recive_post = shopping_recive_post;
	}

	public String getShopping_recive_base_addr() {
		return shopping_recive_base_addr;
	}

	public void setShopping_recive_base_addr(String shopping_recive_base_addr) {
		this.shopping_recive_base_addr = shopping_recive_base_addr;
	}

	public String getShopping_recive_extra_addr() {
		return shopping_recive_extra_addr;
	}

	public void setShopping_recive_extra_addr(String shopping_recive_extra_addr) {
		this.shopping_recive_extra_addr = shopping_recive_extra_addr;
	}

	public String getShopping_recive_content() {
		return shopping_recive_content;
	}

	public void setShopping_recive_content(String shopping_recive_content) {
		this.shopping_recive_content = shopping_recive_content;
	}

	public int getShopping_item_name() {
		return shopping_item_name;
	}

	public void setShopping_item_name(int shopping_item_name) {
		this.shopping_item_name = shopping_item_name;
	}

	public int getShopping_item_cnt() {
		return shopping_item_cnt;
	}

	public void setShopping_item_cnt(int shopping_item_cnt) {
		this.shopping_item_cnt = shopping_item_cnt;
	}

	public String getShopping_statue() {
		return shopping_statue;
	}

	public void setShopping_statue(String shopping_statue) {
		this.shopping_statue = shopping_statue;
	}

	public String getShopping_payment() {
		return shopping_payment;
	}

	public void setShopping_payment(String shopping_payment) {
		this.shopping_payment = shopping_payment;
	}

	public String getShopping_paybank() {
		return shopping_paybank;
	}

	public void setShopping_paybank(String shopping_paybank) {
		this.shopping_paybank = shopping_paybank;
	}

	public String getShopping_paybank_num() {
		return shopping_paybank_num;
	}

	public void setShopping_paybank_num(String shopping_paybank_num) {
		this.shopping_paybank_num = shopping_paybank_num;
	}

	public int getShopping_total() {
		return shopping_total;
	}

	public void setShopping_total(int shopping_total) {
		this.shopping_total = shopping_total;
	}

	public int getShopping_disc() {
		return shopping_disc;
	}

	public void setShopping_disc(int shopping_disc) {
		this.shopping_disc = shopping_disc;
	}

	public String getShopping_date() {
		return shopping_date;
	}

	public void setShopping_date(String shopping_date) {
		this.shopping_date = shopping_date;
	}

}
