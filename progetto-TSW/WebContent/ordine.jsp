<%@page import="model.ComposizioneBean"%>
<%@page import="model.ProductBean"%>
<%@page import="model.OrdineBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
	OrdineBean ordine = (OrdineBean) request.getAttribute("ordine");
	if(ordine == null)
	{
		response.sendRedirect(response.encodeRedirectURL("ordine"));
		return;
	}
	double costoTotale = 0;
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<link rel = "stylesheet" href = "css/stileGenerale.css" type = "text/css">
		<title>ordine</title>
	</head>
	
	<body>
	<%@ include file = "fragments/barraNavigazionalePrinc.jsp" %>
	
	<div>
		<div>
			<p>Indirizzo Spedizione: qualcosa</p>
		</div>
		<div>
			<p>Carta usata: qualcosa</p>
		</div>
	</div>
	<div>
		<table>
		
			<tr>
				<th>Immagine</th>
				<th>Nome</th>
				<th>Taglia</th>
				<th>Prezzo</th>
				<th>Quantità</th>
			</tr>
			<% for(ComposizioneBean c : ordine.getComposizione())
			{
				request.setAttribute("composizione", c);	
				costoTotale += c.getPrezzo();
			%>
			<tr>
				<td><img src = "immagine?codice=${composizione.prodotto.varianteProdotto.immaginiVariante[0].codice }" width="80" height="80"></td>
				<td><a href = "mostraProdotto?codice=${composizione.prodotto.varianteProdotto.codice}&codiceModello=${composizione.prodotto.varianteProdotto.modelloProdotto.codice}">
				${composizione.prodotto.varianteProdotto.modelloProdotto.nome}</a></td>
				<td>${composizione.prodotto.taglia}</td>
				<td>${composizione.prezzo}</td>
				<td>${composizione.quantita}<td>
			</tr>
			
			<%} %>
		</table>
		<h3>Costo totale = <%= costoTotale %> </h3>
	</div>
	
	<%@ include file = "fragments/footer.html" %>
	</body>
</html>