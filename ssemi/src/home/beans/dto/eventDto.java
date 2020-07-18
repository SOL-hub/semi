package home.beans.dto;

import java.sql.ResultSet;
import java.sql.SQLException;

public class eventDto {

	private int event_no, event_read , event_writer;
	private String event_head, event_title, event_content, event_date;
	public eventDto() {
		super();
	}
	
	//ResultSet 을 eventDto로 변환하는 생성자
	public eventDto(ResultSet rs)throws SQLException{
		this.setEvent_no(rs.getInt("event_no"));
		this.setEvent_head(rs.getString("event_head"));
		this.setEvent_title(rs.getString("event_title"));
		this.setEvent_writer(rs.getInt("event_writer"));
		this.setEvent_content(rs.getString("event_content"));
		this.setEvent_date(rs.getString("event_date"));
		this.setEvent_read(rs.getInt("event_read"));
	}
	
	
	public int getEvent_no() {
		return event_no;
	}
	public void setEvent_no(int event_no) {
		this.event_no = event_no;
	}
	public int getEvent_read() {
		return event_read;
	}
	public void setEvent_read(int event_read) {
		this.event_read = event_read;
	}
	public String getEvent_head() {
		return event_head;
	}
	public void setEvent_head(String event_head) {
		this.event_head = event_head;
	}
	public String getEvent_title() {
		return event_title;
	}
	public void setEvent_title(String event_title) {
		this.event_title = event_title;
	}
	
	public int getEvent_writer() {
		return event_writer;
	}

	public void setEvent_writer(int event_writer) {
		this.event_writer = event_writer;
	}

	public String getEvent_content() {
		return event_content;
	}
	public void setEvent_content(String event_content) {
		this.event_content = event_content;
	}
	public String getEvent_date() {
		return event_date;
	}
	public void setEvent_date(String event_date) {
		this.event_date = event_date;
	}
	
}
	
	