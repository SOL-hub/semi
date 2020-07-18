package home.servlet.item;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import home.beans.dao.ItemDao;
import home.beans.dto.ItemDto;

////@WebServlet(urlPatterns="/item/search.do")
////public class ItemSearchServlet extends HttpServlet {
////@Override
////protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
////try {
////	String keyword=req.getParameter("keyword");
////	
////	ItemDao idao = new ItemDao();
////	List<ItemDto> list = idao.search(keyword);
////	
////	resp.setContentType("text/plain");
////	resp.setCharacterEncoding("UTF-8");
////	
////	if(!list)
////	}
////}
////catch (Exception e) {
////	e.printStackTrace();
////	resp.sendError(500);
//}
//}
//}
