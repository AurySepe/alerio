<%@page import="model.bean.OrdineBean"%>
<%@page import="model.bean.UtenteBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	UtenteBean utente = (UtenteBean) request.getAttribute("utente");
	if(utente == null)
	{
		response.sendRedirect(response.encodeURL("ordini"));
		return;
	}
%>

<html>
	<head>
		<meta charset="UTF-8">
		<meta content="width=device-width, initial-scale=1" name="viewport" />
		<title>Ordini</title>
		<link rel = "stylesheet" href = "css/stileGenerale.css" type = "text/css">
		<link href="css/barraNavigazionalePrinc.css" rel="stylesheet" type="text/css">
		<link href ="css/footer.css" rel="stylesheet" type="text/css"> 
		<link href ="css/ordini.css" rel="stylesheet" type="text/css"> 
	</head>
	
	<body>
		<%@ include file = "fragments/barraNavigazionalePrinc.jsp" %>
		<div id = "ordini">
			<h1>I tuoi ordini</h1>
			<div id = "riepilogo-ordini">
			
			<div id = "titoli">
				<span>Data di acquisto</span>
				<span>Iva</span>
				<span>Costo totale</span>
				<span>Dettagli</span>
			</div>
			<%for(OrdineBean ordine : utente.getOrdini()) 
			{
				request.setAttribute("ordine", ordine);
				String costoTotale = String.format("%.2f", ordine.getCosto()* (1 + ordine.getIva()));
			%>
			
			<div class = "ordine">
				<span>${ordine.data}</span>
				<span>${ordine.iva}</span>
				<span><%= costoTotale %>€</span>
				<span><a href = "ordine?codice=${ordine.codiceOrdine}">dettagli ordine</a></span>
			</div>
			
			<%} %>
			</div>
		</div>
		<%@ include file = "fragments/footer.html" %>
	</body>
</html>