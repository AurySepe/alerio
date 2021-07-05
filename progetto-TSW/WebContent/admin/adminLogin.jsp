<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta content="width=device-width, initial-scale=1" name="viewport" />
	<title>Login Admin</title>
	<link href="/progetto-TSW/css/stileGenerale.css" rel="stylesheet" type="text/css" >
	<link href="/progetto-TSW/css/admin/adminLogin.css" rel="stylesheet" type="text/css" >
</head>
<body>
		<div id = "adminLogin">
			<form  action="/progetto-TSW/admin/login" method="post" id = "adminLogin-form">
	        	<fieldset id = "login" >
	          		<legend>Login</legend> 
	               <div class = "input" id = "username">
	               
	              	  <span>Username:</span>
	              	  <input type="text" name="username" placeholder="Enter username">
	              	  <span class = "errore"></span>
	               </div>
	               <div class = "input" id = "password">               
	                	<span>Password:</span>
	               		<input type="password" name="password" placeholder="Enter password">
	               		<span class = "errore"></span>
	               </div>
	         		<div id = "contenitore-bottone">
	                    <button type="button" id = "adminLogin-button"> Log in </button>
	                </div>
	                  	<span class = "errore-login"></span>
	            </fieldset>
             </form>
                
        </div>
        <script src = "/progetto-TSW/javascript/jquery-3.6.0.js"></script>
		<script src = "/progetto-TSW/javascript/validation/adminLogin.js"></script>
		<script type="text/javascript" src = "/progetto-TSW/javascript/abbellimentiGenerali.js"></script>
		<script src = "/progetto-TSW/javascript/validation.js"></script>
		<script type="text/javascript">
			$(document).ready
			(
				function()
				{
					abbellimentiGenerali();
					validazioneAdminLogin();
				}
			)
		</script>
</body>
</html>