package home.servlet.estimate;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import home.beans.dao.EstimateDao;
import home.beans.dao.LivingDao;

@WebServlet(urlPatterns = "/estimate/livingdelete.do")
public class LivingDeleteServlet  extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			int living_no = Integer.parseInt(req.getParameter("living_no"));
			
			LivingDao ldao = new LivingDao ();
			ldao.delete(living_no);//삭제
			
//			출력 : list.jsp로 redirect
			resp.sendRedirect("living-list.jsp");
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}








