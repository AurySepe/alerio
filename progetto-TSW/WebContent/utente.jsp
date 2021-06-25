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
				<img src="/progetto-TSW/img/ordini.jpg" alt="immagine non visualizzabile">
				<br>
				<a href = "/progetto-TSW/ordini"> <button> vai ai miei ordini </button></a>
			</fieldset>
			
			<fieldset>
				<legend> Pagamento </legend>
				<img src="/progetto-TSW/img/metodiPagamento.png" alt="immagine non visualizzabile">
				<br>
				<a href = "/progetto-TSW/carte"> <button> vai ai miei metodi di pagamento </button></a>
			</fieldset>
			
			<fieldset>
				<legend> Spedizione </legend>
				<img src="/progetto-TSW/img/spedizione.jpg" alt="immagine non visualizzabile">
				<br>
				<a href = "/progetto-TSW/indirizzi"><button> vai alle informazioni di consegna </button></a>
			</fieldset>
			
		  </div>
				<a href = "/progetto-TSW/logout"><button id="uscita"> log-out </button></a>
		  
			
		</div>
		
		
		
		<%@ include file = "fragments/footer.html" %>
	
	</body>
</html>