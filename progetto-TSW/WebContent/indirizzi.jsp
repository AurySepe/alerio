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
		</div>
		<%@ include file = "fragments/footer.html" %>
	</body>
</html>