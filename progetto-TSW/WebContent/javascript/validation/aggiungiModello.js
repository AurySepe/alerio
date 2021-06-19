/**
 * 
 */

function validazioneAggiungiModello()
{
	$("#nuovoModello-button").click
	(
		function()
		{
			var elementi = {};
			elementi.nome = {"validazione" : valNome, "valore" : getValue};
			elementi.categoria = {"validazione" : valCategoria, "valore" : getValue};
			elementi.collezione = {"validazione" : valCollezione, "valore" : getValue};
			var result = checkTextArea();
			if(controllaForm("form-nuovoModello",elementi) && result)
			{
				$("#form-nuovoModello").submit();
			}
		}
	)
}

function checkTextArea()
{
	if($("#informazioni textarea").val() === "")
	{
		$("#informazioni span.errore").html("inserisci delle informazioni");
		return false;
	}
	else
	{
		$("#informazioni span.errore").html("");
		return true;
		
	}
}
function valNome(s)
{
	var response = {};
	response.valore = true;
	response.messaggio = "";
	if(!regNome(s))
	{
		response.valore = false;
		response.messaggio = "il nome non è valido";
	}
	
	return response
}

function valInformazioni(s)
{
	var response = {};
	response.valore = true;
	response.messaggio = "";
	console.log(s);
	if(s === "")
	{
		response.valore = false;
		response.messaggio = "inserire delle informazioni";
	}
	return response
}

function valCategoria(s)
{
	var response = {};
	response.valore = true;
	response.messaggio = "";
	if(!regNome(s))
	{
		response.valore = false;
		response.messaggio = "la categoria non è valida";
	}
	
	return response
}

function valCollezione(s)
{
	var response = {};
	response.valore = true;
	response.messaggio = "";
	if(!regNome(s))
	{
		response.valore = false;
		response.messaggio = "la collezione non è valida";
	}
	
	return response
}