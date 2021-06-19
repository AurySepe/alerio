/**
 * 
 */


function validazioneSignIn()
{
	var genere = document.getElementsByName('genere');
    genere[0].checked = true;
    $("#reset-button").click
    	(
    		function()
    		{
    			$("#sigin-form").trigger("reset");
    			var genere = document.getElementsByName('genere');
  				genere[0].checked = true;
    		}
    	)
    $("#sigin-button").click
     	(
        	function()
        	{
        		var elementi = {};
				elementi.email = {"validazione" : valEmail, "valore" : getValue};
				elementi.nome = {"validazione" : valNome, "valore" : getValue};
				elementi.cognome = {"validazione" : valCognome, "valore" : getValue};
				elementi.password = {"validazione" : valPassword, "valore" : getValue};
        		if(controllaForm("sigin-form",elementi))
        		{
        			$("#sigin-form").submit();
        		}
        	}
        )
}


function valEmail(s)
{
	var response = {};
	response.valore = true;
	response.messaggio = "";
	if(!regEmail(s))
	{
		response.valore = false;
		response.messaggio = "l'email non è valida";
	}
	else if(checkEmail(s))
	{
		response.valore = false;
		response.messaggio = "esiste già un account con questa email";
	}
	return response
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

function valCognome(s)
{
	var response = {};
	response.valore = true;
	response.messaggio = "";
	if(!regCognome(s))
	{
		response.valore = false;
		response.messaggio = "il cognome non è valido";
	}
	
	return response
}

function valPassword(s)
{
	var response = {};
	response.valore = true;
	response.messaggio = "";
	if(!regPassword(s))
	{
		response.valore = false;
		response.messaggio = "la Password non è valida";
	}
	
	return response
}

