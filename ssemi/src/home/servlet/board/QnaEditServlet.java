package home.servlet.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import home.beans.dao.QnaDao;
import home.beans.dto.QnaDto;


@WebServlet(urlPatterns="/board/QnaEdit.do")
public class QnaEditServlet extends HttpServlet {
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	try {
		req.setCharacterEncoding("UTF-8");

	// 입력 : qna_title , qna_content
	QnaDto qdto = new QnaDto();
	qdto.setQna_no(Integer.parseInt(req.getParameter("qna_no")));
	qdto.setQna_title(req.getParameter("qna_title"));
	qdto.setQna_content(req.getParameter("qna_content"));
	
	QnaDao qdao = new QnaDao();
	qdao.edit(qdto);
	
	resp.sendRedirect("Qna_content.jsp?qna_no="+qdto.getQna_no());
}
catch (Exception e) {
	e.printStackTrace();
	resp.sendError(500);
}
}

}
