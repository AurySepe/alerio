<%@page import="model.bean.ImageBean"%>
<%@page import="model.bean.ProductBean"%>
<%@page import="model.bean.TemplateColorVariantBean"%>
<%@page import="model.bean.ProductTemplateBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    TemplateColorVariantBean bean = (TemplateColorVariantBean)request.getAttribute("prodotto");
        	if(bean == null)
        	{
        		response.sendRedirect("/catalogo");
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
		<title> ${prodotto.modelloProdotto.nome}</title>
		<link href="css/stileGenerale.css" rel="stylesheet" type="text/css" >
		<link href="css/barraNavigazionalePrinc.css" rel="stylesheet" type="text/css">
		<link href ="css/footer.css" rel="stylesheet" type="text/css"> 
		<link href ="css/prodotto.css" rel="stylesheet" type="text/css"> 
	</head>
	<body>
	<%@ include file = "fragments/barraNavigazionalePrinc.jsp" %>
		<div id = "prodotto">
			<div id = "foto-acquista">
				<div id = "foto">
					<div id = "foto-laterali">
						<%for(ImageBean image : bean.getImmaginiVariante()) 
							{
								request.setAttribute("immagine", image);
						%>
						<div class = "contenitore-foto-laterale">
							<img class = "immagine-laterale evidenziate" src = "immagine?codice=${immagine.codice}">
						</div>
						<%	} %>
						
					</div>
					<div id = "foto-principale-wishlist">
						<div id = "contenitore-wishlist">
							<div class = "wishlist">
								<button type = "button" id = "bottone-wishlist" value="${prodotto.codice}">
									<img id = "immagine-wishlist" src = "">
								</button>
							</div>
						</div>
						<div id = "contenitore-foto-principale">
							<img class = "evidenziate" id = "foto-principale" alt="immagine-prodotto" src="immagine?codice=${prodotto.immaginiVariante[0].codice}">
						</div>
					</div>
				</div>
				
				<div id = "acquista">
					<div id = "titolo">
						<span>${prodotto.modelloProdotto.nome}</span>
					</div>
					<div id = "prezzo">
						<span><%=String.format("%.2f",bean.getPrezzoAttuale() * (1 + iva)) %>€</span>
					</div>
					<div id = "varianti">
						<div id = contenitore-varianti>
						<%for(TemplateColorVariantBean variante : bean.getModelloProdotto().getVariantiModello()) 
						{
							request.setAttribute("variante", variante);
						%>
							<div class = "variante">
								<span><a href = "mostraProdotto?codiceModello=${variante.modelloProdotto.codice}&codice=${variante.codice}">${variante.colore}</a></span>
							</div>
						<%} %>
						</div>
					</div>
					<div id = "taglie">
						<%for(ProductBean product : bean.getProdotti()) 
						{
							request.setAttribute("product", product);
						%>
							<div class = "prodotto">
								<button class = "bottone-taglia" value = "${product.codice}" type = "button">${product.taglia}</button>
							</div>
						<%} %>
					</div>
					<div id = "contenitore-bottone-carrello">
						<button id = "bottone-carrello">Seleziona taglia</button>
					</div>
				</div>
			</div>
			<div id = "informazioni-attributi">
				<div id = "informazioni">
					<div id = "titolo-informazioni">
						<span>informazioni sul prodotto</span>
					</div>
					
					<div id = "testo-informazioni">
						<p>
							${prodotto.modelloProdotto.informazioni}
						<p>
					</div>
				</div>
				
				<div id = "attributi">
					<div id = "categoria">
						Categoria: ${prodotto.modelloProdotto.categoria}
					</div>
					<div id = "genere">
						Genere: ${prodotto.genere}
					</div>
					<div id = "collezione">
						Collezione: ${prodotto.modelloProdotto.collezione}
					</div>
				</div>
			</div>
		</div>
		
	<%@ include file = "fragments/footer.html" %>
		<script src = "javascript/jquery-3.6.0.js"></script>
		<script src = "javascript/addToCart.js"></script>
		<script src = "javascript/carrello.js"></script>
		<script type="text/javascript" src = "javascript/wish_list.js"></script>
		<script type="text/javascript">
			function changeFoto(img)
			{
				$("#foto-principale").attr("src",img.attr("src"));
			}
			
			function wishSuccess(response)
			{
				response = JSON.parse(response);
				if(response.inWishList)
				{
					$(".wishlist img").attr("src","img/cuore.png");
				}
				else
				{
					$(".wishlist img").attr("src","img/wish_list.png");
				}
			}
		</script>
		<script type="text/javascript">
			$(document).ready
			(
				function()
				{
					$(".immagine-laterale").click(function(){changeFoto($(this))});
					inizializzaCart();
					attivaWishList("wishlist",wishSuccess);
				}
			)
		</script>
	</body>
</html>