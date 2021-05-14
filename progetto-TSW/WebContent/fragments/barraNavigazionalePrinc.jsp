<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <% if(session.getAttribute("loggato")==null)
    	session.setAttribute("loggato", "false");%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title> Barra navigazionale </title>
    <link href="/progetto-TSW/css/stileGenerale.css" rel="stylesheet" type="text/css">
    <link href="/progetto-TSW/css/barraNavigazionalePrinc.css" rel="stylesheet" type="text/css">
</head>

<body>
	<header>
        <img src="/progetto-TSW/img/logo.jpg" alt="immagine principale non visualizzabile" width="50" height="50">
    <nav>
        
            <ul>
                
                <li> <a href="carrello"><img src="/progetto-TSW/img/carrello.png" alt="icona carrello non visualizzabile" width="20" height="20"></a></li>
                <li> <img src="/progetto-TSW/img/wish_list.png" alt="icona wish list non visualizzabile" width="20" height="20"> </li>
  
                <li> <img src="/progetto-TSW/img/lente_di_ricerca.jpg" alt="icona lente non visualizzabile" width="20" height="20"> </li>
                <% if(session.getAttribute("loggato").equals("false")){ %>
                <li> <a href="/progetto-TSW/loginPage.jsp"> <img src="/progetto-TSW\img\profilo.jpg" alt="icona profilo non visualizzabile" width="20" height="20"> </a></li>
                <% } else{ %> 
                <li> <a href="https://www.google.it/"> <img src="/progetto-TSW/img\profilo.jpg" alt="icona profilo non visualizzabile" width="20" height="20"> </a></li>
                <% } %>
            </ul>
        </nav>
	</header>
</body>
</html>