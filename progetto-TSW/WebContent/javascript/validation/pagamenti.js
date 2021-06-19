/**
 * 
 */

function validazionePagamenti(success)
{
	$("#nuovaCarta").click
	(
		function()
		{
			var elementi = {};
			elementi.numeroCarta = {"validazione" : valCarta, "valore" : getValue};
			elementi.dataScadenza = {"validazione" : valDataScadenza, "valore" : checkData};
			elementi.nominativoCarta = {"validazione" : valNominativo, "valore" : getValue};
			if(controllaForm("aggiungi-carta",elementi))
			{
				nuovaCarta(success);
			}

		}
	)
}


function valCarta(s)
{
	var response = {};
	response.valore = true;
	response.messaggio = "";
	if(!regCarta(s))
	{
		response.valore = false;
		response.messaggio = "il codice non è valido";
	}
	
	return response
}

function checkData(elemento)
{
	var data = elemento.val();
	return Date.parse(data);
}

function valDataScadenza(s)
{
	var response = {};
	response.valore = true;
	response.messaggio = "";
	if(!s)
	{
		response.valore = false;
		response.messaggio = "inserire una data";
	}
	
	return response
}

