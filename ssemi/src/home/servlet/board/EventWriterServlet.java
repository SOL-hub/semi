package home.servlet.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import home.beans.dao.MemberDao;
import home.beans.dao.eventDao;
import home.beans.dto.MemberDto;
import home.beans.dto.eventDto;

@WebServlet(urlPatterns = "/event/event1_writer.do")
public class EventWriterServlet extends HttpServlet{
	
@Override
protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	try {
		req.setCharacterEncoding("UTF-8");
		MemberDto mdto = (MemberDto)req.getSession().getAttribute("userinfo");
		String member_id = mdto.getMember_id();
		int member_no = mdto.getMember_no();
		
		int member_point = Integer.parseInt(req.getParameter("member_point"));
		
		eventDto edto = new eventDto();
		edto.setEvent_head(req.getParameter("event_head"));
		edto.setEvent_title(req.getParameter("event_title"));
		edto.setEvent_content(req.getParameter("event_content"));
		edto.setEvent_writer(member_id);
		
		
		eventDao edao = new eventDao();
		int event_no = edao.getSequence();
		edto.setEvent_no(event_no);
		
		edao.write(edto); //등록
		
		
		MemberDto mdto2 = new MemberDto();
		mdto2.setMember_point(member_point);
		mdto2.setMember_no(member_no);
		
		MemberDao mdao= new MemberDao();
		mdao.pointadd(mdto2);
		
		
		//출력
			
       resp.sendRedirect("event1_content.jsp?event_no="+event_no);
		}
		
	
		
	//}
	
	catch(Exception e) {
		e.printStackTrace();
		resp.sendError(500);
	}
}
}
