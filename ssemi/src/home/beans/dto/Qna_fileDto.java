package home.beans.dto;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Qna_fileDto {
private int qna_file_no;
private int qna_file_origin;
private String qna_file_name;
private long qna_file_size;
private String qna_file_type;

public Qna_fileDto(ResultSet rs) throws SQLException {
	this.setQna_file_no(rs.getInt("qna_file_no"));
	this.setQna_file_name(rs.getString("qna_file_name"));
	this.setQna_file_origin(rs.getInt("qna_file_origin"));
	this.setQna_file_size(rs.getInt("qna_file_size"));
	this.setQna_file_type(rs.getString("qna_file_type"));
}

public int getQna_file_no() {
	return qna_file_no;
}
public void setQna_file_no(int qna_file_no) {
	this.qna_file_no = qna_file_no;
}
public int getQna_file_origin() {
	return qna_file_origin;
}
public void setQna_file_origin(int qna_file_origin) {
	this.qna_file_origin = qna_file_origin;
}
public String getQna_file_name() {
	return qna_file_name;
}
public void setQna_file_name(String qna_file_name) {
	this.qna_file_name = qna_file_name;
}
public long getQna_file_size() {
	return qna_file_size;
}
public void setQna_file_size(long qna_file_size) {
	this.qna_file_size = qna_file_size;
}
public String getQna_file_type() {
	return qna_file_type;
}
public void setQna_file_type(String qna_file_type) {
	this.qna_file_type = qna_file_type;
}
public Qna_fileDto() {

}

}
