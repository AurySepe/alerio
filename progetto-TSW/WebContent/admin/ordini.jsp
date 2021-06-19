
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.bean.UtenteBean"%>
<%@page import="java.sql.Date"%>
<%@page import="model.bean.OrdineBean"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Collection<OrdineBean> ordini = (Collection<OrdineBean>) request.getAttribute("ordini");
	Collection<UtenteBean> utenti = (Collection<UtenteBean>) request.getAttribute("utenti");
	DateFormat format = new SimpleDateFormat("dd-MM-yyyy");
	Date inizio = (Date) request.getAttribute("data-inizio");
	Date fine = (Date) request.getAttribute("data-fine");
	UtenteBean utente = (UtenteBean) request.getAttribute("utente");
	if(ordini == null)
	{
		response.sendRedirect("ordini");
		return;
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ordini</title>
		<link href="/progetto-TSW/css/stileGenerale.css" rel="stylesheet" type="text/css" >
	</head>
	
	<body>
		<%@ include file = "../fragments/admin/BarraNavigazionaleAdmin.jsp" %>
		<div>
		<%if(utente != null){ %>
			<div>
				<h3>Utente ${utente.nome}</h3>
			</div>
		<%} %>
		<%if(inizio != null){ %>
			<div>
				<h3>Dal <%=format.format(inizio) %></h3>
			</div>
		<%} %>
		<%if(fine != null){ %>
			<div>
				<h3>Fino al <%=format.format(fine) %></h3>
			</div>
		<%} %>
		</div>
		<div>
			<table>
			<tr>
				<th>Data di acquisto</th>
				<th>Iva</th>
				<th>Costo Totale</th>
				<th>Utente</th>
				<th>Dettagli</th>
			</tr>
			<%for(OrdineBean ordine : ordini) 
			{
				request.setAttribute("ordine", ordine);
			%>
			
			<tr>
				<td>${ordine.data}</td>
				<td>${ordine.iva}</td>
				<td>${ordine.costo}</td>
				<td>${ordine.email}</td>
				<td><a href = "/progetto-TSW/ordine?codice=${ordine.codiceOrdine}">dettagli ordine</a></td>
			</tr>
			
			<%} %>
			</table>
			<div>
				<form method="get" action = "ordini">
					<div>Cerca ordini:</div>
					<div>
						Utente: 
						<select name = "utente">
							<option value = ""></option>
							<%for(UtenteBean u : utenti) {
								request.setAttribute("user", u);
							%>
							<option value = "${user.email}">${user.email}</option>
							<%} %>
						</select>
					</div>
					<div>
						Da:<input type = "date" name = "inizio"> A:<input type = "date" name = "fine">
					</div>
					<button type = "submit">Cerca</button>
					
				</form>
			</div>
		</div>
	</body>
</html>