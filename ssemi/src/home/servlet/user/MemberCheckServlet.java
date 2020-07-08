package home.servlet.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import home.beans.dao.MemberDao;
import home.beans.dto.MemberDto;

@WebServlet(urlPatterns = "/member/check_pw.do")
public class MemberCheckServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String member_id=req.getParameter("member_id");
			String member_nick=req.getParameter("member_pw");
			String member_phone=req.getParameter("member_phone");
			
		
			String go = req.getParameter("go");
			
			MemberDto mdto = (MemberDto)req.getSession().getAttribute("userinfo");
			String member_pw = mdto.getMember_pw();
			
			MemberDao mdao = new MemberDao();
			MemberDto user = new MemberDto(); //새로운 DTo
			
			user.setMember_id(member_id);
			user.setMember_pw(member_pw);
			
			user.setMember_nick(member_nick);
			user.setMember_phone(member_phone);
			
			
			MemberDto pw_result = mdao.login(user);
			
			
			if(pw_result==null) {
			resp.sendRedirect("check_pw.jsp?error&go="+go);
			}
			
			else {
				resp.sendRedirect(go);
			}
		}
		catch(Exception e){
			e.printStackTrace();
			resp.sendError(500);
		}
	}
	
	//비밀번호를 검사하는 서블릿
	

}
