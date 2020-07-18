package home.servlet.user;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;

import home.beans.dao.ItemFileDao;
import home.beans.dto.ItemFileDto;

@WebServlet(urlPatterns = "/member/download2.do")
public class ItemDownloadServlet extends HttpServlet{
	@Override
//	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
//	}
//	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int item_file_no = Integer.parseInt(req.getParameter("item_file_no"));
			
			ItemFileDao ifdao = new ItemFileDao();
			ItemFileDto ifdto = ifdao.get(item_file_no);
			
			if(ifdto == null) {
				resp.sendError(404);
				return;
			}
			
			resp.setHeader("Content-Type", "application/octet-stream; charset=UTF-8");
			resp.setHeader("Content-filename", "attachment; filename="+ifdto.getItem_file_name());
			resp.setHeader("Content-Length", String.valueOf(ifdto.getItem_file_size()));
			
			File target = new File("D:/upload/item_file", String.valueOf(ifdto.getItem_file_no()));
			byte[] data = FileUtils.readFileToByteArray(target);
			resp.getOutputStream().write(data);
			
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
