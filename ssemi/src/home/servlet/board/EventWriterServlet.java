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
		
		eventDto edto = new eventDto();
		edto.setEvent_head(req.getParameter("event_head"));
		edto.setEvent_title(req.getParameter("event_title"));
		edto.setEvent_content(req.getParameter("event_content"));
		edto.setEvent_writer(member_no);
		
		
		eventDao edao = new eventDao();
		int event_no = edao.getSequence();
		edto.setEvent_no(event_no);
		
		edao.write(edto); //등록
		
	
		MemberDao mdao= new MemberDao();
		mdao.pointadd(member_no);
		
		
		//출력

		
			//if(event_no<=10) {//만약에 등록한 글이 10개 이하라면? 목록에 보여주기   //if(event_no>=10)
       resp.sendRedirect("event1_content.jsp?event_no="+event_no);
	//	}
	
	
	//else { //11부터는 목록에서 안보이게 삭제할거임

	//	resp.sendRedirect("event.jsp"); 
		//이벤트 어머, 선착순이 마감되었어요 ㅠ0ㅠ , 다른 이벤트들을 참여해보세요!  모달달기. 
		
		//삭제 서블릿과 DAO는 만들었는데 어떻게 보낼까? 
		
		//resp.sendRedirect("event_event1.jsp");
        //resp.sendRedirect("event1_tenover_do");
				
	//}
	}
		
	//}
	
	catch(Exception e) {
		e.printStackTrace();
		resp.sendError(500);
	}
}
}
