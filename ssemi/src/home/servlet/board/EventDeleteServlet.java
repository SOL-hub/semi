package home.servlet.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;

import home.beans.dao.eventDao;

@WebServlet(urlPatterns = "/event/delete.do")
public class EventDeleteServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		try {
			
			int event_no = Integer.parseInt(req.getParameter("event_no"));
			
			eventDao edao = new eventDao();
			edao.delete(event_no); //삭제하기
			
		
			
			//출력할 때 event.jsp로 강제 이동
			resp.sendRedirect("event_event1.jsp");
		}
		
		catch(Exception e){
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
