/**
 * 
 */

function nuovaCarta(success)
{
	$("#nuovaCarta").click
					(
						function()
						{
							var dati = {};
							$("#aggiungi-carta input").each
							(
								function()
								{
									dati[$(this).attr("name")] = $(this).val();
								}
							)
							var request = {"richiesta" : JSON.stringify(dati)};
							$.get("/progetto-TSW/nuovacarta",request,success);
						}	
							
					)
}

