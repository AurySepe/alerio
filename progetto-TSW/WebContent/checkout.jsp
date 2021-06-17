<%@page import="model.Carrello"%>
<%@page import="model.ItemCarrello"%>
<%@page import="model.bean.DeliveryBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="model.bean.CreditCardBean"%>
<%@page import="java.util.Collection"%>
<%@page import="model.bean.UtenteBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    UtenteBean utente = (UtenteBean) request.getAttribute("utente");
    Collection<CreditCardBean> carte = (Collection<CreditCardBean>) request.getAttribute("carte");
    Collection<DeliveryBean> indirizzi = (Collection<DeliveryBean>) request.getAttribute("indirizzi");
    Carrello cart = (Carrello) request.getAttribute("carrello");
    DateFormat format = new SimpleDateFormat("MM/yyyy");
	if(carte == null)
	{
		response.sendRedirect(response.encodeURL("carte"));
		return;
	}
    %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Checkout</title>
		<link href="css/stileGenerale.css" rel="stylesheet" type="text/css" >
		<link href="css/barraNavigazionalePrinc.css" rel="stylesheet" type="text/css">
		<link href ="css/footer.css" rel="stylesheet" type="text/css"> 
	</head>
	<body>
		<%@ include file = "fragments/barraNavigazionalePrinc.jsp" %>
		<div id = "checkout">
			<form action="checkout" name = "checkout" method = "post">
				<fieldset>
					<legend>indirizzo di spedizione</legend>
					<div>
						<% for(DeliveryBean delivery : indirizzi ) {
							request.setAttribute("indirizzo", delivery);
						%>
						<div>
							<input type = "radio" name = "indirizzo" value = "${indirizzo.codice}" required>
							<div class = "indirizzo">
								<div>${indirizzo.citta}, ${indirizzo.cap}, ${indirizzo.via}, ${indirizzo.numeroCivico}</div>
								<div>Nominativo: ${indirizzo.nominativo}</div>
								<div>Telefono: ${indirizzo.telefono}</div>
							</div>
						</div>
			
						<%} %>
						<div id = "aggiungi-indirizzo">
							<div>
								<div>Città: <input type = "text" name = "citta"></div>
								<div>Cap: <input type = "text" name = "cap"></div>
								<div>Via: <input type = "text" name = "via"></div>
								<div>numero civico: <input type = "number" name = "numeroCivico"></div>
								<div>Nominativo: <input type = "text" name = "nominativo"></div>
								<div>Telefono: <input type = "text" name = "telefono"></div>
								<input type = "hidden" name = "emailCliente" value = "${utente.email}">
							</div>
				
							<div>
								<button type = "button" id = "nuovoIndirizzo">aggiungi</button>
							</div>
						</div>
					</div>
				</fieldset>
				<fieldset>
					<legend>Metodo di pagamento</legend>
					<div>
						<% for(CreditCardBean creditCard : carte ) {
							request.setAttribute("carta", creditCard);
						%>
						<div>
							<input type = "radio" name = "carta" value = "${carta.codice}" required>
							<div class = "carta">
								<div>${carta.numeroCarta}</div>
								<div><span><%= format.format(creditCard.getDataScadenza()) %></span>  <span>${carta.nominativo}</span></div>
							</div>
						</div>
						<%} %>
					</div>
					<div id = "aggiungi-carta">
							<div>
								<div>Numero Carta: <input type = "text" maxlength="20" name = "numeroCarta"></div>
								<div>
									<span>Data di scadenza: <input type = "date"  name = "dataScadenza"></span>  
									<span>Nominativo: <input type = "text"  name = "nominativo"></span>
									<input type = "hidden" value = "${utente.email}" name = "emailCliente">
								</div>
							</div>
							<div>
								<button type = "button" id = "nuovaCarta">aggiungi</button>
							</div>
					</div>
				</fieldset>
				<fieldset>
					<legend>Riepilogo ordine</legend>
					<div>
						<table>
							<tr>
								<th>NOME</th>
								<th>PREZZO</th>
								<th>TAGLIA</th>
								<th>COLORE</th>
								<th>QUANTITA</th>
								<th>PREZZO TOTALE</th>
				
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
				
							</tr>
		
							<%} %>
			
						</table>
					</div>
					<div>
						Totale:${carrello.costoTotale}
					</div>
				</fieldset>
				<div>
					<button type = "submit">acquista</button>
				</div>
			</form>
		</div>
		<%@ include file = "fragments/footer.html" %>
		<script src = "javascript/jquery-3.6.0.js"></script>
		<script type="text/javascript" src = "javascript/indirizzo.js"></script>
		<script type="text/javascript" src = "javascript/carta.js"></script>
		<script type="text/javascript">
		function successIndirizzo(data)
		{
			data = JSON.parse(data);
			var id = "indirizzo-" + data.codice;
			var s = 
			"<div>\n" +
			"<input id = '" + id +"' type = 'radio' name = 'indirizzo' value = '" + data.codice +"' required>" +
			"<div class = 'indirizzo'>\n" +
				"<div>" + data.citta + ", "+ data.cap +", "+ data.via +", "+ data.numeroCivico +"</div>\n" +
				"<div>Nominativo: "+ data.nominativo +"</div>\n" +
				"<div>Telefono: "+ data.telefono +"</div>\n" +
			"</div>\n"+
			"</div>\n";
			
			
			$(s).insertBefore( $( "#aggiungi-indirizzo" ) );
			$("#" + id).attr('checked', true);
			
		}
		
		function successCarta(data)
		{
			data = JSON.parse(data);
			var date = new Date(data.dataScadenza);
			data.dataScadenza = "" + (date.getMonth() + 1).toLocaleString('en-US', { minimumIntegerDigits: 2,useGrouping: false})
			    + "/" + (date.getFullYear()) 
			var id = "carta-"+data.codice;
			var s = 
			"<div>" +
				"<input id = '" + id + "' type = 'radio' name = 'carta' value = '"+ data.codice +"' required>" +
				"<div class = 'carta'><div>" + data.numeroCarta + "</div>\n " +
				"<div><span>" + data.dataScadenza + "</span>  <span>" + data.nominativo + "</span></div></div>" +
			"</div>";
			$(s).insertBefore( $( "#aggiungi-carta" ) );
			$("#" + id).attr('checked', true);
			
		};
		</script>
		<script type="text/javascript">
			$(document).ready
			(
				function()
				{
					nuovoIndirizzo(successIndirizzo);
					nuovaCarta(successCarta);
					
				}
			)
		</script>
	</body>
</html>