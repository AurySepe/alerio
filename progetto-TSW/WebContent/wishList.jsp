<%@page import="model.bean.TemplateColorVariantBean"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	Collection<TemplateColorVariantBean> varianti = (Collection<TemplateColorVariantBean>) request.getAttribute("varianti");
	if(varianti == null)
	{
		response.sendRedirect("wishList"); 
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
		<link href="css/stileGenerale.css" rel="stylesheet" type="text/css" >
		<link href="css/barraNavigazionalePrinc.css" rel="stylesheet" type="text/css">
		<link href ="css/footer.css" rel="stylesheet" type="text/css"> 
		<link href ="css/wishList.css" rel="stylesheet" type="text/css">
		<title>Wish List</title>
	</head>
	
	<body>
		<%@ include file = "fragments/barraNavigazionalePrinc.jsp" %>
		<div class="wishlist">
			<div id="titolo"> <h1> LA TUA WISHLIST </h1> </div>
			
		<%for(TemplateColorVariantBean variante : varianti) {
			request.setAttribute("variante", variante);
		%>
			<div id = "variante-${variante.codice}" class = "variante">
			
				<div class="col1">
					<span class="nome">NOME</span>
					<span><a href = "mostraProdotto?codiceModello=${variante.codiceModello}
						&codice=${variante.codice}">
						${variante.modelloProdotto.nome}</a></span>
				</div>
				
				<div class="col2">
					<span class="prezzo">PREZZO</span>
					<span><%=String.format("%.2f", variante.getPrezzoAttuale() * (iva + 1) )%></span>
				</div>
				
				<div class="col3">
					<span class="colore">COLORE</span>
					<span>${variante.colore}</span>
				</div>
					
				<div class="immagineProdotto">
					<img alt="immagine-prodotto" src="immagine?codice=${variante.immaginiVariante[0].codice}"> 
				</div>
				
				<div class="cuore">
					<button type = "button" value="${variante.codice}"><img alt = "immagine non visualizzabile" src ="" width = 50 height = 50></button>
				</div>
				
			</div>
		
		<%} %>
			
		</div>
		
		<%@ include file = "fragments/footer.html" %>
		<script src = "javascript/jquery-3.6.0.js"></script>
        <script type="text/javascript" src = "javascript/wish_list.js"></script>
        <script type="text/javascript">
        $(document).ready
    	(
    		function()
    		{
    			attivaWishList("variante",WishListSuccess);
    		}
    	)
        </script>
	</body>
	
</html>