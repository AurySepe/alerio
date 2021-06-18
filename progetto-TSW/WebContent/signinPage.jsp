<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title> Sign-in page </title>
	
	<link href="css/stileGenerale.css" rel="stylesheet" type="text/css" >
	<link href="css/barraNavigazionalePrinc.css" rel="stylesheet" type="text/css">
	<link href ="css/footer.css" rel="stylesheet" type="text/css"> 
	<link href="css/loginPage.css" rel="stylesheet" type="text/css" >
	
</head>
<body>
	
	<div id = "loginPage"> 
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
        <div>
            Genere:<br>
             <input type="radio" name="genere" value="f" required> f
             <input type="radio" name="genere" value="m" required> m
        </div>

        <div>
             <button id = "sigin-button" class="bottone" type="button"> Sign in </button>
             <button class="bottone" type="reset"> Reset </button>
        </div>
        <span class = "errore"></span>
     </form>
        
    </div>
   		<script src = "javascript/jquery-3.6.0.js"></script>
        <script src = "javascript/validation.js"></script>
        <script type="text/javascript">
        	
        	function controllaForm()
        	{
        		var elementi = {};
        		elementi.submit = true;
        		elementi.email = {"validazione" : valEmail, "errorMessage" : "l'email non è valida"};
        		elementi.nome = {"validazione" : valNome, "errorMessage" : "il nome non è valido"};
        		elementi.cognome = {"validazione" : valCognome, "errorMessage" : "il cognome non è valido"};
        		elementi.password = {"validazione" : valPassword, "errorMessage" : "la password non è valida"};
        		$("#sigin-form div.input").each
        		(
        				function ()
        				{
        					controllaInput(elementi,$(this).attr("id"))
        				}
        				
        		);
        		var email = $("#email input").val();
        		if(checkEmail(email))
        		{
        			elementi.submit = false;
        			$("#email span.errore").html("è già presente un account con questa mail");
        		}
        		else
        		{
        			$("#email span.errore").html("");
        		}
        		
        		return elementi.submit;	
        	}
        	
        </script>
        <script>
        	$(document).ready
        	(
        		function()
        		{
        			var genere = document.getElementsByName('genere');
        			genere[0].checked = true;
        			$("#sigin-button").click
        			(
        				function()
        				{
        					if(controllaForm())
        					{
        						$("#sigin-form").submit();
        					}
        				}
        			)
        		}
        	)
        </script>
</body>
</html>