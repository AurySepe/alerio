<%@page import="model.bean.DeliveryBean"%>
<%@page import="java.util.Collection"%>
<%@page import="model.bean.UtenteBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    UtenteBean utente = (UtenteBean) request.getAttribute("utente");
    Collection<DeliveryBean> indirizzi = (Collection<DeliveryBean>) request.getAttribute("indirizzi");
	if(indirizzi == null)
	{
		response.sendRedirect(response.encodeURL("indirizzi"));
		return;
	}
    %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>informazioni di consegna</title>
		<meta content="width=device-width, initial-scale=1" name="viewport" />
		<link href="css/stileGenerale.css" rel="stylesheet" type="text/css" >
		<link href="css/barraNavigazionalePrinc.css" rel="stylesheet" type="text/css">
		<link href ="css/footer.css" rel="stylesheet" type="text/css"> 
		<link href ="css/indirizzi.css" rel="stylesheet" type="text/css"> 
	</head>
	<body>
		<%@ include file = "fragments/barraNavigazionalePrinc.jsp" %>
		<div id = "indirizzi">
					<div id = "aggiungi-indirizzo">
			<div id = "aggiungi-indirizzo-contenuto">
				<div class = "input" id = "citta">
					<div><span>Città:</span></div>
					<input  placeholder = "ex: Roma" type = "text" name = "citta">
					<div class = "contenitore-errore"><span class = "errore"></span></div>
				</div>
				<div class = "input" id = "cap">
					<div><span>Cap:</span></div>
					<input placeholder = "ex: 80056" type = "text" name = "cap">
					<div class = "contenitore-errore"><span class = "errore"></span></div>
				</div>
				<div class = "input" id = "via">
					<div><span>Via:</span></div>
					<input placeholder="ex: via delle mimose" type = "text" name = "via">
					<div class = "contenitore-errore"><span class = "errore"></span></div>	
				</div>
				<div class = "input" id = "numeroCivico">
					<div><span>numero civico:</span></div>
					<input placeholder="ex: 7" type = "number" name = "numeroCivico">
					<div class = "contenitore-errore"><span class = "errore"></span></div>
				</div>
				<div class = "input" id = "nominativoIndirizzo">
					<div><span>Nominativo:</span></div>
					<input placeholder="ex: Aurelio Sepe" type = "text" name = "nominativo">
					<div class = "contenitore-errore"><span class = "errore"></span></div>
				</div>
				<div class = "input" id = "telefono">
					<div><span>Telefono:</span></div>
					<input placeholder = "+39xxxxxxxxxx" type = "text" name = "telefono">
					<div class = "contenitore-errore"><span class = "errore"></span></div>
				</div>
				<input type = "hidden" name = "emailCliente" value = "${utente.email}">
				<div>
					<button id = "nuovoIndirizzo" type = "button">aggiungi</button>
				</div>
			</div>
		</div>
						<div id = "indirizzo">
					<h1>indirizzo di spedizione</h1>
					<div class = "indirizzi">
						<% for(DeliveryBean delivery : indirizzi ) {
							request.setAttribute("indirizzo", delivery);
						%>
						<div class = "contenitore-indirizzo">
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
				</div>
		</div>
		<%@ include file = "fragments/footer.html" %>
		<script src = "javascript/jquery-3.6.0.js"></script>
		<script type="text/javascript" src = "javascript/indirizzo.js"></script>
		<script src = "javascript/validation.js"></script>
       	<script src = "javascript/validation/indirizzi.js"></script>
       	<script type="text/javascript" src = "javascript/abbellimentiGenerali.js"></script>
       	<script type="text/javascript">
       	
       	function success(data)
       	{
			data = JSON.parse(data);
			var id = "indirizzo-radio-" + data.codice;
			var s = 
			'<div class = "contenitore-indirizzo">\n' +
				'<div class = "indirizzo">\n' +
					'<div>'+ data.nominativo +'</div>\n'+
					'<div>, ' + data.citta + ', '+ data.cap +', ' + data.via + ', '+ data.numeroCivico +'</div>\n' +
					'<div>, ' + data.telefono +'</div>\n' +
				'</div>\n' +
			'</div>\n'
			
			$(s).insertBefore( $( "#contenitore-bottone-aggiungi-indirizzo" ) );
			$("#aggiungi-indirizzo").css("display","none");
       				
       	}
       	</script>
		<script type="text/javascript">
			$(document).ready
			(
				function()
				{
					validazioneIndirizzi(success);
					abbellimentiGenerali();
					$("#bottone-aggiungi-indirizzo").click
					(
						function()
						{
							$("#aggiungi-indirizzo").css("display","flex");
						}
					)
					
					window.onclick = function(event) 
					{
  						if (event.target == document.getElementById("aggiungi-indirizzo")) 
  						{
  							$("#aggiungi-indirizzo").css("display","none");
  						}
  					}
				}
			)
		</script>
	</body>
</html>