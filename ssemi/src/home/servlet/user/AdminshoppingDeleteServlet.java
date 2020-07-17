package home.servlet.user;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import home.beans.dao.MemberDao;
import home.beans.dao.ShoppingDao;
import home.beans.dto.shoppingDto;
@WebServlet(urlPatterns = "/admin/shopping_delete.do")
public class AdminshoppingDeleteServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
		try {
			
			
			String shopping_no = req.getParameter("shopping_no");
			
			//처리 : 삭제 처리
			ShoppingDao sdao = new ShoppingDao();
			 sdao.delete(shopping_no);
			
			//회원탈퇴와 동일한 기능 사용
			
			//출력 : 회원 목록(list.jsp)


			resp.sendRedirect("total_before_pay.jsp");

			
			
			
		}catch(Exception e){
			e.printStackTrace();
			resp.sendError(500);
		}
		
		
		
	
		
		
		
	}

}
