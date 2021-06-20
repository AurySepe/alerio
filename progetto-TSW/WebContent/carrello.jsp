<%@page import="model.ItemCarrello"%>
<%@page import="model.Carrello"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<link href="css/stileGenerale.css" rel="stylesheet" type="text/css" >
		<link href="css/barraNavigazionalePrinc.css" rel="stylesheet" type="text/css">
		<link href ="css/footer.css" rel="stylesheet" type="text/css"> 
		<meta charset="UTF-8">
		<title>Carrello</title>
	</head>
	<body>
	<%@ include file = "fragments/barraNavigazionalePrinc.jsp" %>
	<table>
			<tr>
				<th>NOME</th>
				<th>PREZZO</th>
				<th>TAGLIA</th>
				<th>COLORE</th>
				<th>QUANTITA</th>
				<th>PREZZO TOTALE</th>
				<th></th>
				
			</tr>
		<%for(ItemCarrello item : cart.getElementi()) {
			request.setAttribute("item", item);
		%>
			<tr id = "${item.prodotto.codice}">
				<td><a href = "mostraProdotto?codiceModello=${item.prodotto.varianteProdotto.modelloProdotto.codice}
				&codice=${item.prodotto.varianteProdotto.codice}">
				${item.prodotto.varianteProdotto.modelloProdotto.nome}</a></td>
				<td>${item.prodotto.varianteProdotto.prezzoAttuale}</td>
				<td>${item.prodotto.taglia}</td>
				<td>${item.prodotto.varianteProdotto.colore}</td>
				<td class = "numero">${item.quantitaProdotto}</td>
				<td class = "prezzo">${item.prodotto.varianteProdotto.prezzoAttuale * item.quantitaProdotto}</td>
				<td>
					<div>
						<input class = "quantita" type = "number" min = "1"   name = "quantita">
						<Button class = "aggiorna" type = "submit" value = "${item.prodotto.codice}">modifica quantità</Button><br>
						<span class = "errore"></span>
					</div>
					<div>
						<Button class = "elimina" type = "submit" value = "${item.prodotto.codice}">elimina</Button>
					</div>
				</td>
				
			</tr>
		
		<%} %>
			
		</table>
			<form id = "checkout" name = "checkout" action="mostraCheckout" method = "post">
				<p>Effettua il checkout</p>
				<button type = "submit">Checkout</button>
				<p id = "Costo">Costo:${carrello.costoTotale}</p>
			</form>
		
		<%@ include file = "fragments/footer.html" %>
		<script src = "javascript/jquery-3.6.0.js"></script>
		<script src = "javascript/addToCart.js"></script>
		<script src = "javascript/validation.js"></script>
		<script type="text/javascript">
			function successo(data)
			{
				var response = JSON.parse(data);
				console.log(response);
				console.log($(this).attr("data"));
				if(response.quantitaProdotto < 0)
				{
					$("#" + response.prodotto.codice).remove();
				}
				else
				{
					$("#" + response.prodotto.codice + " td.numero").html(response.quantitaProdotto);
					$("#" + response.prodotto.codice + " td.prezzo").html( "" + (response.quantitaProdotto * response.prodotto.varianteProdotto.prezzoAttuale));
				}
				mostraCheckout();
			}
			
			function errore()
			{
				alert("errore");
			}
			
			function mostraCheckout()
			{
				var costoTotale = 0;
				$("td.prezzo").each(function(){ costoTotale += parseInt($(this).html())});
				if(costoTotale == 0)
				{
					$("#checkout").hide();	
				}
				else
				{
					$("#checkout").show();	
				}
				$("#Costo").html("Costo: " + costoTotale);
			}
		</script>
		<script type="text/javascript">
			$(document).ready
			(
				function()
				{
					mostraCheckout();
					
					$("button.aggiorna").click
					(
						function()
						{
							var request = { "codice" : $(this).val() };
							request.quantita = $("#" + request.codice + " input.quantita").val();
							if(regQuantita(request.quantita) && parseInt(request.quantita) > 0)
							{
								$("#" + request.codice + " span.errore").html("");
								addToCart(request,successo,errore);
							}
							else
							{
								$("#" + request.codice + " span.errore").html("quantità non valida");
							}
						}
					)
					$("button.elimina").click
					(
						function()
						{
							var request = { "codice" : $(this).val() };
							request.quantita = "-1";
							addToCart(request,successo,errore);
						}
					)
				}
			)
		</script>
	</body>
</html>