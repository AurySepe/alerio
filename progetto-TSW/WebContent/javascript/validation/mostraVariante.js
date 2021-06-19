/**
 * 
 */
function validazioneVariante()
{
	$("#submit").click
	(
		
		function()
		{
			var elementi = {};
			elementi.prezzo = {"validazione" : valPrezzo, "valore" : getValue};
			$(".input.taglia").each
			(
				function()
				{
					elementi[$(this).attr("id")] = {"validazione" : valQuantita, "valore" : getValue};
				}
			)
			if(controllaForm("modificaVariante",elementi))
			{
				modificaQuantita();
			}
		}
	)
}

function modificaQuantita()
{
	var dati = {};
	$("#modificaVariante input").each
	(
		function()
		{
			dati[$(this).attr("name")] = $(this).val();
		}
	)
	var wrapper = {"richiesta" : JSON.stringify(dati)};
							
	$.post("/progetto-TSW/admin/modificaVariante",wrapper,function(){});
}


function valQuantita(s)
{
	var response = {};
	response.valore = true;
	response.messaggio = "";
	if(!regQuantita(s))
	{
		response.valore = false;
		response.messaggio = "inserire un numero valido";
	}
	
	return response
}


function valPrezzo(s)
{
	var response = {};
	response.valore = true;
	response.messaggio = "";
	if(!regPrezzo(s))
	{
		response.valore = false;
		response.messaggio = "il prezzo non è valido";
	}
	
	return response
}