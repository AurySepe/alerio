<%@page import="model.bean.OrdineBean"%>
<%@page import="model.bean.UtenteBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
		<meta charset="ISO-8859-1">
		<title>Ordini</title>
		<link rel = "stylesheet" href = "css/stileGenerale.css" type = "text/css">
		<link href="css/barraNavigazionalePrinc.css" rel="stylesheet" type="text/css">
		<link href ="css/footer.css" rel="stylesheet" type="text/css"> 
	</head>
	
	<body>
		<%@ include file = "fragments/barraNavigazionalePrinc.jsp" %>
		<table>
			<tr>
				<th>Data di acquisto</th>
				<th>Iva</th>
				<th>Costo Totale</th>
				<th>Dettagli</th>
			</tr>
			<%for(OrdineBean ordine : utente.getOrdini()) 
			{
				request.setAttribute("ordine", ordine);
			%>
			
			<tr>
				<td>${ordine.data}</td>
				<td>${ordine.iva}</td>
				<td>${ordine.costo}</td>
				<td><a href = "ordine?codice=${ordine.codiceOrdine}">dettagli ordine</a></td>
			</tr>
			
			<%} %>
		</table>
		<%@ include file = "fragments/footer.html" %>
	</body>
</html>