package home.servlet.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import home.beans.dao.MemberDao;
import home.beans.dto.MemberDto;

@WebServlet(urlPatterns = "/member/join.do")
public class MemberJoinServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			MemberDto mdto = new MemberDto();
			mdto.setMember_id(req.getParameter("member_id"));
			mdto.setMember_pw(req.getParameter("member_pw"));
			mdto.setMember_name(req.getParameter("member_name"));
			mdto.setMember_nick(req.getParameter("member_nick"));
			mdto.setMember_birth(req.getParameter("member_birth"));
			mdto.setMember_phone(req.getParameter("member_phone"));
			mdto.setMember_email(req.getParameter("member_email"));
			mdto.setMember_post(req.getParameter("member_post"));
			mdto.setMember_base_addr(req.getParameter("member_base_addr"));
			mdto.setMember_extra_addr(req.getParameter("member_extra_addr"));
			
			MemberDao udao = new MemberDao();
			udao.join(mdto);
			
			resp.sendRedirect("join_comp.jsp");
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
