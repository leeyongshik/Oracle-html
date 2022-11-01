package member.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class LoginService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		//데이터
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		
		//DB
		MemberDAO memberDAO = MemberDAO.getInstance();// 싱글톤
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pwd",pwd);
		
		MemberDTO memberDTO = memberDAO.memberLogin(map);
		

		

		//페이지 이동

		if(memberDTO != null){
			HttpSession session = request.getSession(); // 세션 생성
			session.setAttribute("memId", memberDTO.getId());
			session.setAttribute("memName", memberDTO.getName());
			session.setAttribute("memEmail", memberDTO.getEmail1() + "@" + memberDTO.getEmail2());
			return "loginOk.jsp";
		}else {
			return "loginFail.jsp";
		} 
		
	}

}
