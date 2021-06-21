<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Login Admin</title>
	<link href="/progetto-TSW/css/stileGenerale.css" rel="stylesheet" type="text/css" >
</head>
<body>
		<div>
			<form  action="/progetto-TSW/admin/login" method="post" id = "adminLogin-form">
               <h1> Log-in </h1>  
               <div class = "input" id = "username">
               
              	  Username: <br/>
              	  <input type="text" name="username" placeholder="Enter username"><br>
              	  <span class = "errore"></span>
               </div>
               <div class = "input" id = "password">
				               
                	Password:<br/>
               		<input type="password" name="password" placeholder="Enter password"> <br> 
               		<span class = "errore"></span>
               </div>
         		<div>
                    <button type="button" id = "adminLogin-button"> Log in </button>
                </div>
                  	<span class = "errore"></span>
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