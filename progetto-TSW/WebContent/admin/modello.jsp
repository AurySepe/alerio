<%@page import="model.bean.TemplateColorVariantBean"%>
<%@page import="model.bean.ProductTemplateBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<%
	ProductTemplateBean modello = (ProductTemplateBean)request.getAttribute("modello");
	if(modello == null)
	{
		response.sendRedirect("admin");
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
			<div>
				NOME:${modello.nome}</br>
				INFORMAZIONI:${modello.informazioni}</br>
				COLLEZIONE:${modello.collezione}</br>
				CATEGORIA:${modello.categoria}</br>
			</div>
			<div id = "form">
				Varianti:</br>
				<div id = "varianti">
				<%for(TemplateColorVariantBean v : modello.getVariantiModello()) {
					request.setAttribute("variante", v);
				%>
				<div class = "variante">
					In vendita <input class = "attivaV" type = "checkbox" value = "${variante.codice}" name = "varianti" <%if(v.isInVendita()){ %> checked="checked"<%} %> ><a href = "variante?codice=${variante.codice}">${variante.colore}</a>
					<img height="50" width="50" src = "../immagine?codice=${variante.immaginiVariante[0].codice}" alt = "immagineVariante">
				</div>
				<%} %>
				</div>
			</div>
		</div>
		<div>	
			<h3>Aggiungi Nuova Variante</h3>	
		 	<form action="nuovaVariante" method="post" enctype="multipart/form-data">
		 		Colore:<input name = "colore" type = "text" required><br/>
		 		In Vendita:<input name = "inVendita" type = "checkbox" value = "true"><br/>
		 		Prezzo:<input name = "prezzo" type = "number" required><br/>
		 		S:<input name = "taglie" type = "checkbox" value = "S">
		 		quantità:<input name = "S-quantità" type = "number"><br/>
		 		M:<input name = "taglie" type = "checkbox" value = "M">
		 		quantità:<input name = "M-quantità" type = "number"><br/>
		 		L:<input name = "taglie" type = "checkbox" value = "L">
		 		quantità:<input name = "L-quantità" type = "number"><br/>
		 		<input name = "codice" type = "hidden" value = "${modello.codice}"><br/>
		 		<button type = "button" id = "aggiungiFoto" >Aggiungi Foto</button><br/>
		 		<button type = "submit">Salva</button>
		 		<script src = "../javascript/jquery-3.6.0.js"></script>
		 		<script type="text/javascript">
		 			var i = 1;
		 			$(document).ready
		 			(
		 				function()
		 				{
		 					$("input.attivaV").click
		 					(
		 						function()
		 						{
		 							var request = {};
		 							request.codice = $(this).val();
		 							f = function(){alert("errore")};
		 							$.get("/progetto-TSW/admin/disattivaVarianti",request,function(){}).fail(f);
		 						}
		 					)
		 					
		 					$("#aggiungiFoto").click
		 					(
		 						function()
		 						{
		 							$("<div><input type = file name = immagine" + i + " accept = image/*></div>").insertBefore( $( "#aggiungiFoto" ) );
		 							i++;
		 						}
		 					);
		 					
		 					if($(".variante").length == 0)
		 					{
		 						$("#form").hide();
		 					}
		 				}
		 					
		 			);
		 		</script>
		 	</form>
		</div>
	</body>
</html>