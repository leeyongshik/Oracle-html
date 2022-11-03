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
		
		//페이징 처리 -1페이지당 5개씩
		int endNum = pg*5;
		int startNum = endNum -4;
		
		BoardDAO boardDAO = BoardDAO.getInstance();
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		List<BoardDTO> list = boardDAO.boardList(map); 
		
		int totalA = boardDAO.getTotalA();//총글수
		int totalPage = (totalA +4) /5;

		BoardPaging boardPaging = new BoardPaging();
		boardPaging.setCurrentPage(pg);
		boardPaging.setPageBlock(3);
		boardPaging.setPageSize(5);
		boardPaging.setTotalA(totalA);
		boardPaging.makePagingHTML();
		StringBuffer paging = boardPaging.getPagingHTML();
		
		
		request.setAttribute("list", list);
		request.setAttribute("id", id);
		request.setAttribute("pg", pg);
		request.setAttribute("paging", paging);
		
		request.setAttribute("display", "/board/boardList.jsp");
		return "/index.jsp";
	}

}
