package home.servlet.item;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import home.beans.dao.CartDao;
import home.beans.dao.ShoppingDao;
import home.beans.dto.MemberDto;
import home.beans.dto.shoppingDto;

@WebServlet(urlPatterns = "/buypage/buy_page.do")
public class BuyListPageServlet extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			MemberDto mdto = (MemberDto)req.getSession().getAttribute("userinfo");
			int member_no = mdto.getMember_no();
			String[] buy_add = req.getParameterValues("shopping_item_name");
			String[] buy_cnt = req.getParameterValues("shopping_item_cnt");
			for(int i=0; i<buy_add.length; i++) {
				
			shoppingDto sdto = new shoppingDto();
			sdto.setShopping_item_name(Integer.parseInt(buy_add[i]));
			sdto.setShopping_item_cnt(Integer.parseInt(buy_cnt[i]));
			sdto.setShopping_member(member_no);
			sdto.setShopping_recive_name(req.getParameter("shopping_recive_name"));
			sdto.setShopping_recive_phone(req.getParameter("shopping_recive_phone"));
			sdto.setShopping_recive_post(req.getParameter("shopping_recive_post"));
			sdto.setShopping_recive_base_addr(req.getParameter("shopping_recive_base_addr"));
			sdto.setShopping_recive_extra_addr(req.getParameter("shopping_recive_extra_addr"));
			sdto.setShopping_recive_content(req.getParameter("shopping_recive_content"));
			sdto.setShopping_payment(req.getParameter("shopping_payment"));
			sdto.setShopping_paybank(req.getParameter("shopping_paybank"));
			sdto.setShopping_paybank_num(req.getParameter("shopping_paybank_num"));

			
			ShoppingDao sdao = new ShoppingDao();

			sdao.buy_list_add(sdto);
				
			}
			
			resp.sendRedirect("buy_result.jsp");
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
