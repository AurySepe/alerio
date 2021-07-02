
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.bean.UtenteBean"%>
<%@page import="java.sql.Date"%>
<%@page import="model.bean.OrdineBean"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Collection<UtenteBean> utenti = (Collection<UtenteBean>) request.getAttribute("utenti");
	UtenteBean utente = (UtenteBean) request.getAttribute("utente");
	if(utenti == null)
	{
		response.sendRedirect("ordini");
		return;
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta content="width=device-width, initial-scale=1" name="viewport" />
		<title>ordini</title>
		<link href="/progetto-TSW/css/stileGenerale.css" rel="stylesheet" type="text/css" >
		<link href="/progetto-TSW/css/admin/ordini.css" rel="stylesheet" type="text/css" >
	</head>
	
	<body>
		<%@ include file = "../fragments/admin/BarraNavigazionaleAdmin.jsp" %>
	<div id = "ordini">
		<div id = "informazioni-ricerca">
			<div id = "utente-selezionato">
				<span>Utente: tutti</span>
			</div>
			<div id = "data-partenza">
				<span>Dal ---</span>
			</div>
			<div id = "data-fine">
				<span>Fino al ---</span>
			</div>
		</div>
		<div id = "ordini-selezionati">
			<div id = "titoli-informazioni">
				<span>Data di acquisto</span>
				<span>Iva</span>
				<span>Costo Totale</span>
				<span>Utente</span>
				<span>Dettagli</span>
			</div>
			<!--div class = "ordine">
				<span>${ordine.data}</span>
				<span>${ordine.iva}</span>
				<span>${ordine.costo * (1 + ordine.iva)}</span>
				<span>${ordine.email}</span>
				<span><a href = "/progetto-TSW/ordine?codice=${ordine.codiceOrdine}">dettagli ordine</a></span>
			</div>-->
			<span id = "inserisci-ordine"></span>
		</div>
			<div id = "parametri-ricerca">
				<div id = "titolo-parametri">Cerca ordini:</div>
				<div id = "parametri">
				<div id = "scelta-utente">
					<span>Utente:</span> 
					<select name = "utente" class = "ricerca" id = "utente">
						<option value = "">Tutti</option>
						<%for(UtenteBean u : utenti) {
							request.setAttribute("user", u);
						%>
						<option value = "${user.email}">${user.email}</option>
						<%} %>
					</select>
				</div>
				<div id = "scelta-data-inizio"><span>Da:</span><input id = "inizio" class = "ricerca" type = "date" name = "inizio"></div>
				<div id = "scelta-data-fine"><span>A:</span><input id = "fine" class = "ricerca" type = "date" name = "fine"></div>
				
				</div>
			</div>
		</div>
		<script src = "/progetto-TSW/javascript/jquery-3.6.0.js"></script>
		<script>
			function cercaOrdini(utente,inizio,fine,success)
			{
				request = {"utente" : utente, "inizio" : inizio, "fine" : fine};
				$.get("/progetto-TSW/admin/estraiOrdini",request,success);
			}
			
			function successoRicerca(response)
			{
				response = JSON.parse(response);
				rimuoviOrdini();
				if(response.numeroOrdini == 0)
				{
					$("#inserisci-ordine").before("<div id = 'nessun-ordine' >Nessun ordine trovato</div>")
				}
				else
				{
					for(i = 0 ; i < response.numeroOrdini ; i++)
					{
						aggiungiOrdine(response.ordini[i]);
					}
				}
			}
			
			function rimuoviOrdini()
			{
				$("#nessun-ordine").remove();
				$(".ordine").remove();
			}
			
			function aggiungiOrdine(ordine)
			{
				var s = 
					'<div class = "ordine">\n' +
						'<span>'+ ordine.data +'</span>\n' +
						'<span>'+ ordine.iva +'%</span>\n' +
						'<span>'+ (ordine.costo * (1 + ordine.iva)).toFixed(2) +'€</span>\n' +
						'<span>'+ ordine.email + '</span>\n' +
						'<span><a href = "/progetto-TSW/ordine?codice=' + ordine.codiceOrdine + '">dettagli ordine</a></span>\n' +
					'</div>\n'
				$("#inserisci-ordine").before(s);
			}
			
			function aggiornaTitoli(utente,inizio,fine)
			{
				if(utente != "")
					$("#utente-selezionato span").html("Utente: " + utente);
				else
					$("#utente-selezionato span").html("Utente: Tutti" );
				if(inizio != "")
					$("#data-partenza span").html("Dal " + inizio);
				else
					$("#data-partenza span").html("Dal ---");
				if(fine != "")
					$("#data-fine span").html("Fino al " + fine);
				else
					$("#data-fine span").html("Fino al ---");
					
			}
		</script>
		<script type="text/javascript">
			$(document).ready
			(
				function()
				{
					cercaOrdini(null,null,null,successoRicerca);
					$(".ricerca").change
					(
						function()
						{
							var utente = $("#utente").val();
							var inizio = $("#inizio").val();
							var fine = $("#fine").val();
							aggiornaTitoli(utente,inizio,fine);
							cercaOrdini(utente,inizio,fine,successoRicerca);
						}
					)
				}
			)
		</script>
	</body>
</html>