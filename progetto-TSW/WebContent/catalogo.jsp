<%@page import="model.ImageBean"%>
<%@page import="model.ProductBean"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
	Collection<ProductBean> catalogo =(Collection<ProductBean>) request.getAttribute("catalogo");
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
		<table>
			<tr>
				<th><a href = "catalogo?ordine=nome">NOME</a></th>
				<th><a href = "catalogo?ordine=prezzo_attuale">PREZZO</a></th>
				<th><a href = "catalogo?ordine=taglia">TAGLIA</a></th>
				<th>Immagine</th>
				<th>AZIONI</th>
			</tr>
		<%for(ProductBean bean : catalogo) {
			request.setAttribute("bean", bean);
		%>
			<tr>
				<td><a href = "mostraProdotto?codice=${bean.codice}">${bean.nome}</a></td>
				<td>${bean.prezzo}</td>
				<td> ${bean.taglia}</td>
				<td><img alt="immagine prodotto" src="immagine?codice=${bean.immagini[0].codice}" width = 100 height = 100></td>
				<td>
					<form name = "aggiungi al carrello" action = "aggiungiCarrello" method = "Post">
						<input type = "hidden" value = "${bean.codice}" name = "codice">
						<Button type = "submit">Aggiungi al carrello</Button>
					</form><br/>
					<form name = "vedi descrizione" action = "mostraProdotto" method = "Post">
						<input type = "hidden" value = "${bean.codice}" name = "codice">
						<Button type = "submit">Descrizione</Button>
					</form><br/>
				</td>
				
			</tr>
		
		<%} %>
			
		</table>
		<h1><a href = "carrello">Vai al carrello</a></h1>
	</body>
</html>