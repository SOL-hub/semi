package home.servlet.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import home.beans.dao.MemberDao;
import home.beans.dto.MemberDto;

@WebServlet(urlPatterns = "/admin/check_pw.do")
public class AdminCheckServlet extends HttpServlet {
	
		@Override
		protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			try {
				//비밀번호변경하기 전 검사하는 서블릿
				//req.setCharacterEncoding("UTF-8");
				
				String go = req.getParameter("go");
				
				
				String member_pw = req.getParameter("member_pw");
				
				MemberDto mdto = (MemberDto)req.getSession().getAttribute("userinfo");
				String member_id = mdto.getMember_id();
			
			//기능 신규말고 
				MemberDao mdao = new MemberDao();
				MemberDto user = new MemberDto();
				user.setMember_id(member_id);
				user.setMember_pw(member_pw);
				MemberDto result = mdao.login(user);
				
			
				
				if(result ==null) { //인증실패
					//req.getSession().setAttribute("member_pw", member_pw);
					
				resp.sendRedirect("admin_check_pw.jsp?error&go="+go);
				
				}
				
				else {//로그인 성공
					resp.sendRedirect(go);
				}
			}
			catch(Exception e){
				e.printStackTrace();
				resp.sendError(500);
			}
		}
		
	}
