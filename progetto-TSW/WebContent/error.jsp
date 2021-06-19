<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>Errore</title>
		<link href="css/stileGenerale.css" rel="stylesheet" type="text/css" >
		<link href="css/barraNavigazionalePrinc.css" rel="stylesheet" type="text/css">
		<link href ="css/footer.css" rel="stylesheet" type="text/css"> 
	</head>
	<body>
	<%@ include file = "fragments/barraNavigazionalePrinc.jsp" %>
		<h1>Si è verificato un errore</h1>
		<p>${error}</p>
	<%@ include file = "fragments/footer.html" %>
	</body>
</html>