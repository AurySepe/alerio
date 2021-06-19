/**
 * 
 */

function validazioneCheckout()
{
	$("#acquista").click
	(
		function()
		{
			if(verificaCheckBox())
			{
				$("#checkout-form").submit();
			}
		}
		
	)
}

function verificaCheckBox()
{
	var result1 = verificaCheckboxIndirizzi();
	var result2 = verificaCheckboxCarte();
	return result1 && result2;
}

function verificaCheckboxIndirizzi()
{
	var result = false;
	$(".indirizzo-radio").each
	(
		function()
		{
			if(this.checked)
			{
				result = true;
			}
		}
	)
	
	if(!result)
	{
		$("#indirizzo > span.errore").html("selezionare un indirizzo di consegna");
	}
	else
	{
		$("#indirizzo > span.errore").html("");
	}
	return result;
	
}

function verificaCheckboxCarte()
{
	var result = false;
	$(".carta-radio").each
	(
		function()
		{
			if(this.checked)
			{
				result = true;
			}
		}
	)
	
	if(!result)
	{
		$("#pagamento > span.errore").html("selezionare un metodo di pagamento");
	}
	else
	{
		$("#pagamento > span.errore").html("");
	}
	return result;
	
}