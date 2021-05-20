<%@page import="model.bean.TemplateColorVariantBean"%>
<%@page import="model.bean.ProductTemplateBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<%
	
	if(session.getAttribute("isAdmin") == null)
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
			<form action = "aggiungiModello" method = "post">
				NOME:<input name = "nome"  type = "text"></br>
				INFORMAZIONI:<textarea name = "informazioni" rows="4" cols="50"></textarea></br>
				COLLEZIONE:<input name = "collezione"  type = "text"></br>
				CATEGORIA:<input name = "categoria"  type = "text"></br>
				<button type = "submit">aggiorna</button>
			</form>
		</div>
	</body>
</html>