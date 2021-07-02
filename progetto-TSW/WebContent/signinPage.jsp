<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> Sign-in page </title>
	<meta content="width=device-width, initial-scale=1" name="viewport" />
	<link href="css/stileGenerale.css" rel="stylesheet" type="text/css" >
	<link href="css/barraNavigazionalePrinc.css" rel="stylesheet" type="text/css">
	<link href ="css/footer.css" rel="stylesheet" type="text/css"> 
	<link href="css/SigninPage.css" rel="stylesheet" type="text/css" >
	
</head>
<body>
	
	<div id = "signinPage"> 
     <form id = "sigin-form" action="/progetto-TSW/SigninServlet" method="post">
        <h1> Sign-in </h1>  
        <div class = "input" id = "email">
         Email:<br>
          <input type="text" name="email"><br>
          <span class = "errore"></span> 
        </div>
        <div class = "input" id = "nome">
            Nome: <br>
            <input type="text" name="nome"><br>
            <span class = "errore"></span> 
        </div>
        <div class = "input" id = "cognome">
            Cognome:<br>
             <input type="text" name="cognome"><br>
             <span class = "errore"></span> 
        </div>
        <div class = "input" id = "password">
         Password:<br>
          <input type="password" name="password" placeholder="almeno 5 caratteri"><br>
          <span class = "errore"></span>  
        </div>
        <div class="genere">
            Genere:<br>
             <input type="radio" name="genere" value="f" required> f
             <input type="radio" name="genere" value="m" required> m
        </div>

        <div class="contenitoreBottone">
             <button id = "sigin-button" class="bottone" type="button"> Sign in </button>
             <button id = "reset-button"class="bottone" type="button"> Reset </button>
        </div>
        <span class = "errore"></span>
     </form>
        
    </div>
   		<script src = "javascript/jquery-3.6.0.js"></script>
   		<script type="text/javascript" src = "javascript/abbellimentiGenerali.js"></script>
        <script src = "javascript/validation.js"></script>
       	<script src = "javascript/validation/signin.js"></script>
        <script>
        	$(document).ready
        	(
        		function()
        		{
        			validazioneSignIn();
        			abbellimentiGenerali();
        		}
        	)
        </script>
</body>
</html>