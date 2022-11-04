package board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.bean.BoardPaging;
import board.dao.BoardDAO;

public class GetBoardListService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		//DB
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
		
		//List -> JSON 변환
		JSONObject json = new JSONObject();
		
		if(list != null) {
			JSONArray array = new JSONArray();
			for (BoardDTO boardDTO : list) {
				JSONObject temp = new JSONObject();
				temp.put("seq",boardDTO.getSeq());
				temp.put("id",boardDTO.getId());
				temp.put("name",boardDTO.getName());
				temp.put("email",boardDTO.getEmail());
				temp.put("subject",boardDTO.getSubject());
				temp.put("content",boardDTO.getContent());
				temp.put("ref",boardDTO.getRef());
				temp.put("lev",boardDTO.getLev());
				temp.put("step",boardDTO.getStep());
				temp.put("pseq",boardDTO.getPseq());
				temp.put("Reply",boardDTO.getReply());
				temp.put("hit",boardDTO.getHit());
				temp.put("logtime",boardDTO.getLogtime());
				
				array.add(temp);
			}
			json.put("list", array);
		}//if 
		int totalA = boardDAO.getTotalA();//총글수
		int totalPage = (totalA +4) /5;

		//페이징처리
		BoardPaging boardPaging = new BoardPaging();
		boardPaging.setCurrentPage(pg);
		boardPaging.setPageBlock(3);
		boardPaging.setPageSize(5);
		boardPaging.setTotalA(totalA);
		boardPaging.makePagingHTML();
		StringBuffer paging = boardPaging.getPagingHTML();
		
		System.out.println(json);
		
		request.setAttribute("id", id);
		request.setAttribute("pg", pg);
		request.setAttribute("json", json);
		
		return "/board/getBoardList.jsp";
		
		
	}

}
