<%@page import="model.bean.TemplateColorVariantBean"%>
<%@page import="model.bean.ProductTemplateBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	
	if(session.getAttribute("isAdmin") == null)
	{
		response.sendRedirect("admin");
		return;
	}
%>

<html>
	<head>
		<meta charset="UTF-8">
		<title>Modello</title>
		<link href="/progetto-TSW/css/stileGenerale.css" rel="stylesheet" type="text/css" >
	</head>

	<body>
		<%@ include file = "../fragments/admin/BarraNavigazionaleAdmin.jsp" %>
		<div>
			<form action = "aggiungiModello" method = "post" id = "form-nuovoModello">
				<div class = "input" id = "nome">
					NOME:<br/>
					<input name = "nome"  type = "text"><br/>
					<span class = "errore"></span>
				</div>
				<div id = "informazioni">
					INFORMAZIONI:<br/>
					<textarea name = "informazioni" rows="4" cols="50"></textarea><br/>
					<span class = "errore"></span>
				</div>
				<div class = "input" id = "collezione">
					COLLEZIONE:<br/>
					<input name = "collezione"  type = "text"><br/>
					<span class = "errore"></span>
				</div>
				<div class = "input" id = "categoria">
					CATEGORIA:<br/>
					<input name = "categoria"  type = "text"><br/>
					<span class = "errore"></span>
				</div>
				<button type = "button" id = "nuovoModello-button">aggiorna</button>
			</form>
		</div>
		<script src = "/progetto-TSW/javascript/jquery-3.6.0.js"></script>
		<script src = "/progetto-TSW/javascript/validation/aggiungiModello.js"></script>
		<script src = "/progetto-TSW/javascript/validation.js"></script>
		<script >
			$(document).ready
			(
				function()
				{
					validazioneAggiungiModello();
				}
			)
		</script>
	</body>
</html>