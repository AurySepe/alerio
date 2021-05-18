<%@page import="model.bean.TemplateColorVariantBean"%>
<%@page import="model.bean.ProductTemplateBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<%
	ProductTemplateBean modello = (ProductTemplateBean)request.getAttribute("modello");
	if(modello == null)
	{
		response.sendRedirect("modello");
		return;
	}
%>

<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Modello</title>
		<link href="css/stileGenerale.css" rel="stylesheet" type="text/css" >
	</head>

	<body>
		<%@ include file = "../fragments/admin/BarraNavigazionaleAdmin.jsp" %>
		<div>
			<form action = "aggiornaModello" method = "post">
				NOME:<input name = "nome" value = "${modello.nome}" type = "text"></br>
				INFORMAZIONI:<textarea name = "informazioni" rows="4" cols="50">${modello.informazioni}</textarea></br>
				COLLEZIONE:<input name = "collezione" value = "${modello.collezione}" type = "text"></br>
				CATEGORIA:<input name = "categoria" value = "${modello.categoria}" type = "text"></br>
				Varianti:</br>
				<%for(TemplateColorVariantBean v : modello.getVariantiModello()) {
					request.setAttribute("variante", v);
				%>
				Rimuovi <input type = "checkbox" value = "${variante.codice}" name = "rimuoviVariante" >${variante.colore}
				<img src = "../immagine?codice=${variante.immaginiVariante[0].codice}" alt = "immagineVariante">
				
				<%} %>
				
				<button type = "submit">aggiorna</button>
			</form>
		</div>
		<div>		
		 	<a href = "nuovoModello">aggiungi variante</a>
		</div>
	</body>
</html>