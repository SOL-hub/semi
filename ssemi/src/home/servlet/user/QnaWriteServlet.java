package home.servlet.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import home.beans.dao.QnaDao;
import home.beans.dto.MemberDto;
import home.beans.dto.QnaDto;

@WebServlet(urlPatterns="/qna/write.do")
public class QnaWriteServlet extends HttpServlet{
@Override
protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
try {
	// 게시글 등록 -> 상세페이지 이동
	// 준비 : 제목, 내용, 작성자(session)
	
	MemberDto mdto = (MemberDto) req.getSession().getAttribute("userinfo");
	// int member_no = mdto.getMember_no();
	 String member_id = mdto.getMember_id();
	
	QnaDto qdto = new QnaDto();
	qdto.setQna_title(req.getParameter("qna_title"));
	qdto.setQna_content(req.getParameter("qna_content"));
	mdto.setMember_id("qna_writer");
	
	QnaDao qdao = new QnaDao();
	int qna_no = qdao.getSequence();
	qdto.setQna_no(qna_no);
	qdao.write(qdto);
	
	resp.sendRedirect("Qna_content.jsp?qna_no="+qna_no);
		
}
catch(Exception e) {
	e.printStackTrace();
	resp.sendError(500);
}
	
	
}
	
}
