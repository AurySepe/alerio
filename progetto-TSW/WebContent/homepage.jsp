<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title> Homepage </title>
	<link href="css/stileGenerale.css" rel="stylesheet" type="text/css" >
	<link href="css/barraNavigazionalePrinc.css" rel="stylesheet" type="text/css">
	<link href ="css/footer.css" rel="stylesheet" type="text/css"> 
	<link href="css/homepage.css" rel="stylesheet" type="text/css" >
</head>
	
<body>
	<%@ include file = "fragments/barraNavigazionalePrinc.jsp" %>
	
	<div id = "homepage">
	<figure>
            <img class="main" src="/progetto-TSW/img/immagineHomepage.jpg" alt="immagine non visualizzabile">
     </figure>
	
	<table class="esterna">
        <tr>
            <td> I nostri gioielli sono interamente realizzati in Italia, seguendo un processo di lavorazione molto accurato.
            	 Nella provincia di Salerno, centinaia di artigiani lavorano quotidianamente nel nostro stabilimento
            	 per far si che la nostra passione possa arrivare nelle vostre case in tutta Italia. </td>

            <td> 
                <table class="interna">
                    <tr> <th> </th> <th> Donna </th> </tr>
                    <tr>
                        <td> <a href=""> <img src="/progetto-TSW/img/anello-donna.JPG" alt="anelli non visualizzabili" width="50" height="50"> </a> </td>
                        <td> <a href=""> <img src="/progetto-TSW/img/collana-donna.jpg" alt="collana non visualizzabile" width="50" height="50"> </a> </td>
                        <td> <a href=""> <img src="/progetto-TSW/img/orecchini-donna.jpg" alt="orecchini non visualizzabili" width="50" height="50"> </a> </td>
                    </tr>

                    <tr class="nomi">
                        <td class="categoria"> <a href=""> Anelli </a> </td>
                        <td class="categoria"> <a href=""> Collane </a> </td>
                        <td class="categoria"> <a href=""> Orecchini </a> </td>
                    </tr>
                </table>
            </td>
        </tr>

        <tr>
            <td>
                <table class="interna">
                <tr> <th> </th> <th> Uomo </th> </tr>
                    <tr>
                        <td> <a href=""> <img src="/progetto-TSW/img/anello-donna.JPG" alt="anelli non visualizzabili" width="50" height="50"> </a> </td>
                        <td> <a href=""> <img src="/progetto-TSW/img/collana-donna.jpg" alt="collana non visualizzabile" width="50" height="50"> </a> </td>
                        <td> <a href=""> <img src="/progetto-TSW/img/orecchini-donna.jpg" alt="orecchini non visualizzabili" width="50" height="50"> </a> </td>
                    </tr>

                    <tr class="nomi">
                        <td class="categoria"> <a href=""> Anelli </a> </td>
                        <td class="categoria"> <a href=""> Collane </a>  </td>
                        <td class="categoria"> <a href=""> Orecchini </a> </td>
                    </tr>
                </table> 
                
            </td>
            <td> La nostra attenzione al cliente è massima, ci teniamo a soddisfare il nostro pubblico e speriamo che la nostra trasparenza 
            	sia gradita. Intanto, come potete vedere, sotto riportiamo alcune testimonianze di clienti che siamo riusciti a soddisfare. 
            	Ci auguriamo di cuore di riuscire a conquistare anche voi, buono shopping! </td>
        </tr>
    </table>
    
    <div>
        <div> <h1 class="tit_recensioni"> Cosa dicono di noi </h1> </div>
        <div> 
            <table>
                <tr>
                    <td> <img src="/progetto-TSW/img/recensione1.JPG" alt="recensione1 non visualizzabile" width="100%" height="100%"></td>
                    <td> <img src="/progetto-TSW/img/recensione2.jpg" alt="recensione2 non visualizzabile" width="100%" height="100%"></td>
                    <td> <img src="/progetto-TSW/img/recensione3.jpg" alt="recensione3 non visualizzabile" width="100%" height="100%"></td>
                </tr> 
            </table>>
        </div>  
    </div>
    </div>
    
    <%@ include file = "fragments/footer.html" %>
</body>
</html>