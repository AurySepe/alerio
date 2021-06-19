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
		<link href="css/stileGenerale.css" rel="stylesheet" type="text/css" >
		<link href="css/barraNavigazionalePrinc.css" rel="stylesheet" type="text/css">
		<link href ="css/footer.css" rel="stylesheet" type="text/css"> 
	</head>
	<body>
		<%@ include file = "fragments/barraNavigazionalePrinc.jsp" %>
		<div>
			<div><h1>le tue informazioni di consegna:</h1></div>
			<% for(DeliveryBean delivery : indirizzi ) {
				request.setAttribute("indirizzo", delivery);
			%>
				<div class = "indirizzo">
					<div>${indirizzo.citta}, ${indirizzo.cap}, ${indirizzo.via}, ${indirizzo.numeroCivico}</div>
					<div>Nominativo: ${indirizzo.nominativo}</div>
					<div>Telefono: ${indirizzo.telefono}</div>
				</div>
			
			<%} %>
			<div >
				<form name = "aggiungi-indirizzo" id = "aggiungi-indirizzo">
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
				</form>
			</div>
		</div>
		<%@ include file = "fragments/footer.html" %>
		<script src = "javascript/jquery-3.6.0.js"></script>
		<script type="text/javascript" src = "javascript/indirizzo.js"></script>
		<script src = "javascript/validation.js"></script>
       	<script src = "javascript/validation/indirizzi.js"></script>
       	<script type="text/javascript">
       	function success(data)
       	{
       		data = JSON.parse(data);
       		s = 
       		"<div class = 'indirizzo'>\n" +
       			"<div>" + data.citta + ", "+ data.cap +", "+ data.via +", "+ data.numeroCivico +"</div>\n" +
       			"<div>Nominativo: "+ data.nominativo +"</div>\n" +
       			"<div>Telefono: "+ data.telefono +"</div>\n" +
       		"</div>\n"
       				
       		$(s).insertBefore( $( "#aggiungi-indirizzo" ) );
       				
       	}
       	</script>
		<script type="text/javascript">
			$(document).ready
			(
				function()
				{
					validazioneIndirizzi(success);
				}
			)
		</script>
	</body>
</html>