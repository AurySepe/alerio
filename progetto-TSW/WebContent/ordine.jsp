<%@page import="model.bean.ComposizioneBean"%>
<%@page import="model.bean.ProductBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
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
	DateFormat format = new SimpleDateFormat("MM/yyyy");
	double costoTotale = 0;
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta content="width=device-width, initial-scale=1" name="viewport" />
		<link rel = "stylesheet" href = "css/stileGenerale.css" type = "text/css">
		<title>ordine</title>
		<link href="css/stileGenerale.css" rel="stylesheet" type="text/css" >
		<link href="css/barraNavigazionalePrinc.css" rel="stylesheet" type="text/css">
		<link href ="css/footer.css" rel="stylesheet" type="text/css"> 
		<link href ="css/ordine.css" rel="stylesheet" type="text/css"> 
	</head>
	
	<body>
	<%@ include file = "fragments/barraNavigazionalePrinc.jsp" %>
	<div id = ordine>
		<div class = "contenitore-indirizzo">
			<h1 class = "consegna">Indirizzo di consegna</h1>
			<div class = "indirizzo">
				<div>${ordine.delivery.nominativo}</div>
				<div>, ${ordine.delivery.citta}, ${ordine.delivery.cap}, ${ordine.delivery.via}, ${ordine.delivery.numeroCivico}</div>
				<div>, ${ordine.delivery.telefono}</div>
			</div>
		</div>
		<div class = "contenitore-carta">
		<h1 class = "nome-carta">Carta utilizzata</h1>
		<div class = "contenuto-carta">
			<div class = "numero-immagine">
				<div class  = "contenitore-immagine-carta" >
					<img class = "immagine-carta" alt = "immagine carta" src = "img/card.png">
				</div>							
				<div class = "numero-carta">${ordine.carta.numeroCarta}</div>
			</div>
			<div class = "nominativo-carta">${ordine.carta.nominativo}</div>
			<div class = "scadenza-carta"><%= format.format(ordine.getCarta().getDataScadenza()) %></div>
		</div>
		</div>
	
	<div id = prodotti>
		<%for(ComposizioneBean comp : ordine.getComposizione()) {
			request.setAttribute("composizione", comp);
			costoTotale += comp.getPrezzo()*comp.getQuantita();
		%>
			<div id = "${composizione.prodotto.codice}" class = "prodotto">
				<div class = "immagine-prodotto">
					<a href = "mostraProdotto?codiceModello=${composizione.prodotto.varianteProdotto.modelloProdotto.codice}
						&codice=${composizione.prodotto.varianteProdotto.codice}">
						<img class = "immagine" alt="immagine prodotto" src="/progetto-TSW/immagine?codice=${composizione.prodotto.varianteProdotto.immaginiVariante[0].codice}">
					</a>
				</div>
				<div class = "informazioni-prodotto">
					<a class = "nome-prodotto" href = "mostraProdotto?codiceModello=${composizione.prodotto.varianteProdotto.modelloProdotto.codice}
						&codice=${composizione.prodotto.varianteProdotto.codice}">
						<span>${composizione.prodotto.varianteProdotto.modelloProdotto.nome}</span>
					</a>
					<span>${composizione.prodotto.taglia}</span>
					<span>${composizione.prodotto.varianteProdotto.colore}</span>
					<span>${composizione.quantita}</span>
					<span class = "prezzo-elementi">${(composizione.prezzo * (1 + ordine.iva)) * composizione.quantita}€</span>
				</div>
			</div>
		
		<%} %>
		<h1>Costo totale = <%= String.format("%.2f",costoTotale * (1 + ordine.getIva()))  %>€</h1>
		<h1>Iva : ${ordine.iva}%</h1>
		</div>
	</div>
	
	<%@ include file = "fragments/footer.html" %>
	</body>
</html>