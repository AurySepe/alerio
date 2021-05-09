<%@page import="model.TemplateColorVariantBean"%>
<%@page import="model.ImageBean"%>
<%@page import="model.ProductTemplateBean"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
    Collection<ProductTemplateBean> catalogo =(Collection<ProductTemplateBean>) request.getAttribute("catalogo");
            	if(catalogo == null)
            	{
            		response.sendRedirect("/catalogo");
            		return;
            	}
    %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Catalogo</title>
	</head>
	<body>
	<%@ include file = "fragments/barraNavigazionale.jsp" %>
		<table>
			<tr>
				<th><a href = "catalogo?ordine=nome">NOME</a></th>
				<th>COLORE</th>
				<th>Immagine</th>
			</tr>
		<%
		for(ProductTemplateBean modello : catalogo) {
			for(TemplateColorVariantBean bean : modello.getVariantiModello()){
				request.setAttribute("bean", bean);
		%>
			<tr>
				<td><a href = "mostraProdotto?codiceModello=${bean.modelloProdotto.codice}&codice=${bean.codice}">
				${bean.modelloProdotto.nome}</a></td>
				<td>${bean.colore}</td>
				<td><img alt="immagine prodotto" src="immagine?codice=${bean.immaginiVariante[0].codice}" width = 100 height = 100></td>	
			</tr>
		
		<%}} %>
			
		</table>
	</body>
</html>