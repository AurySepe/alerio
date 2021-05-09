<%@page import="model.ImageBean"%>
<%@page import="model.ProductBean"%>
<%@page import="model.TemplateColorVariantBean"%>
<%@page import="model.ProductTemplateBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
    TemplateColorVariantBean bean = (TemplateColorVariantBean)request.getAttribute("prodotto");
        	if(bean == null)
        	{
        		response.sendRedirect("/catalogo");
        		return;
        	}
    %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title> ${prodotto.modelloProdotto.nome}</title>
	</head>
	<body>
	<%@ include file = "fragments/barraNavigazionale.jsp" %>
	<%
	for(TemplateColorVariantBean templateVariant : bean.getModelloProdotto().getVariantiModello()) {
		request.setAttribute("templateVariant", templateVariant);
	%>
		<p>
		<a href="mostraProdotto?codiceModello=${templateVariant.modelloProdotto.codice }&codice=${templateVariant.codice}">${templateVariant.colore }</a>
		</p>
	<%} %>
		<h1>${prodotto.modelloProdotto.nome}</h1>
		<h3>Colore: ${prodotto.colore}</h3>
		<h3>Collezione: ${prodotto.modelloProdotto.collezione}</h3>
		<h3>Prezzo: ${prodotto.prezzoAttuale}</h3>
		<p>${prodotto.modelloProdotto.informazioni}</p>
		<%for(ImageBean image : bean.getImmaginiVariante()) {
			request.setAttribute("immagine", image);
		%>
		<img alt="immagine prodotto" src="immagine?codice=${immagine.codice}" width="300" height="300">
		<%} %>
		<form name = "aggiungi al carrello" action = "aggiungiCarrello" method = "Post">
		<ol type = "none">
			<%for(ProductBean product : bean.getProdotti()) {
				request.setAttribute("product", product);
			%>
				<li><input name = "codice" type = "radio" value = "${product.codice}" required>${product.taglia}<li>
			<%} %>
		</ol>
		<Button type = "submit">Aggiungi al carrello</Button>
		</form><br/>
	</body>
</html>