<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title> Log-in page </title>
	
	<link href="css/stileGenerale.css" rel="stylesheet" type="text/css" >
	<link href="css/loginPage.css" rel="stylesheet" type="text/css" >
</head>
<body>
	<div>
			<form action="/progetto-TSW/LoginServlet" method="post">
               <h1> Log-in </h1>  
               <p>
                Email: <br>
                <input type="text" name="email" placeholder="Enter email"> <br>
               </p>
               
               <p>
                Password: <br>
                <input type="password" name="password" placeholder="Enter password"> <br> 
               </p>
               
               <p>
                    
                    <button class="bottone" type="submit"> Log in </button>              
                    <a href="signinPage.jsp"> Sign in </a>
                    
                 </p>
                </form>
               
        </div>
</body>
</html>