<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Errore</title>
	</head>
	<body>
	<%@ include file = "fragments/barraNavigazionalePrinc.jsp" %>
		<h1>Si è verificato un errore</h1>
		<p>${error}</p>
	</body>
</html>