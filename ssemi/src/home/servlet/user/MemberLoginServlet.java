package home.servlet.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import home.beans.dao.MemberDao;
import home.beans.dto.MemberDto;


@WebServlet(urlPatterns = "/member/login.do")
public class MemberLoginServlet extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			req.setCharacterEncoding("UTF-8");
			MemberDto mdto =new MemberDto();
			mdto.setMember_id(req.getParameter("member_id"));
			mdto.setMember_pw(req.getParameter("member_pw"));
			
			//처리
			MemberDao mdao = new MemberDao();
			MemberDto user = mdao.login(mdto);
			
			//출력
			if(user == null) {//로그인 실패
				resp.sendRedirect("login.jsp?error");
				}
			
			else {
				mdao.updateLoginTime(user.getMember_id());
				
				//로그인한 사용자 정보를 "userinfo"라는이름으로 세션에 저장
				
				req.getSession().setAttribute("userinfo", user);
				
				resp.sendRedirect(req.getContextPath());
			}
			
		}

		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	
	}
}
