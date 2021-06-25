<%@page import="model.bean.UtenteBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
		<meta content="width=device-width, initial-scale=1" name="viewport" />
		<meta charset="UTF-8">
		<title>Pagina Utente</title>
		<link href="css/stileGenerale.css" rel="stylesheet" type="text/css" >
		<link href="css/barraNavigazionalePrinc.css" rel="stylesheet" type="text/css">
		<link href ="css/footer.css" rel="stylesheet" type="text/css"> 
		<link href="css/utente.css" rel="stylesheet" type="text/css">
	</head>
	
	<body>
	
		<%@ include file = "fragments/barraNavigazionalePrinc.jsp" %>
		<div class="utente">
		
			<h1> BENVENUTO NEL TUO PROFILO! </h1>
		  <div class="quadrati"> 
			
			<fieldset>
				<legend> Ordini </legend>
				<div class = "contenitore-immagine">
					<img src="/progetto-TSW/img/ordini.jpg" alt="immagine non visualizzabile">
				</div>
				<div class = "contenitore-bottone">
					<a href = "/progetto-TSW/ordini"> <button class = "bottoni"> i miei ordini </button></a>
				</div>
			</fieldset>
			
			<fieldset>
				<legend> Pagamento </legend>
				<div class = "contenitore-immagine">
					<img src="/progetto-TSW/img/metodiPagamento.png" alt="immagine non visualizzabile">
				</div>
				<div class = "contenitore-bottone">
					<a href = "/progetto-TSW/carte"> <button class = "bottoni"> i miei metodi di pagamento </button></a>
				</div>
			</fieldset>
			
			<fieldset>
				<legend> Spedizione </legend>
				<div class = "contenitore-immagine">
					<img src="/progetto-TSW/img/spedizione.jpg" alt="immagine non visualizzabile">
				</div>
				<div class = "contenitore-bottone">
					<a href = "/progetto-TSW/indirizzi"><button class = "bottoni">informazioni di consegna </button></a>
				</div>
			</fieldset>
			
		  </div>
				<a href = "/progetto-TSW/logout"><button id="uscita"> log-out </button></a>
		  
			
		</div>
		
		
		
		<%@ include file = "fragments/footer.html" %>
	
	</body>
</html>