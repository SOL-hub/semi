package home.servlet.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import home.beans.dao.MemberDao;
import home.beans.dto.MemberDto;

@WebServlet(urlPatterns = "/admin/delete.do")
public class AdminDeleteServlet extends HttpServlet {

		@Override
		protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
			
			
			try {
				
				
				String member_no = req.getParameter("member_no");
				
				//처리 : 삭제 처리
				MemberDao mdao = new MemberDao();
				mdao.exit(member_no);//회원탈퇴와 동일한 기능 사용
				
				//출력 : 회원 목록(list.jsp)


				resp.sendRedirect("admin_search.jsp");

				
				
				
			}catch(Exception e){
				e.printStackTrace();
				resp.sendError(500);
			}
			
			
			
		}
}
