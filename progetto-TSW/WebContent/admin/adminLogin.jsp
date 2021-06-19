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
			<form  action="/progetto-TSW/admin/login" method="post">
               <h1> Log-in </h1>  
               <p>
                Username: <input type="text" name="username" placeholder="Enter username"> <br>
               </p>
               
               <p>
                Password: <input type="password" name="password" placeholder="Enter password"> <br> 
               </p>
         
                    <button type="submit"> Log in </button>
             </form>
                
        </div>
</body>
</html>