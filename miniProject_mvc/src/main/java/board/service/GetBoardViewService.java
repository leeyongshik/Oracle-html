package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.dao.BoardDAO;

public class GetBoardViewService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int seq = Integer.parseInt(request.getParameter("seq"));
		
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.boardcount(seq);
		BoardDTO boardDTO = boardDAO.detailedPage(seq);
		
		//List -> JSON 변환
		JSONObject json = new JSONObject();
		json.put("seq",boardDTO.getSeq());
		json.put("id",boardDTO.getId());
		json.put("name",boardDTO.getName());
		json.put("email",boardDTO.getEmail());
		json.put("subject",boardDTO.getSubject());
		json.put("content",boardDTO.getContent());
		json.put("ref",boardDTO.getRef());
		json.put("lev",boardDTO.getLev());
		json.put("step",boardDTO.getStep());
		json.put("pseq",boardDTO.getPseq());
		json.put("Reply",boardDTO.getReply());
		json.put("hit",boardDTO.getHit());
		json.put("logtime",boardDTO.getLogtime());
		
		//조회수
		
		request.setAttribute("json", json);
		return "/board/getBoardView.jsp";
	}

}
