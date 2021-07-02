/**
 * 
 */


var taglia = {"bottone" : null};
function inizializzaCart()
{
	
	$(".bottone-taglia").click(function(){setTaglia($(this))});
	$("#bottone-carrello").click(toggleCart);
}

function setTaglia(bottone)
{
	if(taglia.bottone != null)
	{
		taglia.bottone.hover(function(){$(this).css("background-color","#ff92a8")},function(){$(this).css("background-color","#ffbfcc")});
		taglia.bottone.css("background-color","#ffbfcc");
	}
	taglia.bottone = bottone;
	bottone.css("background-color","#ff92a8")
	bottone.hover(function(){$(this).css("background-color","#ff92a8")},function(){$(this).css("background-color","#ff92a8")});	
	$("#bottone-carrello").val(bottone.val());
	inCart(bottone.val());
	
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
		$("#bottone-carrello").html("elimina dal carrello");
		$("#bottone-carrello").css("background-color","#ff92a8");
	}
	else
	{
		$("#bottone-carrello").html("aggiungi al carrello");
		$("#bottone-carrello").css("background-color","#ffbfcc");
	}
}

function toggleCart()
{
	if(taglia.bottone == null)
	{
		$("#taglie").focus();
	}
	var codice = $("#bottone-carrello").val();
	var request = {"codice" : codice};
	$.get("/progetto-TSW/toggleCart",request,inCartSuccess);
}


