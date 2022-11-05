package board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.bean.BoardPaging;
import board.dao.BoardDAO;

public class BoardListService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("memId");
		
		request.setAttribute("pg", pg);
		request.setAttribute("display", "/board/boardList.jsp");
		request.setAttribute("id", id);
		
		return "/index.jsp";
	}

}
