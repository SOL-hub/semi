package home.servlet.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import home.beans.dao.MemberDao;
import home.beans.dto.MemberDto;

@WebServlet(urlPatterns = "/member/find_id,pw.do")
public class MemberFindid_PwServlet extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력 : name, phone--> MemberDto
			req.setCharacterEncoding("UTF-8");
			MemberDto mdto = new MemberDto();
			mdto.setMember_name(req.getParameter("member_name"));
			mdto.setMember_phone(req.getParameter("member_phone"));
			
			//처리
			MemberDao mdao = new MemberDao();
			String member_id = mdao.findId(mdto);
			
			//출력
			if(member_id!=null) {//결과가 있으면
				req.getSession().setAttribute("member_id", member_id);
				resp.sendRedirect("find_id_result.jsp");
				
			}
			else {//결과가 없으면
				resp.sendRedirect("find_id.jsp?error");
				
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
	

}
