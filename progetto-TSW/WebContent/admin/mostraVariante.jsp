<%@page import="model.bean.ProductBean"%>
<%@page import="model.bean.ImageBean"%>
<%@page import="model.bean.TemplateColorVariantBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	TemplateColorVariantBean variante = (TemplateColorVariantBean)request.getAttribute("variante");
	if(variante == null)
	{
		response.sendRedirect("admin");
		return;
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Variante</title>
		<link href="/progetto-TSW/css/stileGenerale.css" rel="stylesheet" type="text/css" >
	</head>
	<body>
		<%@ include file = "../fragments/admin/BarraNavigazionaleAdmin.jsp" %>
		<div>
			<h1><a href = "modello?codice=${variante.codiceModello}">${variante.modelloProdotto.nome}</a></h1>
			<h3>${variante.colore}</h3>
		</div>
		<div>
		<%for(ImageBean immagine : variante.getImmaginiVariante()) 
			{
				request.setAttribute("immagine", immagine);
		
		%>
			<div>
				<img alt="immagine prodotto" src="../immagine?codice=${immagine.codice}" width="50" height="50">
			</div>
		<%	} %>
		</div>
		<div>
		<form id = "modificaVariante" method="post" action = "modificaVariante">
		<input type = "hidden" value = "${variante.codice}" name = "codice">
		<div class = "input" id = "prezzo">
				<span>prezzo</span><input value = "${variante.prezzoAttuale}" type = "number" name = "prezzo"><br/>
				<span class = "errore"></span>
		</div>
		<%for(ProductBean prodotto : variante.getProdotti())
		   {
			request.setAttribute("prodotto", prodotto);	
		
		%>
			<div class = "input taglia" id = "${prodotto.taglia}">
				<span>quantità ${prodotto.taglia}</span>
				<input  value = "${prodotto.quantita}" type = "number" name = "quantita-${prodotto.taglia}" ><br/>
				<span class = "errore"></span>
			</div>
		<% } %>
			<button id = "submit" type = "button">aggiorna</button>
		</form>
		</div>
		<script src = "../javascript/jquery-3.6.0.js"></script>
		<script src = "/progetto-TSW/javascript/validation/mostraVariante.js"></script>
		<script src = "/progetto-TSW/javascript/validation.js"></script>
		<script type="text/javascript">
			$(document).ready
			(
				function()
				{
					validazioneVariante();
				}
			)
		</script>
	</body>
</html>