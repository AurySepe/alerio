<%@page import="java.util.Collection"%>
<%@page import="model.bean.CreditCardBean"%>
<%@page import="model.bean.UtenteBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
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
		<meta charset="ISO-8859-1">
		<title>metodi di pagamento</title>
		<link href="css/stileGenerale.css" rel="stylesheet" type="text/css" >
		<link href="css/barraNavigazionalePrinc.css" rel="stylesheet" type="text/css">
		<link href ="css/footer.css" rel="stylesheet" type="text/css"> 
	</head>
	<body>
		<%@ include file = "fragments/barraNavigazionalePrinc.jsp" %>
		<div>
			<div><h1>I tuoi metodi di pagamento:</h1></div>
			<% for(CreditCardBean creditCard : carte ) {
				request.setAttribute("carta", creditCard);
			%>
				<div class = "carta">
					<div>${carta.numeroCarta}</div>
					<div><span><%= format.format(creditCard.getDataScadenza()) %></span>  <span>${carta.nominativo}</span></div>
				</div>
			
			<%} %>
			<div id = "aggiungi-carta">
				<form name = "aggiungi-carta">
				<div>
					<div>Numero Carta: <input type = "text" maxlength="20" name = "numeroCarta"></div>
					<div>
						<span>Data di scadenza: <input type = "date"  name = "dataScadenza"></span>  
						<span>Nominativo: <input type = "text"  name = "nominativo"></span>
						<input type = "hidden" value = "${utente.email}" name = "emailCliente">
					</div>
				</div>
				</form>
				<div>
						<button id = "nuovaCarta">aggiungi</button>
				</div>
			</div>
		</div>
		<%@ include file = "fragments/footer.html" %>
		<script src = "javascript/jquery-3.6.0.js"></script>
		<script type="text/javascript" src = "javascript/carta.js"></script>
		<script type="text/javascript">
		function success(data)
		{
			data = JSON.parse(data);
			var date = new Date(data.dataScadenza);
			data.dataScadenza = "" + (date.getMonth() + 1).toLocaleString('en-US', { minimumIntegerDigits: 2,useGrouping: false})
			    + "/" + (date.getFullYear()) 
			var s = "<div class = 'carta'><div>" + data.numeroCarta + "</div>\n " +
			"<div><span>" + data.dataScadenza + "</span>  <span>" + data.nominativo + "</span></div></div>"

			$(s).insertBefore( $( "#aggiungi-carta" ) );
			
		};
		</script>
		<script type="text/javascript">
			$(document).ready
			(
				function()
				{
					nuovaCarta(success);
				}
			)
		</script>
	</body>
</html>