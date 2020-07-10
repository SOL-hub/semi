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
public class MemberCheckPwServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//비밀번호변경하기 전 검사하는 서블릿
			req.setCharacterEncoding("UTF-8");
			
			MemberDto mdto = new MemberDto();
			mdto.setMember_id(req.getParameter("member_id"));
			mdto.setMember_nick(req.getParameter("member_nick"));
			mdto.setMember_phone(req.getParameter("member_phone"));
			
			//처리
			MemberDao mdao =new MemberDao();
			String member_pw = mdao.CheckPw(mdto);
		
			
			if(member_pw!=null) {
			resp.sendRedirect("change_pw.jsp");
			
			}
			
			else {
				resp.sendRedirect("check_pw.jsp?error");
			}
		}
		catch(Exception e){
			e.printStackTrace();
			resp.sendError(500);
		}
	}
	
}
