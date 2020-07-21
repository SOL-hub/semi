package home.servlet.item;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import home.beans.dao.MemberDao;
import home.beans.dao.ShoppingDao;
import home.beans.dto.MemberDto;
import home.beans.dto.shoppingDto;

@WebServlet(urlPatterns = ("/buypage/buy_list_delete.do"))
public class BuyListDeleteServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			MemberDto user = (MemberDto)req.getSession().getAttribute("userinfo");
			int member_point = Integer.parseInt(req.getParameter("member_point"));
			int shopping_no =Integer.parseInt(req.getParameter("shopping_no"));
			int member_no = user.getMember_no();
			
			ShoppingDao sdao = new ShoppingDao();
			sdao.delete_buy_list(shopping_no);
			
			MemberDao mdao = new MemberDao();
			mdao.buy_point_cancle(member_no, member_point);
			
			
			resp.sendRedirect("buy_list.jsp");
			
			
		}
		
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
