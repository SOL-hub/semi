package home.servlet.estimate;

import java.io.IOException;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import home.beans.dao.KitDao;
import home.beans.dto.KitDto;
import home.beans.dto.MemberDto;

@WebServlet(urlPatterns = "/estimate/savekit.do")
public class KitSaveServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			 req.setCharacterEncoding("UTF-8");
			
			MemberDto mdto = (MemberDto) req.getSession().getAttribute("userinfo");
			String member_id = mdto.getMember_id();//작성자 추출
		
			KitDto kdto = new KitDto(); 
			kdto.setKit_title(req.getParameter("kit_title"));
			kdto.setKit_price(Integer.parseInt(req.getParameter("kit_price")));
			kdto.setKit_shape(req.getParameter("kit_shape"));
			kdto.setKit_sinksize(req.getParameter("kit_sinksize"));
			kdto.setKit_toptype(req.getParameter("kit_toptype"));
			kdto.setKit_walltype(req.getParameter("kit_walltype"));
			kdto.setKit_tile(req.getParameter("kit_tile"));
			kdto.setKit_option(req.getParameter("kit_option"));
			kdto.setKit_date(req.getParameter("kit_date"));
			kdto.setKit_member(member_id);
			
			
			KitDao kdao = new KitDao();
			kdao.save(kdto);
			resp.sendRedirect("kit.jsp");
			
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);//--> 미리 등록된 에러 페이지 500번으로 연동
		}
	}
}









