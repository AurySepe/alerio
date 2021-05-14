<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <% if(session.getAttribute("loggato")==null)
    	session.setAttribute("loggato", "false");%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title> Barra navigazionale </title>
    <link href="../css/stileGenerale.css" rel="stylesheet" type="text/css">
    <link href="../css/barraNavigazionalePrinc.css" rel="stylesheet" type="text/css">
</head>

<body>
	<header>
        <img src="C:\Users\Utente\eclipse-workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work\Catalina\localhost\progetto-TSW\img" alt="immagine principale non visualizzabile" width="50" height="50">
    <nav>
        
            <ul>
                
                <li> <a href="http://localhost:8081/progetto-TSW/carrello"><img src="${pageContext.request.contextPath}/img/some.png/" alt="icona carrello non visualizzabile" width="20" height="20"></a></li>
                <li> <img src="${pageContext.request.contextPath}/img/wish_list.png"/ alt="icona wish list non visualizzabile" width="20" height="20"> </li>
  
                <li> <img src="img/lente_di_ricerca.jpg" alt="icona lente non visualizzabile" width="20" height="20"> </li>
                <% if(session.getAttribute("loggato").equals("false")){ %>
                <li> <a href="http://localhost:8081/progetto-TSW/loginPage.jsp"> <img src="<%=request.getContextPath()%>\img\profilo.jpg" alt="icona profilo non visualizzabile" width="20" height="20"> </a></li>
                <% } else{ %> 
                <li> <a href="https://www.google.it/"> <img src="<%=request.getContextPath()%>\img\profilo.jpg" alt="icona profilo non visualizzabile" width="20" height="20"> </a></li>
                <% } %>
            </ul>
        </nav>
	</header>
</body>
</html>