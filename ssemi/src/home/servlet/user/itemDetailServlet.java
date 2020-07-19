package home.servlet.user;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import home.beans.dao.ItemDao;
import home.beans.dto.ItemDto;
@WebServlet("/shop/product_detail.do")
public class itemDetailServlet extends HttpServlet{
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		try {
			req.setCharacterEncoding("UTF-8");
			int item_no = Integer.parseInt(req.getParameter("item_no"));
			
			ItemDao idao = new ItemDao();
			ItemDto idto = idao.item_get(item_no);
			
			req.getSession().setAttribute("iteminfo", idto);
			resp.sendRedirect("product_detail2.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
