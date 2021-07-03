<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> Log-in page </title>
	<meta content="width=device-width, initial-scale=1" name="viewport" />
	<link href="css/stileGenerale.css" rel="stylesheet" type="text/css" >
	<link href="css/barraNavigazionalePrinc.css" rel="stylesheet" type="text/css">
	<link href ="css/footer.css" rel="stylesheet" type="text/css"> 
	<link href="css/loginPage.css" rel="stylesheet" type="text/css" >
</head>
<body>
	<div id = "loginPage">
			<form id = "form-login" action="/progetto-TSW/LoginServlet" method="post">
               <h1> Log-in </h1>
               <div class = "input" id = "email">  
                Email:
                <input type="text" name="email" placeholder="Enter email">
                <span class = "errore"></span>
               </div>
               
               <div class = "input" id = "password">
                Password:
                <input type="password" name="password" placeholder="Enter password">
                <span class = "errore"></span> 
               </div>
               <br>
               <div class="contenitoreBottone">
 
                    <button id = "login-button" class="bottone" type="button"> Log in </button>              
                    <a href="signinPage.jsp"> Sign in </a>
                    
               </div>
               <span class = "errore"></span>
            </form>
               
        </div>
        <script src = "javascript/jquery-3.6.0.js"></script>
        <script src = "javascript/validation.js"></script>
        <script type="text/javascript" src = "javascript/abbellimentiGenerali.js"></script>
        <script src = "javascript/validation/login.js"></script>
        <script>
        	$(document).ready
        	(
        		function()
        		{
        			validazioneLogin();
        			abbellimentiGenerali();
        		}
        	)
        </script>
</body>
</html>