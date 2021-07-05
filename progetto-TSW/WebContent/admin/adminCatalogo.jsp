<%@page import="model.bean.ProductTemplateBean"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Collection<ProductTemplateBean> catalogo = (Collection<ProductTemplateBean>)request.getAttribute("catalogo");
	if(catalogo == null)
	{
		response.sendRedirect("catalogo");
		return;
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta content="width=device-width, initial-scale=1" name="viewport" />
		<title>catalogo admin</title>
		<link href="/progetto-TSW/css/stileGenerale.css" rel="stylesheet" type="text/css" >
		<link href="/progetto-TSW/css/admin/adminCatalogo.css" rel="stylesheet" type="text/css" >
	</head>
	
	<body>
		<div id = "adminCatalogo">
			<div id = "contenitore-titolo">
				<span id = "titolo">Catalogo</span>
			</div>
			<div id = "contenitore-bottone-aggiungi-modello">
				<a id = "link-bottone-aggiungi-modello" href = "aggiungiModello.jsp">
					<button id = "bottone-aggiungi-modello">Aggiungi un modello</button>
				</a>
			</div>
			<div id = "catalogo">
				<%
				for(ProductTemplateBean template : catalogo){
					request.setAttribute("template", template);
				%>
				<div class = "modello">
					<a class = "link-modello" href = "modello?codice=${template.codice}">
						<span class = "titolo-modello">${template.nome}</span>
						<img class = "immagine-modello evidenziate" src = "../immagine?codice=${template.variantiModello[0].immaginiVariante[0].codice}" alt = "immagine modello" width = 50 height = 50/>
					</a>
				</div>
				<%} %>
			</div>
		</div>
	</body>
</html>