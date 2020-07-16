package home.servlet.board;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import home.beans.dao.MemberDao;
import home.beans.dao.QnaDao;
import home.beans.dao.Qna_fileDao;
import home.beans.dto.MemberDto;
import home.beans.dto.QnaDto;
import home.beans.dto.QnaWithMemberDto;
import home.beans.dto.Qna_fileDto;
@WebServlet(urlPatterns = "/board/QnaWrite.do")
public class QnaWriteWithFileServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	try {
		// 목표 : multipart/form-data 방식으로 전송되는 게시글+파일을 해석 및 저장
		// 1. 해석을 위한 도구 생성 옵션 설정
		String charset = "UTF-8";
		int limit=10*1024*1024;
		File baseDir = new File("D:/upload/qna_file");
		baseDir.mkdir();
		
		// 2. 도구 생성을 위한 Factory 객체 생성
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setDefaultCharset(charset);
		factory.setSizeThreshold(limit);
		factory.setRepository(baseDir);
		
		// 3. 실제 사용할 도구 생성
		ServletFileUpload utility = new ServletFileUpload(factory);
		
		// 4. 실제 전송된 데이터를 불러와서 저장
		Map<String, List<FileItem>> map = utility.parseParameterMap(req);
		
		// 5. 해석한 데이터에서 필요한 정보 추출
		QnaDto qdto = new QnaDto();
		qdto.setQna_title(map.get("qna_title").get(0).getString());
		qdto.setQna_content(map.get("qna_content").get(0).getString());
		if(map.containsKey("qna_no")) {
			qdto.setSuper_no(Integer.parseInt(map.get("qna_no").get(0).getString()));
		}
		
		// 6. session 에서 작성자 정보를 가져오는 코드는 동일
		MemberDto user = (MemberDto) req.getSession().getAttribute("userinfo");
		qdto.setQna_writer(user.getMember_no());
		
		// 7. 작성할 게시글의 번호를 미리 가져온다
		QnaDao qdao = new QnaDao();
		int qna_no = qdao.getSequence();
		
		// 8. 게시글 정보에 7번에서 가져온 번호 첨부
		qdto.setQna_no(qna_no);
		
		// 9. 게시글 등록
		qdao.write(qdto);
		
		// 10. 파일 정보 불러와서 저장(하드디스크 + 데이터베이스)
		// - 전송되는 이름은 qna_file
		// - (주의) 파일이 없어도 개수가 1개가 나오므로 파일의 크기를 이용해서 확인!
		List<FileItem> fileList = map.get("qna_file");
		for(FileItem item : fileList) {
			// item에 있는 정보 -> DB에 저장
			// item의 파일 데이터 -> 하드디스크 저장
			if(item.getSize()>0) {
				 
				// file db 저장
				Qna_fileDao qfdao = new Qna_fileDao();
				int qna_file_no = qfdao.getSequence();
				
				Qna_fileDto qfdto = new Qna_fileDto();
				qfdto.setQna_file_no(qna_file_no);
				qfdto.setQna_file_origin(qna_no);
				qfdto.setQna_file_name(item.getName());
				qfdto.setQna_file_size(item.getSize());
				qfdto.setQna_file_type(item.getContentType());
				qfdao.save(qfdto);	
				
				// 하드디스크 저장
				File target = new File(baseDir,String.valueOf(qna_file_no));
				item.write(target);
			}
		}
		
		// 11. 상세보기 페이지로 리다이렉트
		resp.sendRedirect("Qna_content.jsp?qna_no="+qna_no);

	}
	catch(Exception e) {
		e.printStackTrace();
		resp.sendError(500);
	}
	}

}
