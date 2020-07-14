package home.servlet.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import home.beans.dao.MemberDao;
import home.beans.dto.MemberDto;
@WebServlet (urlPatterns = "/admin/admin_edit.do")
public class AdminEditServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
		
		try {
			//입력
			req.setCharacterEncoding("utf-8");
			
			
			MemberDto mdto = new MemberDto();
			mdto.setMember_no(Integer.parseInt(req.getParameter("member_no")));
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
			mdto.setMember_point(Integer.parseInt(req.getParameter("member_point")));
			mdto.setMember_auth(req.getParameter("member_auth"));
			mdto.setMember_join(req.getParameter("member_join"));
			mdto.setMember_login(req.getParameter("member_login"));
			mdto.setMember_image (req.getParameter("member_image"));
			mdto.setMember_consult_list (req.getParameter("member_consult_list"));
			
			
			
			// 처리
			MemberDao mdao =new MemberDao();
			mdao.editByAdmin(mdto);
			
			// 출력
			
			resp.sendRedirect("admin_member_info.jsp?member_no="+mdto.getMember_no());
			
			
			
		}catch(Exception e) {
			
			e.printStackTrace();
			resp.sendError(500);
			
		}
		
		
	}
}
