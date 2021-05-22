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
		<%for(ProductBean prodotto : variante.getProdotti())
		   {
			request.setAttribute("prodotto", prodotto);	
		
		%>
			<div>
				<span>quantità ${prodotto.taglia}</span><input value = "${prodotto.quantita}" type = "number" name = "quantita-${prodotto.taglia}" >
			</div>
		<% } %>
			<button type = "submit">aggiorna</button>
		</form>
		</div>
	</body>
</html>