package home.servlet.estimate;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import home.beans.dao.KitDao;

@WebServlet(urlPatterns = "/estimate/kitdelete.do")
public class KitDeleteServlet  extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			int kit_no = Integer.parseInt(req.getParameter("kit_no"));
			
			KitDao kdao = new KitDao ();
			kdao.delete(kit_no);//삭제
			
//			출력 : list.jsp로 redirect
			resp.sendRedirect("kit-list.jsp");
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}








