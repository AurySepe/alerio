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
		<title>catalogo admin</title>
		<link href="/progetto-TSW/css/stileGenerale.css" rel="stylesheet" type="text/css" >
	</head>
	
	<body>
		<%@ include file = "../fragments/admin/BarraNavigazionaleAdmin.jsp" %>
		<h1>Catalogo</h1>
		<h2><a href = "aggiungiModello.jsp">Aggiungi un Modello</a></h2>
		<%
		for(ProductTemplateBean template : catalogo){
			request.setAttribute("template", template);
		%>
			<div>
				<a href = "modello?codice=${template.codice}"><span>${template.nome}</span></a></br>
				<img class = "evidenziate" src = "../immagine?codice=${template.variantiModello[0].immaginiVariante[0].codice}" alt = "immagine modello" width = 50 height = 50/>
			</div>
		<%} %>
	</body>
</html>