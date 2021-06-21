<%@page import="model.bean.ComposizioneBean"%>
<%@page import="model.bean.ProductBean"%>
<%@page import="model.bean.OrdineBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
		<meta charset="UTF-8">
		<link rel = "stylesheet" href = "css/stileGenerale.css" type = "text/css">
		<title>ordine</title>
		<link href="css/stileGenerale.css" rel="stylesheet" type="text/css" >
		<link href="css/barraNavigazionalePrinc.css" rel="stylesheet" type="text/css">
		<link href ="css/footer.css" rel="stylesheet" type="text/css"> 
	</head>
	
	<body>
	<%@ include file = "fragments/barraNavigazionalePrinc.jsp" %>
	
	<div>
		<div>
			<p>Indirizzo Spedizione: ${ordine.delivery.via}, ${ordine.delivery.cap}, ${ordine.delivery.numeroCivico} </p>
		</div>
		<div>
			<p>Carta usata: ${ordine.carta.numeroCarta}</p>
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
				costoTotale += c.getPrezzo()*c.getQuantita();
			%>
			<tr>
				<td><img src = "immagine?codice=${composizione.prodotto.varianteProdotto.immaginiVariante[0].codice }" width="80" height="80"></td>
				<td><a href = "mostraProdotto?codice=${composizione.prodotto.varianteProdotto.codice}&codiceModello=${composizione.prodotto.varianteProdotto.modelloProdotto.codice}">
				${composizione.prodotto.varianteProdotto.modelloProdotto.nome}</a></td>
				<td>${composizione.prodotto.taglia}</td>
				<td>${composizione.prezzo * (1 + ordine.iva)}</td>
				<td>${composizione.quantita}<td>
			</tr>
			
			<%} %>
		</table>
		<h3>Costo totale = <%= costoTotale * (1 + ordine.getIva())  %> </h3>
	</div>
	
	<%@ include file = "fragments/footer.html" %>
	</body>
</html>