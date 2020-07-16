package home.servlet.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import home.beans.dao.QnaDao;
import home.beans.dto.MemberDto;
import home.beans.dto.QnaDto;

// @WebServlet(urlPatterns = "/board/QnaWrite.do")
public class QnaWriteServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
			// 게시글 등록 -> 상세페이지 이동
			// 준비 : 제목, 내용, 작성자(session)

			// int member_no = mdto.getMember_no();

			QnaDto qdto = new QnaDto();
			QnaDao qdao = new QnaDao();

			// 게시글 번호 미리 받아오기
			int qna_no = qdao.getSequence();

			qdto.setQna_no(qna_no);
			qdto.setQna_writer(Integer.parseInt(req.getParameter("member_no")));
			qdto.setQna_title(req.getParameter("qna_title"));
			qdto.setQna_content(req.getParameter("qna_content"));
			
			//	게시글 번호(qna_no)가 있을때만 받음
			if(req.getParameter("qna_no")!=null) {
				qdto.setSuper_no(Integer.parseInt(req.getParameter("qna_no")));
			}

			qdao.write(qdto);
			
			resp.sendRedirect("Qna_content.jsp?qna_no=" + qna_no);

		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}

	}

}
