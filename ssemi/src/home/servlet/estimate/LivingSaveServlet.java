package home.servlet.estimate;

import java.io.IOException;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import home.beans.dao.LivingDao;
import home.beans.dto.LivingDto;
import home.beans.dto.MemberDto;

@WebServlet(urlPatterns = "/estimate/saveliving.do")
public class LivingSaveServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			
			 req.setCharacterEncoding("UTF-8");
			
			MemberDto mdto = (MemberDto) req.getSession().getAttribute("userinfo");
			String member_id = mdto.getMember_id();//작성자 추출
			
			LivingDto ldto = new LivingDto();
			ldto.setLiving_title(req.getParameter("living_title"));
			ldto.setLiving_price(Integer.parseInt(req.getParameter("living_price")));
			ldto.setLiving_type(req.getParameter("living_type"));
			ldto.setLiving_pattern(req.getParameter("living_pattern"));
			ldto.setLiving_color(req.getParameter("living_color"));
			ldto.setLiving_brand(req.getParameter("living_brand"));
			ldto.setLiving_member(member_id);
		
			
			LivingDao ldao = new LivingDao();
			ldao.save(ldto);
			resp.sendRedirect("living.jsp");
			
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);//--> 미리 등록된 에러 페이지 500번으로 연동
		}
	}
}









