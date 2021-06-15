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
	
	<div> 
     <form action="/progetto-TSW/SigninServlet" method="post">
        <h1> Sign-in </h1>  
        <p>
         Email:<br>
          <input type="text" name="email"> <br>
        </p>
        <p>
            Nome: <br>
            <input type="text" name="nome"> <br>
        </p>
        <p>
            Cognome:<br>
             <input type="text" name="cognome"> <br>
        </p>
        <p>
         Password:<br>
          <input type="password" name="password" placeholder="almeno 5 caratteri"> <br> 
        </p>
        <p>
            Genere:<br>
             <input type="radio" name="genere" value="f"> f
             <input type="radio" name="genere" value="m"> m
        </p>

        <p>
             <button class="bottone" type="submit"> Sign in </button>
             <button class="bottone" type="reset"> Reset </button>
        </p>
     </form>
        
    </div>
</body>
</html>