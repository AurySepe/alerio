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
		<meta content="width=device-width, initial-scale=1" name="viewport" />
		<link href="/progetto-TSW/css/stileGenerale.css" rel="stylesheet" type="text/css" >
		<link href="/progetto-TSW/css/admin/aggiungiModello.css" rel="stylesheet" type="text/css" >
	</head>

	<body>
		<div id = "aggiungiModello">
			<form action = "aggiungiModello" method = "post" id = "form-nuovoModello">
				<fieldset id = "attributi-modello">
					<legend>Nuovo Modello</legend>
					<div class = "input" id = "nome">
						<span>NOME:</span>
						<input placeholder = "solo lettere" name = "nome"  type = "text">
						<span class = "errore"></span>
					</div>
					<div id = "informazioni">
						<span>INFORMAZIONI:</span>
						<textarea name = "informazioni" rows="4" cols="50"></textarea>
						<span class = "errore"></span>
					</div>
					<div class = "input" id = "collezione">
						<span>COLLEZIONE:</span>
						<input placeholder = "ex: estate" name = "collezione"  type = "text">
						<span class = "errore"></span>
					</div>
					<div class = "input" id = "categoria">
						<span>CATEGORIA:</span>
						<input placeholder = "ex: collana" name = "categoria"  type = "text">
						<span class = "errore"></span>
					</div>
					<button type = "button" id = "nuovoModello-button">aggiungi</button>
				</fieldset>
			</form>
		</div>
		<script src = "/progetto-TSW/javascript/jquery-3.6.0.js"></script>
		<script src = "/progetto-TSW/javascript/validation/aggiungiModello.js"></script>
		<script type="text/javascript" src = "../javascript/abbellimentiGenerali.js"></script>
		<script src = "/progetto-TSW/javascript/validation.js"></script>
		<script >
			$(document).ready
			(
				function()
				{
					validazioneAggiungiModello();
					abbellimentiGenerali();
				}
			)
		</script>
	</body>
</html>