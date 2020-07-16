package home.beans.dto;

import java.sql.ResultSet;
import java.sql.SQLException;

public class shoppingDto {
	
	private int shopping_no; 
	private String shopping_date ;
	private String shopping_statue;
	private String shopping_payment;
	private int shopping_total_price;
	private int shopping_disc;
	private String shopping_period;
	private String shopping_service ;
	
	public shoppingDto() {
		
	}
	
	public shoppingDto(ResultSet rs) throws SQLException {
		
		this.setShopping_no(rs.getInt("shopping_no"));
		this.setShopping_date(rs.getString("shopping_date"));
		this.setShopping_statue(rs.getString("shopping_satue"));
		this.setShopping_payment(rs.getString("shopping_payment"));
		this.setShopping_total_price(rs.getInt("shopping_total_price"));
		this.setShopping_disc(rs.getInt("shopping_disc"));
		this.setShopping_period(rs.getString("shopping_period"));
		this.setShopping_service(rs.getString("shopping_service"));
		
	}

	public int getShopping_no() {
		return shopping_no;
	}

	public void setShopping_no(int shopping_no) {
		this.shopping_no = shopping_no;
	}

	public String getShopping_date() {
		return shopping_date;
	}

	public void setShopping_date(String shopping_date) {
		this.shopping_date = shopping_date;
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

	public int getShopping_total_price() {
		return shopping_total_price;
	}

	public void setShopping_total_price(int shopping_total_price) {
		this.shopping_total_price = shopping_total_price;
	}

	public int getShopping_disc() {
		return shopping_disc;
	}

	public void setShopping_disc(int shopping_disc) {
		this.shopping_disc = shopping_disc;
	}

	public String getShopping_period() {
		return shopping_period;
	}

	public void setShopping_period(String shopping_period) {
		this.shopping_period = shopping_period;
	}

	public String getShopping_service() {
		return shopping_service;
	}

	public void setShopping_service(String shopping_service) {
		this.shopping_service = shopping_service;
	}
	
	
	
	
	

}
