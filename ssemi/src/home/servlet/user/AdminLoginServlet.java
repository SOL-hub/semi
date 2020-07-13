package home.servlet.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import home.beans.dao.AdminDao;
import home.beans.dto.AdminDto;

@WebServlet(urlPatterns = "/admin/admin_login.do")
public class AdminLoginServlet extends HttpServlet {
	
	@Override
	

	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		try {
			req.setCharacterEncoding("utf-8");
			AdminDto adto = new AdminDto();
			adto.setAdmin_id((req.getParameter("admin_id")));
			adto.setAdmin_pw(req.getParameter("admin_pw"));
			
			AdminDao adao = new AdminDao();
			AdminDto admin = adao.login(adto);
			
			
			if(admin==null) {
				resp.sendRedirect("admin_login.jsp?error");
			}else {
				req.getSession().setAttribute("admininfo", admin);
				resp.sendRedirect("adminSearch.jsp");
			}
			
			
			
		}catch(Exception e ) {
			e.printStackTrace();
			resp.sendError(500);
			
		}
		
		
	}

	
	
}
