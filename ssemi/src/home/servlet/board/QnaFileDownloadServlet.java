package home.servlet.board;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;

import home.beans.dao.Qna_fileDao;
import home.beans.dto.Qna_fileDto;

@WebServlet(urlPatterns="/board/download.do")
public class QnaFileDownloadServlet extends HttpServlet {
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	try {
	// 목표 :  사용자가 원하는 파일을 다운로드 할 수 있도록 전송
		
		// 1. 사용자 요청정보에서 qna_file_no를 불러옴
		int qna_file_no = Integer.parseInt(req.getParameter("qna_file_no"));

		//	2. 데이터베이스에서 qna_file_no에 해당하는 파일 정보를 불러옴
		Qna_fileDao qfdao = new Qna_fileDao();
		Qna_fileDto qfdto = qfdao.get(qna_file_no);
		
		// 3. 만약 대상 파일이 없으면 사용자에게 오류 송출
		if(qfdto==null) {
			resp.sendError(404);
			return;
		}
		
		// 4. 다운로드를 위해 사용자에게 필요한 정보들을 알려주도록 설정(헤더 설정_
		resp.setHeader("Content-Type", "application/octet-stream; charset=UTF-8");
		resp.setHeader("Content-Disposition", "attachment; filename=\""+URLEncoder.encode(qfdto.getQna_file_name(), "UTF-8")+"\"");
		resp.setHeader("Content-Length", String.valueOf(qfdto.getQna_file_size()));
		
		//	5. 실제 데이터를 불러와서 사용자에게 전송한다.
		File target = new File("D:/upload/qna_file", String.valueOf(qfdto.getQna_file_no()));
		byte[] data = FileUtils.readFileToByteArray(target);//파일 데이터 로드
		resp.getOutputStream().write(data);//사용자에게 전송
		
	} catch(Exception e) {
		e.printStackTrace();
		resp.sendError(500);
	}

}
}
