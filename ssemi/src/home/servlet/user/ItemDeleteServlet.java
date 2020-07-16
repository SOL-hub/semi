package home.servlet.user;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import home.beans.dao.ItemDao;

@WebServlet(urlPatterns = "/shop/delete.do")
public class ItemDeleteServlet extends HttpServlet{
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		try {
			int item_no = Integer.parseInt(req.getParameter("item_no"));


			ItemDao idao = new ItemDao();
			idao.delete(item_no);


			resp.sendRedirect("allist.jsp");
			
	}
		catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}

}