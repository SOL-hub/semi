package home.servlet.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import home.beans.dao.QnaDao;
import home.beans.dto.QnaDto;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = "/test.do")
public class test extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			QnaDao qdao = new QnaDao();

			QnaDto qdto = new QnaDto();

			int qna_no;
			
			for(int i = 0; i < 1000; i++ ) {
				qna_no = qdao.getSequence();
				qdto.setQna_no(qna_no);
				qdto.setQna_writer(25);
				qdto.setQna_title("배송문의");
				qdto.setQna_content("테스트 내용");
				
				qdao.write(qdto);

			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
