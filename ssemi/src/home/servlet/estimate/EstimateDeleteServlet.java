package home.servlet.estimate;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import home.beans.dao.EstimateDao;

@WebServlet(urlPatterns = "/estimate/delete.do")
public class EstimateDeleteServlet  extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			int bath_no = Integer.parseInt(req.getParameter("bath_no"));
			
			EstimateDao edao = new EstimateDao ();
			edao.delete(bath_no);//삭제
			
//			출력 : list.jsp로 redirect
			resp.sendRedirect("bath-list.jsp");
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}








