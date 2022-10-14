package mamber.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.bean.MemberDTO;
import member.dao.MemberDAO;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		
		//데이터
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		
		//DB
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setId(id);
		memberDTO.setPwd(pwd);
		MemberDAO memberDAO = MemberDAO.getInstance();
		String name = memberDAO.memberCheck(memberDTO);
		
		
		//응답
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		out.println("<html>");
		out.println("<head>");
		out.println("</head>");
		out.println("<body>");
		
		if(name == null)
			out.println("아이디 또는 비밀번호가 틀렸습니다.");
		else
			out.println(name+ "님 로그인");
		
		out.println("</body>");
		out.println("</html>");
	}

}
