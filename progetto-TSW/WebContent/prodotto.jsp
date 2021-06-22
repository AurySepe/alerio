<%@page import="model.bean.ImageBean"%>
<%@page import="model.bean.ProductBean"%>
<%@page import="model.bean.TemplateColorVariantBean"%>
<%@page import="model.bean.ProductTemplateBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    TemplateColorVariantBean bean = (TemplateColorVariantBean)request.getAttribute("prodotto");
        	if(bean == null)
        	{
        		response.sendRedirect("/catalogo");
        		return;
        	}
     double iva =Double.parseDouble(application.getInitParameter("iva"));
     application.setAttribute("iva", iva);
    %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title> ${prodotto.modelloProdotto.nome}</title>
		<link href="css/stileGenerale.css" rel="stylesheet" type="text/css" >
		<link href="css/barraNavigazionalePrinc.css" rel="stylesheet" type="text/css">
		<link href ="css/footer.css" rel="stylesheet" type="text/css"> 
	</head>
	<body>
	<%@ include file = "fragments/barraNavigazionalePrinc.jsp" %>
		<ul>
	<%
	for(TemplateColorVariantBean templateVariant : bean.getModelloProdotto().getVariantiModello()) {
		request.setAttribute("templateVariant", templateVariant);
	%>
		
			
			<li><a href="mostraProdotto?codiceModello=${templateVariant.modelloProdotto.codice }&codice=${templateVariant.codice}">${templateVariant.colore }</a></li>
	<%} %>
		</ul>
		<h1>${prodotto.modelloProdotto.nome}</h1>
		<h3>Colore: ${prodotto.colore}</h3>
		<h3>Collezione: ${prodotto.modelloProdotto.collezione}</h3>
		<h3>Genere: ${prodotto.genere}</h3>
		<h3>Prezzo: ${prodotto.prezzoAttuale * (iva + 1)}</h3>
		<p>${prodotto.modelloProdotto.informazioni}</p>
		<%for(ImageBean image : bean.getImmaginiVariante()) {
			request.setAttribute("immagine", image);
		%>
		<img class = "evidenziate" alt="immagine prodotto" src="immagine?codice=${immagine.codice}" width="300" height="300">
		<%} %>
		<div id = "variante-${prodotto.codice}" class = "variante">	
			<button type = "button" value="${prodotto.codice}"><img alt = "" src ="" width = 50 height = 50></button>
		</div>
		<ol type = "I">
			<%for(ProductBean product : bean.getProdotti()) {
				request.setAttribute("product", product);
			%>
				<li><input class = "taglia" name = "codice" type = "radio" value = "${product.codice}" required>${product.taglia}<li>
			<%} %>
		</ol>
		<Button id = "bottone" type = "button" value = ""><img alt = "" src = "" width = 25 height = 25></Button>
		<%@ include file = "fragments/footer.html" %>
		<script src = "javascript/jquery-3.6.0.js"></script>
		<script src = "javascript/addToCart.js"></script>
		<script src = "javascript/carrello.js"></script>
		<script type="text/javascript" src = "javascript/wish_list.js"></script>
		<script type="text/javascript">
			$(document).ready
			(
				function()
				{
					inizializzaCart();
					attivaWishList();
				}
			)
		</script>
	</body>
</html>