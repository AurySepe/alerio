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
         <span>Email:</span>
          <input placeholder = "ex: aurelio@gmail.com" type="text" name="email">
          <span class = "errore"></span> 
        </div>
        <div class = "input" id = "nome">
            <span>Nome:</span> 
            <input placeholder = "ex: Aurelio" type="text" name="nome">
            <span class = "errore"></span> 
        </div>
        <div class = "input" id = "cognome">
            <span>Cognome:</span>
             <input placeholder = "ex: Sepe" type="text" name="cognome">
             <span class = "errore"></span> 
        </div>
        <div class = "input" id = "password">
         <span>Password:</span>
          <input placeholder = "lunghezza: min 5 max 15" type="password" name="password" placeholder="almeno 5 caratteri">
          <span class = "errore"></span>  
        </div>
        <div class="genere">
           <span>Genere:</span>
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