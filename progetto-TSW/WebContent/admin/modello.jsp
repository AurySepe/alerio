<%@page import="model.bean.TemplateColorVariantBean"%>
<%@page import="model.bean.ProductTemplateBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<%
	ProductTemplateBean modello = (ProductTemplateBean)request.getAttribute("modello");
	if(modello == null)
	{
		response.sendRedirect("catalogo");
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
			<form action = "disattivaVarianti" method = "post">
				<%for(TemplateColorVariantBean v : modello.getVariantiModello()) {
					request.setAttribute("variante", v);
				%>
				<div class = "variante">
					In vendita <input type = "checkbox" value = "${variante.codice}" name = "varianti" <%if(v.isInVendita()){ %> checked="checked"<%} %> ><a href = "variante?codice=${variante.codice}">${variante.colore}</a>
					<img height="50" width="50" src = "../immagine?codice=${variante.immaginiVariante[0].codice}" alt = "immagineVariante">
				</div>
				<%} %>
				<button type = "submit">aggiorna</button>
				<script>
					function mostraBottone()
					{
						var x = document.getElementsByClassName("variante");
						if(x.length == 0)
						{
							var button = document.getElementById("form");
							button.style.display = "none";
						}
					}
					window.onload = mostraBottone;
				</script>
				<input type="hidden" value = "${modello.codice}" name = "codice">
			</form>
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
		 		<button type = "button" id = "aggiungi foto" onclick="nuovaFoto()">Aggiungi Foto</button><br/>
		 		<button type = "submit">Salva</button>
		 		<script type="text/javascript">
		 			var i = 1;
		 			function nuovaFoto()
		 			{
		 				var x = document.getElementById("aggiungi foto");
		 				var form = x.parentNode;
		 				var div = document.createElement("div");
		 				var input = document.createElement("input");
		 				input.setAttribute("name","immagine " + i);
		 				input.setAttribute("type","file");
		 				input.setAttribute("accept","image/*");
		 				div.appendChild(input);
		 				form.insertBefore(div,x);
		 				i++;
		 			}
		 		</script>
		 	</form>
		</div>
	</body>
</html>