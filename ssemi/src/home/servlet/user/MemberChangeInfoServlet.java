package home.servlet.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import home.beans.dao.MemberDao;
import home.beans.dto.MemberDto;

@WebServlet(urlPatterns = "/member/user_info_update.do")
public class MemberChangeInfoServlet extends HttpServlet{
   @Override
   protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      try {
    	  
    	  //회원정보 수정코드
    	  
         req.setCharacterEncoding("UTF-8");
         MemberDto user = (MemberDto)req.getSession().getAttribute("userinfo");
         int member_no = user.getMember_no();
         
         MemberDto mdto = new MemberDto();
         
         mdto.setMember_no(member_no);
         mdto.setMember_nick(req.getParameter("member_nick"));
         mdto.setMember_birth(req.getParameter("member_birth"));
         mdto.setMember_phone(req.getParameter("member_phone"));
         mdto.setMember_email(req.getParameter("member_email"));
         mdto.setMember_post(req.getParameter("member_post"));
         mdto.setMember_base_addr(req.getParameter("member_base_addr"));
         mdto.setMember_extra_addr(req.getParameter("member_extra_addr"));
         
         MemberDao mdao = new MemberDao();
         mdao.user_info_update(mdto);
         
//         resp.getWriter().println(member_no);
         resp.sendRedirect("user_info.jsp");
      }
      catch(Exception e) {
         e.printStackTrace();
         resp.sendError(500);
      }
   }
}