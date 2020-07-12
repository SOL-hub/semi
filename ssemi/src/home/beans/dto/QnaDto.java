package home.beans.dto;

import java.sql.ResultSet;
import java.sql.SQLException;

public class QnaDto {
	private int qna_no;
	private int qna_writer;

	private String qna_title;
	private String qna_content;
	private String qna_date;
	private String qna_modify_date;
//	private int super_no;
//	private int group_no;
//	private int depth;
//	private int qna_replyCount;


//	public int getQna_replyCount() {
//		return qna_replyCount;
//	}

//	public void setQna_replyCount(int qna_replyCount) {
//		this.qna_replyCount = qna_replyCount;
//	}

	public QnaDto(ResultSet rs) throws SQLException {
		this.setQna_no(rs.getInt("qna_no"));
		this.setQna_writer(rs.getInt("qna_writer"));
		this.setQna_title(rs.getString("qna_title"));
		this.setQna_content(rs.getString("qna_content"));
		this.setQna_date(rs.getString("qna_date"));
		this.setQna_modify_date(rs.getString("qna_modify_date"));
		
//		this.setSuper_no(rs.getInt("super_no"));
//		this.setGroup_no(rs.getInt("group_no"));
//		this.setDepth(rs.getInt("depth"));
//		this.setQna_replyCount(rs.getInt("qna_replyCount"));

	}
	
	public int getQna_no() {
		return qna_no;
	}
	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}
	public int getQna_writer() {
		return qna_writer;
	}
	
	public void setQna_writer(int qna_writer) {
		this.qna_writer = qna_writer;
	}

	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public String getQna_date() {
		return qna_date;
	}
	public void setQna_date(String qna_date) {
		this.qna_date = qna_date;
	}
	public String getQna_modify_date() {
		return qna_modify_date;
	}
	public void setQna_modify_date(String qna_modify_date) {
		this.qna_modify_date = qna_modify_date;
	}
//	public int getSuper_no() {
//		return super_no;
//	}
//	public void setSuper_no(int super_no) {
//		this.super_no = super_no;
//	}
//	public int getGroup_no() {
//		return group_no;
//	}
//	public void setGroup_no(int group_no) {
//		this.group_no = group_no;
//	}
//	public int getDepth() {
//		return depth;
//	}
//	public void setDepth(int depth) {
//		this.depth = depth;
//	}

	public QnaDto() {
		super();

	}
	
}