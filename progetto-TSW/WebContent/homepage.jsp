<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta content="width=device-width, initial-scale=1" name="viewport" />
	<meta charset="UTF-8">
	<title> Homepage </title>
	<link href="css/stileGenerale.css" rel="stylesheet" type="text/css" >
	<link href="css/barraNavigazionalePrinc.css" rel="stylesheet" type="text/css">
	<link href ="css/footer.css" rel="stylesheet" type="text/css"> 
	<link href="css/homepage.css" rel="stylesheet" type="text/css" >
</head>
	
<body>
	
	<%@ include file = "fragments/barraNavigazionalePrinc.jsp"%>
	<div id = "homepage">
	<figure>
            <img class="main" src="/progetto-TSW/img/immagineHomepage.jpg" alt="immagine non visualizzabile">
     </figure>
	
	<div class="esterna">
        <div class="linea">
            <p> I nostri gioielli sono interamente realizzati in Italia, seguendo un processo di lavorazione molto accurato.
            	 Nella provincia di Salerno, centinaia di artigiani lavorano quotidianamente nel nostro stabilimento
            	 per far si che la nostra passione possa arrivare nelle vostre case in tutta Italia.

            </p> 
                <div class="tit">
                   <span> Donna </span>  
                   <div class="interna">
                        <div> <a href=""> <img src="/progetto-TSW/img/anello-donna.JPG" alt="anelli non visualizzabili" width="50" height="50"> </a> <div> anelli </div></div>
                        <div> <a href=""> <img src="/progetto-TSW/img/collana-donna.jpg" alt="collana non visualizzabile" width="50" height="50"> </a> <div> anelli </div> </div>
                        <div> <a href=""> <img src="/progetto-TSW/img/orecchini-donna.jpg" alt="orecchini non visualizzabili" width="50" height="50"> </a> <div> anelli </div> </div>
                   </div>
            	</div>
        </div>

        <div class="linea">
        		<div class="tit">
            		<span> Uomo </span> 

                    <div class="interna">
                        <div> <a href=""> <img src="/progetto-TSW/img/anello-donna.JPG" alt="anelli non visualizzabili" width="50" height="50"> </a> <div> anelli </div></div>
                        <div> <a href=""> <img src="/progetto-TSW/img/collana-donna.jpg" alt="collana non visualizzabile" width="50" height="50"> </a> <div> anelli </div> </div>
                        <div> <a href=""> <img src="/progetto-TSW/img/orecchini-donna.jpg" alt="orecchini non visualizzabili" width="50" height="50"> </a> <div> anelli </div> </div>
                    </div>
                 </div>
                
            <p> La nostra attenzione al cliente è massima, ci teniamo a soddisfare il nostro pubblico e speriamo che la nostra trasparenza 
            	sia gradita. Intanto, come potete vedere, sotto riportiamo alcune testimonianze di clienti che siamo riusciti a soddisfare. 
            	Ci auguriamo di cuore di riuscire a conquistare anche voi, buono shopping! 
        	</p>
        </div>
    </div>
    
    <div class="recensioni">
         <h1> Cosa dicono di noi </h1>
        <div class="imgRec"> 
        	<div class = "immaginiRecensioni"> <img src="/progetto-TSW/img/recensione1.JPG" alt="recensione1 non visualizzabile"> </div>
        	<div class = "immaginiRecensioni"> <img src="/progetto-TSW/img/recensione2.jpg" alt="recensione2 non visualizzabile"> </div>
        	<div class = "immaginiRecensioni"> <img src="/progetto-TSW/img/recensione3.jpg" alt="recensione3 non visualizzabile"> </div>
        </div>  
    </div>
    
    </div>
    
    
    <%@ include file = "fragments/footer.html" %>
    
</body>
</html>