<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %> <%-- XML 파일 태그 시작 전의 모든 공백 문자 제거 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 
DB연동 - 아이디가 "hong" 이면 true를 전달
 --%>
<c:set var="result" value="false"/>
<c:if test="${param.user_id == 'hong'}">
	<c:set var="result" value="true"/>
</c:if>

<?xml version="1.0" encoding="UTF-8"?>
<check_id>
	<result>${result}</result>
</check_id>