<%@page import="model.bean.ProductBean"%>
<%@page import="model.bean.ImageBean"%>
<%@page import="model.bean.TemplateColorVariantBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
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
		<meta charset="ISO-8859-1">
		<title>Variante</title>
		<link href="css/stileGenerale.css" rel="stylesheet" type="text/css" >
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
		<div>
				<span>prezzo</span><input value = "${variante.prezzoAttuale}" type = "number" name = "prezzo" >
		</div>
		<%for(ProductBean prodotto : variante.getProdotti())
		   {
			request.setAttribute("prodotto", prodotto);	
		
		%>
			<div>
				<span>quantità ${prodotto.taglia}</span><input  value = "${prodotto.quantita}" type = "number" name = "quantita-${prodotto.taglia}" >
			</div>
		<% } %>
		</form>
			<button id = "submit">aggiorna</button>
		</div>
		<script src = "../javascript/jquery-3.6.0.js"></script>
		<script type="text/javascript">
			$(document).ready
			(
				function()
				{
					$("#submit").click
					(
						function()
						{
							var dati = {};
							$("#modificaVariante input").each
							(
								function()
								{
									dati[$(this).attr("name")] = $(this).val();
								}
							)
							var wrapper = {"richiesta" : JSON.stringify(dati)};
							
							$.post("/progetto-TSW/admin/modificaVariante",wrapper,function(){});
						}
					)
				}
			)
		</script>
	</body>
</html>