<%@page import="model.bean.TemplateColorVariantBean"%>
<%@page import="model.bean.ProductTemplateBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<meta charset="UTF-8">
		<title>Modello</title>
		<link href="/progetto-TSW/css/stileGenerale.css" rel="stylesheet" type="text/css" >
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
			<div id = "varianti">
				Varianti:</br>
				<div>
				<%for(TemplateColorVariantBean v : modello.getVariantiModello()) {
					request.setAttribute("variante", v);
				%>
				<div class = "variante">
					In vendita <input class = "attivaV" type = "checkbox" value = "${variante.codice}" name = "varianti" <%if(v.isInVendita()){ %> checked="checked"<%} %> ><a href = "variante?codice=${variante.codice}">${variante.colore}</a>
					<img class = "evidenziate" height="50" width="50" src = "../immagine?codice=${variante.immaginiVariante[0].codice}" alt = "immagineVariante">
				</div>
				<%} %>
				</div>
			</div>
		</div>
		<div>	
			<h3>Aggiungi Nuova Variante</h3>	
		 	<form id = "form-variante" action="nuovaVariante" method="post" enctype="multipart/form-data">
		 		<div class = "input" id = "colore">		 		
		 			Colore:<br/>
		 			<input name = "colore" type = "text" required><br/>
		 			<span class = "errore"></span>
		 		</div>
		 		<div class = "input" id = "inVendita">
		 			In Vendita:<br/>
		 			<input name = "inVendita" type = "checkbox" value = "true"><br/>
		 			<span class = "errore"></span>
		 		</div>
		 		<div class = "input" id = "prezzo">
			 		Prezzo:<br/>
			 		<input name = "prezzo" type = "number" required><br/>
			 		<span class = "errore"></span>
		 		</div>
		 		<div class = "taglie" >
		 		<div>
		 			<div class = "input taglia" id = "S">		 		
		 				S:<br/>
		 				<input name = "taglie" type = "checkbox" value = "S"><br/>
		 				<span class = "errore"></span>
		 			</div>
		 			<div class = "input quantità" id = "S-quantità">	 		
			 			quantità:<br/>
			 			<input name = "S-quantita" type = "number"><br/>
			 			<span class = "errore"></span>
		 			</div>
		 		</div>
		 		<div>
		 			<div class = "input taglia" id = "M">		 		
		 				M:<br/>
		 				<input name = "taglie" type = "checkbox" value = "M"><br/>
		 				<span class = "errore"></span>
		 			</div>
		 			<div class = "input quantità" id = "M-quantità">	 		
			 			quantità:<br/>
			 			<input name = "M-quantita" type = "number"><br/>
			 			<span class = "errore"></span>
		 			</div>
		 		</div>
		 		<div>
		 			<div class = "input taglia" id = "L">		 		
		 				L:<br/>
		 				<input name = "taglie" type = "checkbox" value = "L"><br/>
		 				<span class = "errore"></span>
		 			</div>
		 			<div class = "input quantità" id = "L-quantità">	 		
			 			quantità:<br/>
			 			<input name = "L-quantita" type = "number"><br/>
			 			<span class = "errore"></span>
		 			</div>
		 		</div>
		 		<span class = "errore"></span>
		 		</div>
		 		<input name = "codice" type = "hidden" value = "${modello.codice}"><br/>
		 		<button type = "button" id = "aggiungiFoto" >Aggiungi Foto</button><br/>
		 		<button type = "button" id = "variante-button">Salva</button>
		 		<script src = "/progetto-TSW/javascript/jquery-3.6.0.js"></script>
		 		<script src = "/progetto-TSW/javascript/validation/modello.js"></script>
		 		<script src = "/progetto-TSW/javascript/validation.js"></script>
		 		<script type="text/javascript" src = "../javascript/abbellimentiGenerali.js"></script>
		 		<script type="text/javascript">
		 			var i = 1;
		 			$(document).ready
		 			(
		 				function()
		 				{
		 					$("#varianti input.attivaV").click
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
		 							s = 
		 							'<div class = "input foto" id = "immagine'+ i +'">' +
		 					 			'<input name = "immagine' + i +'"type = "file" accept="image/*"><br/>' +
		 					 			'<span class = "errore"></span>' +
		 				 			'</div>';
		 							$(s).insertBefore( $( "#aggiungiFoto" ) );
		 							i++;
		 						}
		 					);
		 					
		 					$(".taglie input").click
		 					(
		 						function()
		 						{
		 							var s = $(this).val() + "-quantità";
		 							var disable = !this.checked;
		 							$("#" + s + " input").prop( "disabled", disable );
		 							$("#" + s + " input").val("");
		 						}
		 					)
		 					
		 					$(".quantità input").prop( "disabled", true );
		 					
		 					if($(".variante").length == 0)
		 					{
		 						$("#varianti").hide();
		 					}
		 					
		 					validazioneModello();
		 					abbellimentiGenerali();
		 				}
		 					
		 			);
		 		</script>
		 	</form>
		</div>
	</body>
</html>