<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta content="width=device-width, initial-scale=1" name="viewport" />
	<meta charset="UTF-8">
	<title> Chi siamo </title>
	<link href="css/stileGenerale.css" rel="stylesheet" type="text/css" >
	<link href="css/barraNavigazionalePrinc.css" rel="stylesheet" type="text/css">
	<link href ="css/footer.css" rel="stylesheet" type="text/css"> 
	<link href ="css/presentationPage.css" rel="stylesheet" type="text/css"> 
</head>

<body>
	<%@ include file = "fragments/barraNavigazionalePrinc.jsp"%>
	
	<div id="presentazione"> 
		<h1> Alerio gioielli </h1>
		<div class="present">
			<div> <a href="/progetto-TSW/catalogo"> <img src="/progetto-TSW/img/collezioni.jpg" alt="immagine non visualizzabile"> </a></div> 
			Il nostro marchio 100% made in Italy nasce da una passione storica per i gioielli e
			dalla voglia di regalare emozioni. Quando abbiamo creato il nostro se-commerce ci siamo prefissati
			come obiettivo di raggiungere quante più persone possibili accontentandole
			tutte. La professionalità e la serietà sono alla base del nostro lavoro e siamo felici di 
			poter mostrare recensioni positive sul nostro  operato: segno che stiamo riuscendo 
			nell'obiettivo che ci eravamo prefissati. 
		</div>
	</div>
	
	<%@ include file = "fragments/footer.html" %>
	
</body>
</html>