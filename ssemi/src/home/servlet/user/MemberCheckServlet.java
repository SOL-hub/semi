package home.servlet.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import home.beans.dao.MemberDao;
import home.beans.dto.MemberDto;

@WebServlet(urlPatterns = "/user/check_id.do")
public class MemberCheckServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			MemberDto udto = new MemberDto();
			udto.setMember_id(req.getParameter("member_id"));
					
			MemberDao udao = new MemberDao();
			String result = udao.idCheck(udto);
			
			if(result == null) {
				resp.getWriter().println(result);
			}
			else {
				resp.getWriter().println(result);
			}
			
		}
		catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
