<%@page import="java.util.Locale"%>
<%@page import="model.bean.ProductBean"%>
<%@page import="model.bean.ImageBean"%>
<%@page import="model.bean.TemplateColorVariantBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	TemplateColorVariantBean variante = (TemplateColorVariantBean)request.getAttribute("variante");
	if(variante == null)
	{
		response.sendRedirect("admin");
		return;
	}
	double iva =Double.parseDouble(application.getInitParameter("iva"));
    application.setAttribute("iva", iva);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta content="width=device-width, initial-scale=1" name="viewport" />
		<title>Variante</title>
		<link href="/progetto-TSW/css/stileGenerale.css" rel="stylesheet" type="text/css" >
		<link href="/progetto-TSW/css/admin/mostraVariante.css" rel="stylesheet" type="text/css" >
	</head>
	<body>
		<div id = "mostraVariante">
			<div id = "variante">
				<span id = "titolo"><a id = "link-titolo" href = "modello?codice=${variante.codiceModello}">${variante.modelloProdotto.nome}</a></span>
				<span id = "colore">${variante.colore}</span>
			
				<div id = "immagini">
				<%for(ImageBean immagine : variante.getImmaginiVariante()) 
					{
						request.setAttribute("immagine", immagine);
				
				%>
					<div class = "contenitore-immagini">
						<img class = "evidenziate immagine" alt="immagine prodotto" src="../immagine?codice=${immagine.codice}">
					</div>
				<%	} %>
				</div>
			</div>
			<div id = "modifica-variante">
				<form id = "modificaVariante" method="post" action = "modificaVariante">
					<fieldset id = "attributi">
						<legend>Attributi</legend>
						<input type = "hidden" value = "${variante.codice}" name = "codice">
						<div class = "input" id = "prezzo">
								<span>prezzo</span><input placeholder = "0.00" value = "<%= String.format(Locale.US,"%.2f", variante.getPrezzoAttuale() * (1 + iva)) %>" type = "number" name = "prezzo">								<span class = "errore"></span>
						</div>
						<%for(ProductBean prodotto : variante.getProdotti())
						   {
							request.setAttribute("prodotto", prodotto);	
						
						%>
							<div class = "input taglia" id = "${prodotto.taglia}">
								<span>quantità ${prodotto.taglia}</span>
								<input placeholder = "solo numeri interi"  value = "${prodotto.quantita}" type = "number" name = "quantita-${prodotto.taglia}" >
								<span class = "errore"></span>
							</div>
						<% } %>
						<button id = "submit" type = "button">aggiorna</button>
					</fieldset>
				</form>
			</div>
		</div>
		<script src = "../javascript/jquery-3.6.0.js"></script>
		<script src = "/progetto-TSW/javascript/validation/mostraVariante.js"></script>
		<script src = "/progetto-TSW/javascript/validation.js"></script>
		<script type="text/javascript" src = "../javascript/abbellimentiGenerali.js"></script>
		<script type="text/javascript">
			$(document).ready
			(
				function()
				{
					validazioneVariante();
					abbellimentiGenerali();
				}
			)
		</script>
	</body>
</html>