package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

public class BoardViewService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int pg = Integer.parseInt(request.getParameter("pg"));
		int seq = Integer.parseInt(request.getParameter("seq"));
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("memId");
		
		request.setAttribute("pg", pg);
		request.setAttribute("seq", seq);
		request.setAttribute("id", id);
		
		request.setAttribute("display", "/board/boardView.jsp");
		return "/index.jsp";
	}

}