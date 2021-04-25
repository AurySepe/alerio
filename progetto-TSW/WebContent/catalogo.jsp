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
				<td><a href = "catalogo?ordine=nome">NOME</a></td>
				<td><a href = "catalogo?ordine=prezzo_attuale">PREZZO</a></td>
				<td><a href = "catalogo?ordine=taglia">TAGLIA</a></td>
				<td>AZIONI</td>
			</tr>
		<%for(ProductBean bean : catalogo) {%>
			<tr>
				<td><%= bean.getNome()%></td>
				<td><%= bean.getPrezzo()%></td>
				<td><%= bean.getTaglia()%></td>
				<td>
					<form name = "aggiungi al carrello" action = "aggiungiCarrello" method = "Post">
						<input type = "hidden" value = <%= bean.getCodice() %> name = "codice">
						<Button type = "submit">Aggiungi al carrello</Button>
					</form><br/>
					<form name = "vedi descrizione" action = "mostraProdotto" method = "Post">
						<input type = "hidden" value = <%= bean.getCodice() %> name = "codice">
						<Button type = "submit">Descrizione</Button>
					</form><br/>
				</td>
				
			</tr>
		
		<%} %>
			
		</table>
		<h1><a href = "carrello">Vai al carrello</a></h1>
	</body>
</html>