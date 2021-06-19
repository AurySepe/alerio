/**
 * 
 */

function nuovoIndirizzo(success)
{
	var dati = {};
	$("#aggiungi-indirizzo input").each
	(
		function()
		{
			dati[$(this).attr("name")] = $(this).val();
		}
	)
	var request = {"richiesta" : JSON.stringify(dati)};
	$.get("/progetto-TSW/nuovoIndirizzo",request,success);
}	
						