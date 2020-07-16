package home.servlet.estimate;

import java.io.IOException;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import home.beans.dao.EstimateDao;
import home.beans.dto.EstimateDto;
import home.beans.dto.MemberDto;

@WebServlet(urlPatterns = "/estimate/saveesti.do")
public class LivingSaveServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			
			  req.setCharacterEncoding("UTF-8");
			
			MemberDto mdto = (MemberDto) req.getSession().getAttribute("userinfo");
			String member_id = mdto.getMember_id();//작성자 추출
			
			EstimateDto edto = new EstimateDto();
			edto.setBath_price(Integer.parseInt(req.getParameter("bath_price")));
			edto.setBath_cnt(req.getParameter("bath_cnt"));
			edto.setBath_cntt(req.getParameter("bath_cntt"));
			edto.setBath_tub(req.getParameter("bath_tub"));
			edto.setBath_tile(req.getParameter("bath_tile"));
			edto.setBath_option(req.getParameter("bath_option"));
			edto.setBath_date(req.getParameter("bath_date"));
			edto.setBath_member(member_id);
		
			EstimateDao edao = new EstimateDao();
			edao.save(edto);
			resp.sendRedirect("bath.jsp");
			
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);//--> 미리 등록된 에러 페이지 500번으로 연동
		}
	}
}









