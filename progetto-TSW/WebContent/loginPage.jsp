<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title> Log-in page </title>
	
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
                Email: <br>
                <input type="text" name="email" placeholder="Enter email"><span class = "errore"></span> <br>
               </div>
               
               <div class = "input" id = "password">
                Password: <br>
                <input type="password" name="password" placeholder="Enter password"><span class = "errore"></span> <br> 
               </div>
               <div>
 
                    <button id = "login-button" class="bottone" type="button"> Log in </button>              
                    <a href="signinPage.jsp"> Sign in </a>
                    
               </div>
               <span class = "errore"></span>
            </form>
               
        </div>
        <script src = "javascript/jquery-3.6.0.js"></script>
        <script src = "javascript/validation.js"></script>
        <script type="text/javascript">
        	function controllaForm()
        	{
        		var submit = true;
        		var email = $("#email input").val();
        		if(!valEmail(email))
        		{
        			 $("#email span.errore").html("email non valida");
        			 submit = false;
        		}
        		else
        		{
        			$("#email span.errore").html("");
        		}
        		var password = $("#password input").val();
        		if(!valPassword(password))
        		{
        			 $("#password span.errore").html("password non valida");
        			 submit = false;	
        		}
        		else
        		{
        			$("#password span.errore").html("");
        		}
        		
        		return submit;
        		
        	}
        	
        	function cambiaPagina(response)
        	{
        		response = JSON.parse(response);
        		if(response.loggato)
        		{
        			window.location.href =  response.pagina;
        		}
        		else
        		{
        			$("#form-login > span.errore").html("account non trovato");
        		}
        	}
        </script>
        <script>
        	$(document).ready
        	(
        		function()
        		{
        			$("#login-button").click
        			(
        				function()
        				{
        					if(controllaForm())
        					{
        						var email = $("#email input").val();
        						var password = $("#password input").val();
        						var request = {"email" : email , "password" : password};
        						$.post("/progetto-TSW/LoginServlet",request,cambiaPagina);
        					}
        				}
        			)
        		}
        	)
        </script>
</body>
</html>