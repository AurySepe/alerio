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
    %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Catalogo</title>
		<link href="css/stileGenerale.css" rel="stylesheet" type="text/css" >
		<link href="css/barraNavigazionalePrinc.css" rel="stylesheet" type="text/css">
		<link href ="css/footer.css" rel="stylesheet" type="text/css"> 
	</head>
	<body>
	<%@ include file = "fragments/barraNavigazionalePrinc.jsp" %>
		<table>
			<tr>
				<th><a href = "catalogo?ordine=nome">NOME</a></th>
				<th>COLORE</th>
				<th>Immagine</th>
				<th></th>
			</tr>
		<%
		for(ProductTemplateBean modello : catalogo) {
			for(TemplateColorVariantBean bean : modello.getVariantiModello()){
				request.setAttribute("bean", bean);
		%>
			<tr id = "variante-${bean.codice}" class = "variante">
				<td><a href = "mostraProdotto?codiceModello=${bean.modelloProdotto.codice}&codice=${bean.codice}">
				${bean.modelloProdotto.nome}</a></td>
				<td>${bean.colore}</td>
				<td><img class = "evidenziate" alt="immagine prodotto" src="immagine?codice=${bean.immaginiVariante[0].codice}" width = 100 height = 100></td>	
				<td><button type = "button" value="${bean.codice}"><img alt = "" src ="" width = 50 height = 50></button></td>
			</tr>
		
		<%}} %>
			
		</table>
		<%@ include file = "fragments/footer.html" %>
		<script src = "javascript/jquery-3.6.0.js"></script>
        <script type="text/javascript" src = "javascript/wish_list.js"></script>
        
        <script type="text/javascript">
        
        	$(document).ready
        	(
        		function()
        		{
        			attivaWishList();
        		}
        	)
        </script>
	</body>
</html>