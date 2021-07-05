<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta content="width=device-width, initial-scale=1" name="viewport" />
		<title>Admin</title>
		<link href="/progetto-TSW/css/stileGenerale.css" rel="stylesheet" type="text/css" >
		<link href="/progetto-TSW/css/admin/adminPage.css" rel="stylesheet" type="text/css" >
	</head>

	<body>
		<div id = "adminPage">
			<div id = "contenitore-titolo">
				<span id = "titolo">Benvenuto Admin!</span> 
			</div>
			<div id = "catalogo-ordini">
				<div id = "catalogo">
					<span id = "titolo-catalogo">Catalogo</span>
					<img id = "immagine-catalogo" src = "/progetto-TSW/img/catalogo.jpg" alt = "catalogo">
					<a id = "link-catalogo" href = "/progetto-TSW/admin/catalogo"><button id = "bottone-catalogo">vai al catalogo</button></a>
				</div>
				<div id = "ordini">
					<span id = "titolo-ordini">Ordini</span>
					<img id = "immagine-ordini" src = "/progetto-TSW/img/ordini.png" alt = "ordini">
					<a id = "link-ordini"href = "/progetto-TSW/admin/ordini"><button id = "bottone-ordini">mostra gli ordini</button></a>
				</div>
			</div>
		</div>
	</body>
</html>