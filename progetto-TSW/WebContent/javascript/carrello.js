/**
 * 
 */

function inizializzaCart()
{
	setCartValue();
	$("input.taglia").click(setCartValue);
	$("#bottone").click(toggleCart);
	
	
}


function setCartValue()
{
	var codice = null;
	$("input.taglia").each
	(
		function()
		{
			if(this.checked)
			{
				codice = $(this).val();
			}
		}
	)
	if(codice == null)
	{
		$("#bottone").hide();
	}
	else
	{
		$("#bottone").show();
		$("#bottone").attr("value",codice);
		inCart(codice);
	}
}


function inCart(codice)
{
	var request = {"codice" : codice};
	$.get("/progetto-TSW/inCart",request,inCartSuccess);
}

function inCartSuccess(response)
{
	response = JSON.parse(response);
	if(response.inCart)
	{
		$("#bottone img").attr("src","/progetto-TSW/img/carrello_attivo.png");
	}
	else
	{
		$("#bottone img").attr("src","/progetto-TSW/img/carrello.png");
	}
}

function toggleCart()
{
	var codice = $("#bottone").val();
	var request = {"codice" : codice};
	$.get("/progetto-TSW/toggleCart",request,inCartSuccess);
}


