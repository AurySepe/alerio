<%@page import="model.bean.TemplateColorVariantBean"%>
<%@page import="model.bean.ImageBean"%>
<%@page import="model.bean.ProductTemplateBean"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    Collection<ProductTemplateBean> catalogo =(Collection<ProductTemplateBean>) request.getAttribute("catalogo");
    if(catalogo == null)
    {
    	response.sendRedirect("catalogo");
    	return;
    }
    double iva =Double.parseDouble(application.getInitParameter("iva"));
    application.setAttribute("iva", iva);
    %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta content="width=device-width, initial-scale=1" name="viewport" />
		<title>Catalogo</title>
		<link href="css/stileGenerale.css" rel="stylesheet" type="text/css" >
		<link href="css/barraNavigazionalePrinc.css" rel="stylesheet" type="text/css">
		<link href ="css/footer.css" rel="stylesheet" type="text/css"> 
		<link href ="css/catalogo.css" rel="stylesheet" type="text/css"> 
	</head>
	<body>
	<%@ include file = "fragments/barraNavigazionalePrinc.jsp" %>
	<div id = "catalogo">
		<div id = "prodotti">
		<%
		for(ProductTemplateBean modello : catalogo) {
			for(TemplateColorVariantBean bean : modello.getVariantiModello()){
				request.setAttribute("bean", bean);
		%>
			<div class = "variante" id = "variante-${bean.codice}">
				<div class = "wishlist-container">
					<div class = "contenitore-immagine-wishlist">
						<button class = "bottone-immagine-wishlist" type = "button" value = "${bean.codice}"><img class = "immagine-wishlist"></button>
					</div>
				</div>
				<a href = "mostraProdotto?codiceModello=${bean.modelloProdotto.codice }&codice=${bean.codice}">
				<div class = "contenitore-immagine">
					<img class = "immagine evidenziate" src = "immagine?codice=${bean.immaginiVariante[0].codice}" alt = "immagine variante">
				</div>
				<div class = "contenitore-nome">
					<span class = "nome">${bean.modelloProdotto.nome}</span>
				</div>
				<div class = "contenitore-prezzo">
					<span class = "prezzo"><%= String.format("%.2f",bean.getPrezzoAttuale() * (1 + iva)) %>€</span>
				</div>
				</a>
			</div>
		
		<%}} %>
		</div>	
	</div>
		<%@ include file = "fragments/footer.html" %>
		<script src = "javascript/jquery-3.6.0.js"></script>
        <script type="text/javascript" src = "javascript/wish_list.js"></script>
        
        <script type="text/javascript">
        
        	$(document).ready
        	(
        		function()
        		{
        			attivaWishList("variante",WishListSuccess);
        			var enter = 
        			function()
        			{
        				$(this).find(".contenitore-immagine-wishlist").css("visibility","visible");
        			}
        			var exit = 
        			function()
        			{
        				$(this).find(".contenitore-immagine-wishlist").css("visibility","hidden");
        			}
        			$(".variante").hover(enter,exit);
        		}
        	)
        </script>
	</body>
</html>