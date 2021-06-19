/**
 * 
 */

function validazioneModello()
{
	$("#variante-button").click
	(
		function()
		{
			var elementi = {};
			elementi.colore = {"validazione" : valColore, "valore" : getValue};
			elementi.inVendita = {"validazione" : valCheckBox, "valore" : getValue};
			elementi.prezzo = {"validazione" : valPrezzo, "valore" : getValue};
			$(".taglia.input").each
			(
				function()
				{
					elementi[$(this).attr("id")] = {"validazione" : valCheckBox, "valore" : getValue};
				}
			);
			$(".quantità.input").each
			(
				function()
				{
					elementi[$(this).attr("id")] = {"validazione" : valQuantita, "valore" : getQuantita};
				}
			);
			$(".foto.input").each
			(
				function()
				{
					elementi[$(this).attr("id")] = {"validazione" : valFoto, "valore" : getFileSize};
				}
			);
			var result = controllaTaglie();
        	if(controllaForm("form-variante",elementi) && result)
			{
				$("#form-variante").submit();
			}
		}
	)
}

function controllaTaglie()
{
	var i = 0;
	$(".taglia.input input").each
	(
		function()
		{
			if(this.checked)
				i++;
		}
	)
	var result = i != 0;
	if(!result)
	{
		$(".taglie > span.errore").html("selezionare almeno una taglia");
	}
	else
	{
		$(".taglie > span.errore").html("");
	}
	return result;
}

function valColore(s)
{
	var response = {};
	response.valore = true;
	response.messaggio = "";
	if(!regColore(s))
	{
		response.valore = false;
		response.messaggio = "il colore non è valido";
	}
	
	return response
}

function valCheckBox(s)
{
	var response = {};
	response.valore = true;
	response.messaggio = "";
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

function getQuantita(s)
{
	if(s.prop("disabled"))
	{
		return "0";
	}
	else
	{
		return getValue(s);
	}
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

function getFileSize(fileInput)
{
	if(fileInput.get(0).files.length === 0)
	{
		return 0;
	}
	return fileInput[0].files[0].size
}

function valFoto(s)
{
	var response = {};
	response.valore = true;
	response.messaggio = "";
	if(s/1000 >= 64)
	{
		response.valore = false;
		response.messaggio = "la dimensione dell'immagine è troppo grande";
	}
	else if(s == 0)
	{
		response.valore = false;
		response.messaggio = "inserire un immagine";
	}
	
	return response
}

