<%@page import="java.util.Collection"%>
<%@page import="model.bean.CreditCardBean"%>
<%@page import="model.bean.UtenteBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    UtenteBean utente = (UtenteBean) request.getAttribute("utente");
    Collection<CreditCardBean> carte = (Collection<CreditCardBean>) request.getAttribute("carte");
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
		<meta charset="UTF-8">
		<title>metodi di pagamento</title>
		<meta content="width=device-width, initial-scale=1" name="viewport" />
		<link href="css/stileGenerale.css" rel="stylesheet" type="text/css" >
		<link href="css/barraNavigazionalePrinc.css" rel="stylesheet" type="text/css">
		<link href ="css/footer.css" rel="stylesheet" type="text/css"> 
		<link href ="css/pagamenti.css" rel="stylesheet" type="text/css"> 
	</head>
	<body>
		<%@ include file = "fragments/barraNavigazionalePrinc.jsp" %>
		<div id = "pagamenti">
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
				</div>
		</div>
		<%@ include file = "fragments/footer.html" %>
		<script src = "javascript/jquery-3.6.0.js"></script>
		<script type="text/javascript" src = "javascript/carta.js"></script>
		<script src = "javascript/validation.js"></script>
       	<script src = "javascript/validation/pagamenti.js"></script>
       	<script type="text/javascript" src = "javascript/abbellimentiGenerali.js"></script>
       	<script type="text/javascript">
       	function success(data)
       	{
       		data = JSON.parse(data);
			var date = new Date(data.dataScadenza);
			data.dataScadenza = "" + (date.getMonth() + 1).toLocaleString('en-US', { minimumIntegerDigits: 2,useGrouping: false})
			    + "/" + (date.getFullYear()) 
			var id = "carta-"+data.codice;
			var s = 
			'<div class = "contenitore-carta">\n' +
				'<div class = "radio-immagine">\n' +
					'<div class  = "contenitore-immagine-carta" >\n' +
						'<img class = "immagine-carta" alt = "immagine carta" src = "img/card.png">\n' +
					'</div>\n' +							
					'<div class = "numero-carta">' + data.numeroCarta +'</div>\n'+
				'</div>\n' +
				'<div class = "nominativo-carta">'+ data.nominativo +'</div>\n' +
				'<div class = "scadenza-carta">'+ data.dataScadenza +'</div>\n' +
			'</div>\n'
			$(s).insertBefore( $( "#contenitore-bottone-aggiungi-carta" ) );
			$("#aggiungi-carta").css("display","none");
       				
       	};
       	</script>
		<script type="text/javascript">
			$(document).ready
			(
				function()
				{
					validazionePagamenti(success);
					abbellimentiGenerali();
					$("#bottone-aggiungi-carta").click
					(
						function()
						{
							$("#aggiungi-carta").css("display","flex");
						}
					)
					
					window.onclick = function(event) 
					{
  						if(event.target == document.getElementById("aggiungi-carta"))
  						{
  							$("#aggiungi-carta").css("display","none");
  						}
  					}
				}
			)
		</script>
	</body>
</html>