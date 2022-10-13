package com.person;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/PersonServlet")
public class PersonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	public void init() throws ServletException {

	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		int gender = Integer.parseInt(request.getParameter("gender"));
		String color = request.getParameter("color");
		String[] hobby = request.getParameterValues("hobby");
		String[] subject = request.getParameterValues("subject");
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		out.println("<html>");
		out.println("<head>");
		out.println("<style type=\"text/css\">");
		out.println("body{");
		out.println("color :"+color+";}");
		out.println("</style>");
		out.println("</head>");
		out.println("<body>");
		
		out.println("<ul>");
		out.print("<li>");
		out.print("이름 : "+name);
		out.println("</li>");
		out.print("<li>");
		out.print("성별 : "+gender);
		out.println("</li>");
		out.print("<li>");
		out.print("색깔 : "+color);
		out.println("</li>");
		out.print("<li>");
		out.print("취미 : "+Arrays.toString(hobby));
		out.println("</li>");
		out.print("<li>");
		out.print("과목 : "+Arrays.toString(subject));
		out.println("</li>");
		out.println("</ul>");
		
		out.println("</body>");
		out.println("</html>");
	}
	

}
