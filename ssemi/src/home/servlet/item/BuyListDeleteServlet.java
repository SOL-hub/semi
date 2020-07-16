package home.servlet.item;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import home.beans.dto.shoppingDto;

@WebServlet(urlPatterns = ("/buypage/buy_list_delete.do"))
public class BuyListDeleteServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			shoppingDto sdto = new shoppingDto();
			
			
		}
		
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
