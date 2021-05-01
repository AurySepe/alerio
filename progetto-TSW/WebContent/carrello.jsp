<%@page import="model.ItemCarrello"%>
<%@page import="model.Carrello"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
	Carrello cart = (Carrello)session.getAttribute("carrello");
	if(cart == null)
	{
		response.sendRedirect("carrello"); 
		return;		
	}
%>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Carrello</title>
	</head>
	<body>
	<table>
			<tr>
				<td>NOME</a></td>
				<td>PREZZO</td>
				<td>QUANTITA</td>
				<td>PREZZO TOTALE</td>
				<td></td>
			</tr>
		<%for(ItemCarrello item : cart.getElementi()) {
			request.setAttribute("item", item);
		%>
			<tr>
				<td><a href = "mostraProdotto?codice=${item.bean.codice}">${item.bean.nome}</a></td>
				<td>${item.bean.prezzo}</td>
				<td>${item.quantitaProdotto}</td>
				<td>${item.bean.prezzo * item.quantitaProdotto}</td>
				<td>
					<form name = "aggiungi al carrello" action = "aggiungiCarrello" method = "Post">
						<input type = "hidden" value = "${item.bean.codice}" name = "codice">
						<input type = "number" min = "0"   name = "quantita">
						<Button type = "submit">modifica quantità</Button>
					</form><br/>
					<form name = "rimuovi dal carrello" action = "aggiungiCarrello" method = "Post">
						<input type = "hidden" value = "${item.bean.codice}" name = "codice">
						<input type = "hidden" value = "-1"  name = "quantita">
						<Button type = "submit">elimina</Button>
					</form><br/>
				</td>
				
			</tr>
		
		<%} %>
			
		</table>
		<% if(!cart.isEmpty()) {%>
			<form name = "checkout" action="checkout" method = "post">
				<p>Effettua il checkout</p>
				<button type = "submit">Checkout</button>
				<p>Costo:${carrello.costoTotale}</p>
			</form>
		<%} %>
	</body>
</html>