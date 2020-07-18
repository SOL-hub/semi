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


@WebServlet(urlPatterns="/item/list_asc.do")
public class ItemAscServlet extends HttpServlet {
@Override
protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
try {
	
	// 입력 
	String keyword = req.getParameter("keyword");
	if(keyword!=null) {
		resp.sendRedirect("search.do?item_name="+keyword);
		return;
	}
	
	// 처리 
	ItemDao idao = new ItemDao();
	List<ItemDto> list = idao.getListA();
	
	
	// 출력 
	resp.setCharacterEncoding("UTF-8");
	resp.setContentType("text/plain");
	for(ItemDto idto : list) {
		resp.getWriter().println(idto.getItem_name());
	}
	
}
catch(Exception e) {
	e.printStackTrace();
	resp.sendError(500);
}
}
}
