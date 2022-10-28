<%@page import="com.jstl.PersonDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<String> list = new ArrayList<String>();
list.add("호랑이");
list.add("사자");
list.add("기린");
list.add("코끼리");
list.add("타조");
list.add("코알라");
list.add("여우");

List<PersonDTO> list2 = new ArrayList<PersonDTO>();
PersonDTO aa = new PersonDTO("홍길동",25);
PersonDTO bb = new PersonDTO("네  오",23);
PersonDTO cc = new PersonDTO("프로도",30);

list2.add(aa);
list2.add(bb);
list2.add(cc);


request.setAttribute("list", list);
request.setAttribute("list2", list2);

//페이지 이동
//response.sendRedirect("jstlEnd.jsp");

%>

<jsp:forward page="jstlEnd.jsp"></jsp:forward>