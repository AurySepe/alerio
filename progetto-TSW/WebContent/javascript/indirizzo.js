/**
 * 
 */

function nuovoIndirizzo(success)
{
	$("#nuovoIndirizzo").click
					(
						function()
						{
							var dati = {};
							$("#aggiungi-indirizzo input").each
							(
								function()
								{
									dati[$(this).attr("name")] = $(this).val();
								}
							)
							console.log(dati);
							var request = {"richiesta" : JSON.stringify(dati)};
							$.get("/progetto-TSW/nuovoIndirizzo",request,success);
						}	
							
					)
}