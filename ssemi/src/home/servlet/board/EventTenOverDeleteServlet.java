package home.servlet.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import home.beans.dao.eventDao;

@WebServlet(urlPatterns = "/event1_tenover_do")
public class EventTenOverDeleteServlet extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		try {
			int event_no = Integer.parseInt(req.getParameter("event_no"));
			
			eventDao edao = new eventDao();
			edao.tenover(event_no);
			
			resp.sendRedirect("event_event1.jsp");
			
		}
		
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
