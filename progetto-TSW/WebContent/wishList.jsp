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
		<link href="css/stileGenerale.css" rel="stylesheet" type="text/css" >
		<link href="css/barraNavigazionalePrinc.css" rel="stylesheet" type="text/css">
		<link href ="css/footer.css" rel="stylesheet" type="text/css"> 
		<title>Wish List</title>
	</head>
	
	<body>
		<%@ include file = "fragments/barraNavigazionalePrinc.jsp" %>
		<table>
			<tr>
				<th>NOME</th>
				<th>PREZZO</th>
				<th>COLORE</th>
			</tr>
		<%for(TemplateColorVariantBean variante : varianti) {
			request.setAttribute("variante", variante);
		%>
			<tr id = "variante-${variante.codice}" class = "variante">
				<td><a href = "mostraProdotto?codiceModello=${variante.codiceModello}
				&codice=${variante.codice}">
				${variante.modelloProdotto.nome}</a></td>
				<td>${variante.prezzoAttuale * (${iva} + 1)}</td>
				<td>${variante.colore}</td>
				<td><button type = "button" value="${variante.codice}"><img alt = "" src ="" width = 50 height = 50></button></td>
			</tr>
		
		<%} %>
			
		</table>
		
		<%@ include file = "fragments/footer.html" %>
		<script src = "javascript/jquery-3.6.0.js"></script>
        <script type="text/javascript" src = "javascript/wish_list.js"></script>
        <script type="text/javascript">
        $(document).ready
    	(
    		function()
    		{
    			attivaWishList();
    		}
    	)
        </script>
	</body>
	
</html>