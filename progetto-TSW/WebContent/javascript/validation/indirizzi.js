/**
 * 
 */

function validazioneIndirizzi(success)
{
	$("#nuovoIndirizzo").click
	(
		function()
		{
			var elementi = {};
			elementi.citta = {"validazione" : valCitta , "valore" : getValue};
			elementi.cap = {"validazione" : valCap , "valore" : getValue};
			elementi.via = {"validazione" : valVia , "valore" : getValue};
			elementi.numeroCivico = {"validazione" : valNumeroCivico , "valore" : getValue};
			elementi.nominativoIndirizzo = {"validazione" : valNominativo , "valore" : getValue};
			elementi.telefono = {"validazione" : valTelefono , "valore" : getValue};
			if(controllaForm("aggiungi-indirizzo",elementi))
			{
				nuovoIndirizzo(success);
			}
		}
	)
}


function valCitta(s)
{
	var response = {};
	response.valore = true;
	response.messaggio = "";
	if(!regNome(s))
	{
		response.valore = false;
		response.messaggio = "la città non è valida";
	}
	
	return response
}

function valCap(s)
{
	var response = {};
	response.valore = true;
	response.messaggio = "";
	if(!regCap(s))
	{
		response.valore = false;
		response.messaggio = "il cap non è valido";
	}
	
	return response
}

function valVia(s)
{
	var response = {};
	response.valore = true;
	response.messaggio = "";
	if(!regNome(s))
	{
		response.valore = false;
		response.messaggio = "la via non è valida";
	}
	
	return response
}

function valNumeroCivico(s)
{
	var response = {};
	response.valore = true;
	response.messaggio = "";
	if(!regNumeroCivico(s))
	{
		response.valore = false;
		response.messaggio = "il numero civico non è valido";
	}
	
	return response
}


function valTelefono(s)
{
	var response = {};
	response.valore = true;
	response.messaggio = "";
	if(!regTelefono(s))
	{
		response.valore = false;
		response.messaggio = "il numero di telefono non è valido";
	}
	
	return response
}