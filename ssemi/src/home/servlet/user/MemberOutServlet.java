package home.servlet.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import home.beans.dao.MemberDao;
import home.beans.dto.MemberDto;

@WebServlet (urlPatterns = "/member/user_out.do")
public class MemberOutServlet extends HttpServlet{

   @Override
   protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      
      try {
         
         MemberDto mdto = (MemberDto)req.getSession().getAttribute("userinfo");
         int member_no = mdto.getMember_no();
         
         MemberDao mdao = new MemberDao();
         mdao.member_out(member_no);
         
         resp.sendRedirect("member_out_result.jsp");
         
      }
      
      catch(Exception e) {
         e.getStackTrace();
         resp.sendError(500);
      }
   }

}