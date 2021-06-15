<%@page import="model.bean.UtenteBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    UtenteBean utente = (UtenteBean) request.getAttribute("utente");
	if(utente == null)
	{
		response.sendRedirect(response.encodeURL("utente"));
		return;
	}
    %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Pagina Utente</title>
		<link href="css/stileGenerale.css" rel="stylesheet" type="text/css" >
		<link href="css/barraNavigazionalePrinc.css" rel="stylesheet" type="text/css">
		<link href ="css/footer.css" rel="stylesheet" type="text/css"> 
	</head>
	
	<body>
	
		<%@ include file = "fragments/barraNavigazionalePrinc.jsp" %>
		<div>
			<a href = "/progetto-TSW/ordini">i tuoi ordini</a>
		</div>
		<div>
			<a href = "/progetto-TSW/carte">i tuoi metodi di pagamento</a>
		</div>
		<div>
			<a href = "/progetto-TSW/indirizzi">i tuoi indirizzi di spedizione</a>
		</div>
		<%@ include file = "fragments/footer.html" %>
	
	</body>
</html>