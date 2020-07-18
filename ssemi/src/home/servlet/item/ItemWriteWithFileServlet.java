package home.servlet.item;


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
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;



import home.beans.dao.ItemDao;
import home.beans.dao.ItemFileDao;
import home.beans.dto.ItemDto;
import home.beans.dto.ItemFileDto;

@WebServlet(urlPatterns="/shop/item_write.do")
public class ItemWriteWithFileServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			String charset = "UTF-8";
			int limit = 10 * 1024 * 1024;
			File baseDir = new File("D:/upload/item_file");
			baseDir.mkdirs();
			
			DiskFileItemFactory factory = new DiskFileItemFactory();
			factory.setDefaultCharset(charset);
			factory.setSizeThreshold(limit);
			factory.setRepository(baseDir);
			
			ServletFileUpload utility = new ServletFileUpload(factory);
			
			Map<String, List<FileItem>> map = utility.parseParameterMap(req);
			
			ItemDto idto = new ItemDto();
			idto.setItem_name(map.get("item_name").get(0).getString());
			idto.setItem_price(Integer.parseInt(map.get("item_price").get(0).getString()));
			idto.setItem_kingtype(map.get("item_kingtype").get(0).getString());
			idto.setItem_type(map.get("item_type").get(0).getString());
			idto.setItem_info(map.get("item_info").get(0).getString());
			idto.setItem_stock(Integer.parseInt(map.get("item_stock").get(0).getString()));
			
			if(map.containsKey("item_no")) {
				idto.setItem_no(Integer.parseInt(map.get("item_no").get(0).getString()));
			}
			
			ItemDao idao = new ItemDao();
			int item_no = idao.getSequence();
			idto.setItem_no(item_no);
			idao.write(idto);
			
			List<FileItem> fileList= map.get("item_file");
			for(FileItem item : fileList) {
				if(item.getSize() > 0) {//파일이 있는경우
					
					ItemFileDao ifdao = new ItemFileDao();
					int item_file_no = ifdao.getSequence();
					
					ItemFileDto ifdto = new ItemFileDto();
					ifdto.setItem_file_no(item_file_no);
					ifdto.setItem_file_name(item.getName());
					ifdto.setItem_file_size(item.getSize());
					ifdto.setItem_file_type(item.getContentType());
					ifdto.setItem_origin(item_no);
					ifdao.save(ifdto);
					
					File target = new File(baseDir,String.valueOf(item_file_no));
					item.write(target);
				}
				
			}
			
			
			resp.sendRedirect("shop_content.jsp?item_no="+item_no);
		}
		catch(Exception e){
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
