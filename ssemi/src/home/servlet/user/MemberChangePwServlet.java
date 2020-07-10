package home.servlet.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import home.beans.dao.MemberDao;
import home.beans.dto.MemberDto;

@WebServlet(urlPatterns = "/member/change_pw.do")
public class MemberChangePwServlet extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		try {
			
		req.setCharacterEncoding("UTF-8");
		
		MemberDto mdto = new MemberDto();
		mdto.setMember_id(req.getParameter("member_id"));
		mdto.setMember_nick(req.getParameter("member_nick"));
		mdto.setMember_phone(req.getParameter("member_phone"));
		
		//처리 
		MemberDao mdao = new MemberDao();
		String member_pw = mdao.CheckPw(mdto);
				
		
		//출력
		if(member_pw!=null) {
			req.getSession().setAttribute("member_pw", member_pw);
			
			resp.sendRedirect("change_pw_result.jsp");
		}
		
		
		else {//결과가 없으면
			resp.sendRedirect("change_pw.jsp?error");
			
		}
	}
	
	catch(Exception e) {
		e.printStackTrace();
		resp.sendError(500);
	}

}
}
