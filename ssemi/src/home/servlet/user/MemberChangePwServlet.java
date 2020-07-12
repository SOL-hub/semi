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
public class MemberChangePwServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			req.setCharacterEncoding("UTF-8");

			// 시작

			MemberDto mdto = (MemberDto) req.getSession().getAttribute("userinfo");
			String member_id = mdto.getMember_id();

			String member_pw = req.getParameter("member_pw");

			// 처리
			MemberDto user = new MemberDto();
			user.setMember_id(member_id);
			user.setMember_pw(member_pw);

			MemberDao mdao = new MemberDao();
			mdao.ChangePw(user);

			// 출력

resp.sendRedirect("change_pw_result.jsp");
		
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}

	}

}
