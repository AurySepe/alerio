<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	<div class="primo">
		<img src="/progetto-TSW/img/logo.jpg" alt="immagine principale non visualizzabile" width="50" height="50">
        	<h1>  ALERIO </h1>
    <nav>
        
            <ul>
                
                <li> <a href="carrello"><img src="/progetto-TSW/img/carrello.png" alt="icona carrello non visualizzabile" width="20" height="20"></a></li>
                <li> <img src="/progetto-TSW/img/wish_list.png" alt="icona wish list non visualizzabile" width="20" height="20"> </li>
  
                <li> <img src="/progetto-TSW/img/lente_di_ricerca.jpg" alt="icona lente non visualizzabile" width="20" height="20"> </li>
                <% if(session.getAttribute("loggato")==null){ %>
                <li> <a href="/progetto-TSW/loginPage.jsp"> <img src="/progetto-TSW\img\profilo.jpg" alt="icona profilo non visualizzabile" width="20" height="20"> </a></li>
                <% } else{ %> 
                <li> <a href="https://www.google.it/"> <img src="/progetto-TSW/img\profilo.jpg" alt="icona profilo non visualizzabile" width="20" height="20"> </a></li>
                <% } %>
            </ul>
        </nav>
	</div>
        
    	<table>
     	<tr>
     		<td> <a href=""> anelli </a></td>
     		<td> <a href=""> bracciali </a> </td>
     		<td> <a href=""> collane </a></td>
     		<td> <a href=""> fedi nunziali </a></td>
     		<td> <a href=""> coordinati </a></td>
     		<td> <a href=""> orecchini </a></td>
     	</tr>
     </table>
     
        
	</header>
</body>
</html>