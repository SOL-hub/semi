package home.beans.dto;

import java.sql.ResultSet;
import java.sql.SQLException;

public class eventDto {
	
	private int event1_no, event1_read;
	private String event1_title, event1_writer, event1_content, event1_date;
	public eventDto() {
		super();
	}
	
	
	//ResultSet 을 eventDto로 변환하는 생성자
	public eventDto(ResultSet rs) throws SQLException{
		this.setEvent1_no(rs.getInt("event1_no"));
		this.setEvent1_title(rs.getString("event1_title"));
		this.setEvent1_writer(rs.getString("event1_writer"));
		this.setEvent1_content(rs.getString("event1_content"));
		this.setEvent1_date(rs.getString("event1_date"));
		this.setEvent1_read(rs.getInt("evnet1_read"));
	}
	
	
	
	public int getEvent1_no() {
		return event1_no;
	}
	public void setEvent1_no(int event1_no) {
		this.event1_no = event1_no;
	}
	public int getEvent1_read() {
		return event1_read;
	}
	public void setEvent1_read(int event1_read) {
		this.event1_read = event1_read;
	}
	public String getEvent1_title() {
		return event1_title;
	}
	public void setEvent1_title(String event1_title) {
		this.event1_title = event1_title;
	}
	public String getEvent1_writer() {
		return event1_writer;
	}
	public void setEvent1_writer(String event1_writer) {
		this.event1_writer = event1_writer;
	}
	public String getEvent1_content() {
		return event1_content;
	}
	public void setEvent1_content(String event1_content) {
		this.event1_content = event1_content;
	}
	public String getEvent1_date() {
		return event1_date;
	}
	public void setEvent1_date(String event1_date) {
		this.event1_date = event1_date;
	}
	
	
}
