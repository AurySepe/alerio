<%@page import="model.Carrello"%>
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
		<meta content="width=device-width, initial-scale=1" name="viewport" />
		<title>Checkout</title>
		<link href="css/stileGenerale.css" rel="stylesheet" type="text/css" >
		<link href="css/barraNavigazionalePrinc.css" rel="stylesheet" type="text/css">
		<link href ="css/footer.css" rel="stylesheet" type="text/css"> 
		<link href ="css/checkout.css" rel="stylesheet" type="text/css"> 
	</head>
	<body>
		<%@ include file = "fragments/barraNavigazionalePrinc.jsp" %>
		<div id = "checkout">
		<div id = "aggiungi-indirizzo">
			<div id = "aggiungi-indirizzo-contenuto">
				<div class = "input" id = "citta">
					<div><span>Città:</span></div>
					<input type = "text" name = "citta">
					<div class = "contenitore-errore"><span class = "errore"></span></div>
				</div>
				<div class = "input" id = "cap">
					<div><span>Cap:</span></div>
					<input type = "text" name = "cap">
					<div class = "contenitore-errore"><span class = "errore"></span></div>
				</div>
				<div class = "input" id = "via">
					<div><span>Via:</span></div>
					<input type = "text" name = "via">
					<div class = "contenitore-errore"><span class = "errore"></span></div>	
				</div>
				<div class = "input" id = "numeroCivico">
					<div><span>numero civico:</span></div>
					<input type = "number" name = "numeroCivico">
					<div class = "contenitore-errore"><span class = "errore"></span></div>
				</div>
				<div class = "input" id = "nominativoIndirizzo">
					<div><span>Nominativo:</span></div>
					<input type = "text" name = "nominativo">
					<div class = "contenitore-errore"><span class = "errore"></span></div>
				</div>
				<div class = "input" id = "telefono">
					<div><span>Telefono:</span></div>
					<input type = "text" name = "telefono">
					<div class = "contenitore-errore"><span class = "errore"></span></div>
				</div>
				<input type = "hidden" name = "emailCliente" value = "${utente.email}">
				<div>
					<button id = "nuovoIndirizzo" type = "button">aggiungi</button>
				</div>
			</div>
		</div>
		<div id = "aggiungi-carta">	
		<div id = "aggiungi-carta-contenuto">
				<div class = "input" id = "numeroCarta">
					<div><span>Numero Carta:</span></div>
					<input type = "text" maxlength="20" name = "numeroCarta">
					<div class = "contenitore-errore"><span class = "errore"></span></div>
				</div>
				<div class = "input" id = "dataScadenza">					
					<div><span>Data di scadenza:</span></div>
					<input type = "date"  name = "dataScadenza">
					<div class = "contenitore-errore"><span class = "errore"></span></div> 
				</div>
				<div class = "input" id = "nominativoCarta">
					<div><span>Nominativo: </span></div>
					<input type = "text"  name = "nominativo">
					<div class = "contenitore-errore"><span class = "errore"></span></div>
				</div>
				<input type = "hidden" value = "${utente.email}" name = "emailCliente">
			<div>
				<button id = "nuovaCarta" type = "button">aggiungi</button>
			</div>
		</div>
		</div>
			<form action="checkout" name = "checkout" method = "post" id = "checkout-form">
			<div id = "indirizzi-carte-riepilogo">
				<div id = "indirizzo">
					<h1>indirizzo di spedizione</h1>
					<div class = "indirizzi">
						<% for(DeliveryBean delivery : indirizzi ) {
							request.setAttribute("indirizzo", delivery);
						%>
						<div class = "contenitore-indirizzo">
							<input class = "indirizzo-radio" type = "radio" name = "indirizzo" value = "${indirizzo.codice}" required>
							<div class = "indirizzo">
								<div>${indirizzo.nominativo}</div>
								<div>, ${indirizzo.citta}, ${indirizzo.cap}, ${indirizzo.via}, ${indirizzo.numeroCivico}</div>
								<div>, ${indirizzo.telefono}</div>
							</div>
						</div>
			
						<%} %>
						<div id = "contenitore-bottone-aggiungi-indirizzo">
							<button id = "bottone-aggiungi-indirizzo" type = "button">Aggiungi un nuovo indirizzo</button>
						</div>
					</div>
					<span id = "errore-indirizzo" class = "errore"></span>
				</div>
				<div id = "pagamento">
					<h1>Metodo di pagamento</h1>
					<div id = "carte">
						<div class = "titolo-carta">
							<div id = "titolo-le-tue-carte">Le tue carte</div>
							<div id = "titolo-nominativo">Nominativo</div>
							<div id = "titolo-scadenza">Scadenza</div>
						</div>
						<% for(CreditCardBean creditCard : carte ) {
							request.setAttribute("carta", creditCard);
						%>
						<div class = "contenitore-carta">
							<div class = "radio-immagine">
								<input class = "carta-radio" type = "radio" name = "carta" value = "${carta.codice}" required>
								<div class  = "contenitore-immagine-carta" >
									<img class = "immagine-carta" alt = "immagine carta" src = "img/card.png">
								</div>							
								<div class = "numero-carta">${carta.numeroCarta}</div>
							</div>
							<div class = "nominativo-carta">${carta.nominativo}</div>
							<div class = "scadenza-carta"><%= format.format(creditCard.getDataScadenza()) %></div>
						</div>
						<%} %>
						<div id = "contenitore-bottone-aggiungi-carta">
							<button id = "bottone-aggiungi-carta" type = "button">Aggiungi una nuova carta</button>
						</div>
					</div>
					<span id = "errore-carta" class = "errore"></span>
				</div>
				
				<div id = "riepilogo-ordine">
				<h1>Riepilogo dell' ordine</h1>
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
					<span>${item.prodotto.taglia}</span>
					<span>${item.prodotto.varianteProdotto.colore}</span>
					<span>${item.quantitaProdotto}</span>
					<span class = "prezzo-elementi"><%=String.format("%.2f", (item.getProdotto().getVarianteProdotto().getPrezzoAttuale() * (1 + iva)) * item.getQuantitaProdotto()) %>€</span>
				</div>
			</div>
		
		<%} %>
		</div>
				</div>
			</div>
			<div id = "acquista">
				<div id = "contenitore-acquista">
					<span class = "titolo-riepilogo">Acquista Ora</span>
					<div class = "riepilogo">
						<span>Prezzo Totale:</span><span class = "prezzo-totale"><%= String.format("%.2f",cart.getCostoTotale() * (iva + 1) ) %>€</span>			
					</div>
					<div class = "contenitore-bottone-acquista"><button class = "bottone-acquista">Acquista</button></div>
				</div>
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
			var id = "indirizzo-radio-" + data.codice;
			var s = 
			'<div class = "contenitore-indirizzo">\n' +
				'<input id = "' + id +'" class = "indirizzo-radio" type = "radio" name = "indirizzo" value = "' + data.codice + '" required>\n' +
				'<div class = "indirizzo">\n' +
					'<div>'+ data.nominativo +'</div>\n'+
					'<div>, ' + data.citta + ', '+ data.cap +', ' + data.via + ', '+ data.numeroCivico +'</div>\n' +
					'<div>, ' + data.telefono +'</div>\n' +
				'</div>\n' +
			'</div>\n'
			
			$(s).insertBefore( $( "#contenitore-bottone-aggiungi-indirizzo" ) );
			$("#" + id).attr('checked', true);
			$("#aggiungi-indirizzo").css("display","none");
			
			
		}
		
		function successCarta(data)
		{
			data = JSON.parse(data);
			var date = new Date(data.dataScadenza);
			data.dataScadenza = "" + (date.getMonth() + 1).toLocaleString('en-US', { minimumIntegerDigits: 2,useGrouping: false})
			    + "/" + (date.getFullYear()) 
			var id = "carta-"+data.codice;
			var s = 
			'<div class = "contenitore-carta">\n' +
				'<div class = "radio-immagine">\n' +
					'<input id = "'+ id +'" class = "carta-radio" type = "radio" name = "carta" value = "'+ data.codice +'" required>\n' +
					'<div class  = "contenitore-immagine-carta" >\n' +
						'<img class = "immagine-carta" alt = "immagine carta" src = "img/card.png">\n' +
					'</div>\n' +							
					'<div class = "numero-carta">' + data.numeroCarta +'</div>\n'+
				'</div>\n' +
				'<div class = "nominativo-carta">'+ data.nominativo +'</div>\n' +
				'<div class = "scadenza-carta">'+ data.dataScadenza +'</div>\n' +
			'</div>\n'
			$(s).insertBefore( $( "#contenitore-bottone-aggiungi-carta" ) );
			$("#" + id).attr('checked', true);
			$("#aggiungi-indirizzo").css("display","none");
			
		};
		</script>
		<script type="text/javascript">
			$(document).ready
			(
				function()
				{
					var prezzo = 0;
					$(".prezzo-elementi").each(function(){prezzo += parseFloat($(this).html())});
					$(".prezzo-totale").html("" + prezzo + "€");
					$("#bottone-aggiungi-indirizzo").click
					(
						function()
						{
							$("#aggiungi-indirizzo").css("display","flex");
						}
					)
					$("#bottone-aggiungi-carta").click
					(
						function()
						{
							$("#aggiungi-carta").css("display","flex");
						}
					)
					
					window.onclick = function(event) 
					{
  						if (event.target == document.getElementById("aggiungi-indirizzo")) 
  						{
  							$("#aggiungi-indirizzo").css("display","none");
  						}
  						else if(event.target == document.getElementById("aggiungi-carta"))
  						{
  							$("#aggiungi-carta").css("display","none");
  						}
  					}
					validazioneIndirizzi(successIndirizzo);
					validazionePagamenti(successCarta);
  						
				}	
			)
		</script>
	</body>
</html>