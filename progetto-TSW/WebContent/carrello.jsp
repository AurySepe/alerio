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
	double iva =Double.parseDouble(application.getInitParameter("iva"));
    application.setAttribute("iva", iva);
%>
<html>
	<head>
		<meta content="width=device-width, initial-scale=1" name="viewport" />
		<link href="css/stileGenerale.css" rel="stylesheet" type="text/css" >
		<link href="css/barraNavigazionalePrinc.css" rel="stylesheet" type="text/css">
		<link href ="css/footer.css" rel="stylesheet" type="text/css"> 
		<link href ="css/carrello.css" rel="stylesheet" type="text/css"> 
		<meta charset="UTF-8">
		<title>Carrello</title>
	</head>
	<body>
	<%@ include file = "fragments/barraNavigazionalePrinc.jsp" %>
	<div id = "carrello">
		<div id = "prodotti">
		<%for(ItemCarrello item : cart.getElementi()) {
			request.setAttribute("item", item);
		%>
			<div id = "${item.prodotto.codice}" class = "prodotto">
				<div class = "immagine-prodotto">
					<a href = "mostraProdotto?codiceModello=${item.prodotto.varianteProdotto.modelloProdotto.codice}
						&codice=${item.prodotto.varianteProdotto.codice}">
						<img class = "immagine" alt="immagine prodotto" src="/progetto-TSW/immagine?codice=${item.prodotto.varianteProdotto.immaginiVariante[0].codice}">
					</a>
				</div>
				<div class = "informazioni-prodotto">
					<a class = "nome-prodotto" href = "mostraProdotto?codiceModello=${item.prodotto.varianteProdotto.modelloProdotto.codice}
						&codice=${item.prodotto.varianteProdotto.codice}">
						<span>${item.prodotto.varianteProdotto.modelloProdotto.nome}</span>
					</a>
					<span>Taglia: ${item.prodotto.taglia}</span>
					<span>Colore: ${item.prodotto.varianteProdotto.colore}</span>
					<div class = "contenitore-quantita">
						<select id = "${item.prodotto.codice}-select"  class = "quantita"  name = "quantita">
							<option value = "1">1</option>
							<option value = "2">2</option>
							<option value = "3">3</option>
							<option value = "4">4</option>
							<option value = "5">5</option>
						</select>
					</div>
				</div>
				<span class = "inserisci"></span>
				
				<div id = "${item.prodotto.codice}-cont-elimina" class = "contenitore-elimina">
					<img id = "${item.prodotto.codice}-elimina" class = "elimina" src="img/x.png">
				</div>
				
				 <div class = "prezzo">
					<span>${(item.prodotto.varianteProdotto.prezzoAttuale * (1 + iva)) * item.quantitaProdotto}€</span>
				</div>
			</div>
		
		<%} %>
		</div>
		<div id = "acquista">
			<div id = "contenitore-acquista">
				<span class = "titolo-riepilogo">Riepilogo dell'ordine</span>
				<div class = "riepilogo">
					<span>Prezzo Totale:</span><span class = "prezzo-totale">${carrello.costoTotale * (1 + iva) }</span>			
				</div>
				<div class = "contenitore-bottone-acquista"><a href = "mostraCheckout"><button class = "bottone-acquista">Procedi all'acquisto</button></a></div>
			</div>
		</div>
	</div>
		
	<%@ include file = "fragments/footer.html" %>
		<script src = "javascript/jquery-3.6.0.js"></script>
		<script src = "javascript/addToCart.js"></script>
		<script src = "javascript/validation.js"></script>
		<script type="text/javascript" src = "javascript/abbellimentiGenerali.js"></script>
		<script type="text/javascript">
			function successo(data)
			{
				var response = JSON.parse(data);
				if(response.quantita < 0)
				{
					$("#" + response.codice).remove();
				}
				else
				{
					$("#" + response.codice + " .prezzo > span").html( "" + (response.quantita * (response.prezzo * (${iva} + 1))) + "€") ;
				}
				mostraCheckout();
			}
			
			function resize()
			{
					if($(window).width() <= 767)
					{ 
				        $(".contenitore-elimina").each
				        (
				       	 	function()
				        	{
				        		var codice = parseInt($(this).attr("id"));
				        		$(this).insertAfter($("#"+codice + " .contenitore-quantita"));
					       	}
				
				        )
				        
				    }  
					else
					{
						
						 $(".contenitore-elimina").each
						 (
								 
						     function()
						     {
						        	var codice = parseInt($(this).attr("id"));

						        	$(this).insertAfter($("#"+codice + " .inserisci"));
						     }
						 )
					}
					
			}
			
			function errore()
			{
	
			}
			
			function mostraCheckout()
			{
				var costoTotale = 0;
				var length = 0;
				$(".prezzo > span").each(function(){ costoTotale += parseInt($(this).html()); length++});
				if(length == 0)
				{
					$("#acquista").hide();	
				}
				else
				{
					$("#acquista").show();	
				}
				$(".prezzo-totale").html(costoTotale + "€");
			}
		</script>
		<script type="text/javascript">
			$(document).ready
			(
				function()
				{
					mostraCheckout();
					abbellimentiGenerali();
					resize();
					$("select").change
					(
						function()
						{
							var request =  {"codice" : parseInt($(this).attr("id")), "quantita" : $(this).val()};
							addToCart(request,successo,errore);
						}
					)
					
					$(".elimina").click
					(
						function()
						{
							var request = { "codice" : parseInt($(this).attr("id")) };
							request.quantita = "-1";
							addToCart(request,successo,errore);
						}
					)
					$(window).resize(resize)	
				}
			)
		</script>
	</body>
</html>