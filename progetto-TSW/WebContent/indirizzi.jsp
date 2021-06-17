<%@page import="model.bean.DeliveryBean"%>
<%@page import="java.util.Collection"%>
<%@page import="model.bean.UtenteBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
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
		<meta charset="ISO-8859-1">
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
			<div id = "aggiungi-indirizzo">
				<form name = "aggiungi-indirizzo">
				<div>
					<div>Città: <input type = "text" name = "citta"></div>
					<div>Cap: <input type = "text" name = "cap"></div>
					<div>Via: <input type = "text" name = "via"></div>
					<div>numero civico: <input type = "number" name = "numeroCivico"></div>
					<div>Nominativo: <input type = "text" name = "nominativo"></div>
					<div>Telefono: <input type = "text" name = "telefono"></div>
					<input type = "hidden" name = "emailCliente" value = "${utente.email}">
				</div>
				</form>
				<div>
						<button id = "nuovoIndirizzo">aggiungi</button>
				</div>
			</div>
		</div>
		<%@ include file = "fragments/footer.html" %>
		<script src = "javascript/jquery-3.6.0.js"></script>
		<script type="text/javascript" src = "javascript/indirizzo.js"></script>
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
					nuovoIndirizzo(success);
				}
			)
		</script>
	</body>
</html>