<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:forEach var="data" items="${ requestScope.list }">
	${data }<br>
</c:forEach>
<br><BR>
<!-- pageScope.list 에서 찾는다. => list는 pageScope에는 없다
	 => requestScope 에서 찾는다. -->
list=${list}<br>
list[2] = ${list[2]}
<BR><BR><BR>

<%-- for(PersonDTO personDTO : list2) --%>
<c:forEach var="personDTO" items="${requestScope.list2 }">
	이름 = ${personDTO.getName() } &emsp; 나이 = ${personDTO.getAge() } <br>
	이름 = ${personDTO.name } &emsp; 나이 = ${personDTO.age } <br>
	<hr>
</c:forEach>
</body>
</html>