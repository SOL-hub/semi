package home.servlet.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import home.beans.dao.eventDao;
import home.beans.dto.eventDto;
@WebServlet(urlPatterns = "/event/event1_edit.do")
public class EventEditServlet extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	try {
		
		//입력해야할 것들을 생각해봐라
		req.setCharacterEncoding("UTF-8");
		eventDto edto = new eventDto();
		edto.setEvent_no(Integer.parseInt(req.getParameter("event_no")));
        edto.setEvent_head(req.getParameter("event_head"));
		edto.setEvent_title(req.getParameter("event_title"));
		edto.setEvent_content(req.getParameter("event_content"));
		
		//처리
		eventDao edao = new eventDao();
		edao.edit(edto);
	
		
		resp.sendRedirect("event1_content.jsp?event_no="+edto.getEvent_no());
		
	}
	
	catch(Exception e){
		e.printStackTrace();
		resp.sendError(500);
	
	}
	}
}
