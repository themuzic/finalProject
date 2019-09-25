<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>DEVELOFFICE</title>
</head>
<body>

<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>
<jsp:forward page="main/mainPage.jsp"/>

<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
</body>
</html>
