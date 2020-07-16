package home.servlet.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import home.beans.dao.QnaDao;

@WebServlet (urlPatterns="/board/Qna_delete.do")
public class QnaDeleteServlet  extends HttpServlet{
@Override
protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
try {
	//	입력 : qna_no
	int qna_no = Integer.parseInt(req.getParameter("qna_no"));
	//	처리 : 삭제
	QnaDao qdao = new QnaDao();
	qdao.delete(qna_no);
	
	//출력
	resp.sendRedirect("Qna_list.jsp");
	
}
catch (Exception e) {
	e.printStackTrace();
	resp.sendError(500);
}
	
}
}
