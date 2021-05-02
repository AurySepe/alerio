<%@page import="model.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
	ProductBean bean = (ProductBean)request.getAttribute("prodotto");
	if(bean == null)
	{
		response.sendRedirect("/catalogo");
		return;
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title> ${prodotto.nome}</title>
	</head>
	<body>
	<%@ include file = "fragments/barraNavigazionale.jsp" %>
		<h1>${prodotto.nome}</h1>
		<h3>Colore: ${prodotto.colore}</h3>
		<h3>Collezione: ${prodotto.collezione}</h3>
		<h3>Prezzo: ${prodotto.prezzo}</h3>
		<p>${prodotto.informazioni}</p>
		<form name = "aggiungi al carrello" action = "aggiungiCarrello" method = "Post">
		<input type = "hidden" value = "${prodotto.codice}" name = "codice">
		<Button type = "submit">Aggiungi al carrello</Button>
		</form><br/>
	</body>
</html>