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
		<meta content="width=device-width, initial-scale=1" name="viewport" />
		<link href="/progetto-TSW/css/stileGenerale.css" rel="stylesheet" type="text/css" >
		<link href="/progetto-TSW/css/admin/modello.css" rel="stylesheet" type="text/css" >
	</head>

	<body>
		<div id = "modello">
			<div id = "modello-e-varianti">
				<div id = "attributi-modello">
					<span id = "nome-modello">${modello.nome}</span>
					<span id = "informazioni-modello">${modello.informazioni}</span>
					<div id = "categoria-collezione">
						<span>COLLEZIONE:${modello.collezione}</span>
						<span>CATEGORIA:${modello.categoria}</span>
					</div>
				</div>
				<div id = "varianti-e-titolo">
					<span id = "titolo-varianti">Varianti</span>
					<div id = "varianti">
						<%for(TemplateColorVariantBean v : modello.getVariantiModello()) {
							request.setAttribute("variante", v);
						%>
						<div class = "variante">
							<a class = "link-variante" href = "variante?codice=${variante.codice}">
								<span class = "colore-variante">${variante.colore}</span>
								<img class = "evidenziate immagine-variante"  src = "../immagine?codice=${variante.immaginiVariante[0].codice}" alt = "immagineVariante">
							</a>
							<div class = "in-vendita">
								<span>In vendita</span> 
								<input class = "attivaV" type = "checkbox" value = "${variante.codice}" name = "varianti" <%if(v.isInVendita()){ %> checked="checked"<%} %> >
							</div>
						</div>
						<%} %>
					</div>
				</div>
			</div>
			<div id = "form">	
				<span id = "titolo-form">Nuova Variante</span>	
			 	<form id = "form-variante" action="nuovaVariante" method="post" enctype="multipart/form-data">
					<div id = "attributi-taglie">			
					 	<fieldset id = "attributi-variante">
					 		<legend>attributi</legend>
					 		<div class = "input" id = "colore">		 		
					 			<span>Colore:</span>
					 			<input placeholder = "ex : Rosso" name = "colore" type = "text" required>
					 			<span class = "errore"></span>
					 		</div>
					 		<div class = "input" id = "inVendita">
					 			<span>In Vendita:</span>
					 			<input name = "inVendita" type = "checkbox" value = "true">
					 		</div>
					 		<div class = "input" id = "prezzo">
						 		<span>Prezzo:</span>
						 		<input placeholder = "0.00" name = "prezzo" type = "number" required>
						 		<span class = "errore"></span>
					 		</div>
					 		<div id = "genere">
					 			<span>Genere:</span>
						 		<div id = "contenitore-generi">
						 			<div class = "generi"><span>Uomo:</span><input name = "genere" type = "radio" value = "Uomo" required></div>
						 			<div class = "generi"><span>Donna:</span><input name = "genere" type = "radio" value = "Donna" required></div>
						 			<div class = "generi"><span>Unisex:</span><input name = "genere" type = "radio" value = "Unisex" required></div>
						 		</div>
					 			<span class = "errore"></span>
					 		</div>
					 	</fieldset>
					 	<fieldset id = "taglie-variante">
					 		<legend>taglie</legend>
					 		<div class = "taglie" >
					 		<div class = "contenitore-taglia">
					 			<div class = "input taglia" id = "S">		 		
					 				<span>S:</span>
					 				<input name = "taglie" type = "checkbox" value = "S">
					 			</div>
					 			<div class = "input quantità" id = "S-quantità">	 		
						 			<span>quantità:</span>
						 			<input placeholder = "solo numeri interi" name = "S-quantita" type = "number">
							 		<span class = "errore"></span>
					 			</div>
					 		</div>
					 		<div class = "contenitore-taglia">
					 			<div class = "input taglia" id = "M">		 		
					 				<span>M:</span>
					 				<input name = "taglie" type = "checkbox" value = "M">
					 			</div>
					 			<div class = "input quantità" id = "M-quantità">	 		
						 			<span>quantità:</span>
						 			<input placeholder = "solo numeri interi" name = "M-quantita" type = "number">
						 			<span class = "errore"></span>
					 			</div>
					 		</div>
					 		<div class = "contenitore-taglia">
					 			<div class = "input taglia" id = "L">		 		
					 				<span>L:</span>
					 				<input name = "taglie" type = "checkbox" value = "L">
					 			</div>
					 			<div class = "input quantità" id = "L-quantità">	 		
						 			<span>quantità:</span>
						 			<input placeholder = "solo numeri interi" name = "L-quantita" type = "number">
						 			<span class = "errore"></span>
					 			</div>
					 		</div>
					 		<span class = "errore"></span>
					 		</div>
					 	</fieldset>
					 </div>	
			 		<input name = "codice" type = "hidden" value = "${modello.codice}">
			 		<fieldset id = "foto-input">
			 			<legend>Immagini</legend>
			 			<button type = "button" id = "aggiungiFoto" >Aggiungi Foto</button>
			 		</fieldset>
			 		<button type = "button" id = "variante-button">Salva</button>
			 		</form>
			 	</div>
			 </div>
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
		 					 			'<input name = "immagine' + i +'"type = "file" accept="image/*">' +
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
	</body>
</html>