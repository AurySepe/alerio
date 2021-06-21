UTF-8<%@page import="model.Carrello"%>
<%@page import="model.ItemCarrello"%>
<%@page import="model.bean.DeliveryBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="model.bean.CreditCardBean"%>
<%@page import="java.util.Collection"%>
<%@page import="model.bean.UtenteBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
	double iva =Double.parseDouble(application.getInitParameter("iva"));
    application.setAttribute("iva", iva);
    %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Checkout</title>
		<link href="css/stileGenerale.css" rel="stylesheet" type="text/css" >
		<link href="css/barraNavigazionalePrinc.css" rel="stylesheet" type="text/css">
		<link href ="css/footer.css" rel="stylesheet" type="text/css"> 
	</head>
	<body>
		<%@ include file = "fragments/barraNavigazionalePrinc.jsp" %>
		<div id = "checkout">
			<form action="checkout" name = "checkout" method = "post" id = "checkout-form">
				<fieldset id = "indirizzo">
					<legend>indirizzo di spedizione</legend>
					<div>
						<% for(DeliveryBean delivery : indirizzi ) {
							request.setAttribute("indirizzo", delivery);
						%>
						<div>
							<input class = "indirizzo-radio" type = "radio" name = "indirizzo" value = "${indirizzo.codice}" required>
							<div class = "indirizzo">
								<div>${indirizzo.citta}, ${indirizzo.cap}, ${indirizzo.via}, ${indirizzo.numeroCivico}</div>
								<div>Nominativo: ${indirizzo.nominativo}</div>
								<div>Telefono: ${indirizzo.telefono}</div>
							</div>
						</div>
			
						<%} %>
						<div id = "aggiungi-indirizzo">
								<div>
					
									<div class = "input" id = "citta">
										Città: <br/>
										<input type = "text" name = "citta"><br/>
										<span class = "errore"></span>
									</div>
									<div class = "input" id = "cap">
										Cap: <br/>
										<input type = "text" name = "cap"><br/>
										<span class = "errore"></span>
									</div>
									<div class = "input" id = "via">
										Via: <br/>
										<input type = "text" name = "via"><br/>
										<span class = "errore"></span>	
									</div>
									<div class = "input" id = "numeroCivico">
										numero civico: <br/>
										<input type = "number" name = "numeroCivico"><br/>
										<span class = "errore"></span>
									</div>
									<div class = "input" id = "nominativoIndirizzo">
										Nominativo: <br/>
										<input type = "text" name = "nominativo"><br/>
										<span class = "errore"></span>
									</div>
									<div class = "input" id = "telefono">
										Telefono: <br/>
										<input type = "text" name = "telefono"><br/>
										<span class = "errore"></span>
									</div>
									<input type = "hidden" name = "emailCliente" value = "${utente.email}">
								</div>
								<div>
									<button id = "nuovoIndirizzo" type = "button">aggiungi</button>
								</div>
						</div>
					</div>
					<span class = "errore"></span>
				</fieldset>
				<fieldset id = "pagamento">
					<legend>Metodo di pagamento</legend>
					<div>
						<% for(CreditCardBean creditCard : carte ) {
							request.setAttribute("carta", creditCard);
						%>
						<div>
							<input class = "carta-radio" type = "radio" name = "carta" value = "${carta.codice}" required>
							<div class = "carta">
								<div>${carta.numeroCarta}</div>
								<div><span><%= format.format(creditCard.getDataScadenza()) %></span>  <span>${carta.nominativo}</span></div>
							</div>
						</div>
						<%} %>
					</div>
					<div id = "aggiungi-carta">
				
						<div>
							<div class = "input" id = "numeroCarta">
								Numero Carta:<br/>
								<input type = "text" maxlength="20" name = "numeroCarta"><br/>
								<span class = "errore"></span>
							</div>
						<div>
							<div class = "input" id = "dataScadenza">					
								<span>Data di scadenza:</span><br/>
								<input type = "date"  name = "dataScadenza"><br/>
								<span class = "errore"></span> 
							</div>
							<div class = "input" id = "nominativoCarta">
								<span>Nominativo: </span><br/>
								<input type = "text"  name = "nominativo"><br/>
								<span class = "errore"></span> 
							</div>
							<input type = "hidden" value = "${utente.email}" name = "emailCliente">
						</div>
						</div>
							<div>
								<button id = "nuovaCarta" type = "button">aggiungi</button>
							</div>
					</div>
					<span class = "errore"></span>
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
								<td>${item.prodotto.varianteProdotto.prezzoAttuale * (iva + 1)}</td>
								<td>${item.prodotto.taglia}</td>
								<td>${item.prodotto.varianteProdotto.colore}</td>
								<td class = "numero">${item.quantitaProdotto}</td>
								<td class = "prezzo">${(item.prodotto.varianteProdotto.prezzoAttuale * (iva + 1 )) * item.quantitaProdotto}</td>
				
							</tr>
		
							<%} %>
			
						</table>
					</div>
					<div>
						Totale:${carrello.costoTotale * (iva + 1 )}
					</div>
				</fieldset>
				<div>
					<button type = "button" id = "acquista">acquista</button>
				</div>
			</form>
		</div>
		<%@ include file = "fragments/footer.html" %>
		<script src = "javascript/jquery-3.6.0.js"></script>
		<script type="text/javascript" src = "javascript/indirizzo.js"></script>
		<script type="text/javascript" src = "javascript/carta.js"></script>
		<script src = "javascript/validation.js"></script>
       	<script src = "javascript/validation/pagamenti.js"></script>
       	<script src = "javascript/validation/indirizzi.js"></script>
       	<script src = "javascript/validation/checkout.js"></script>
       	<script type="text/javascript" src = "javascript/abbellimentiGenerali.js"></script>
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
					validazionePagamenti(successCarta);
					validazioneIndirizzi(successIndirizzo);
					validazioneCheckout();
					abbellimentiGenerali();
					
				}
			)
		</script>
	</body>
</html>