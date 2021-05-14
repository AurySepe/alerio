<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
	<link href="css/loginPage.css" rel="stylesheet" type="text/css" >
</head>
<body>
	<%@ include file = "fragments/barraNavigazionalePrinc.jsp" %>
	<div>
			<form class="bottone" action="/progetto-TSW/LoginServlet" method="post">
               <h1> Log-in </h1>  
               <p>
                Email: <input type="text" name="email" placeholder="Enter email"> <br>
               </p>
               
               <p>
                Password: <input type="password" name="password" placeholder="Enter password"> <br> 
               </p>
               
               <p>
                    
                    <button type="submit"> Log in </button>
                </form>
                
                <form class="bottone" action="signinPage.jsp" method="post">
                    <button type="submit"> Sign in </button>
                </form>
                
               </p>
               
        </div>
        <%@ include file = "fragments/footer.html" %>
</body>
</html>