/**
 * 
 */

function attivaWishList(cssClass,success)
{

	$("."+ cssClass + " button").each
     (
     	function()
        {
       		inWishList($(this).val(),success);
        }
     )
    $("."+ cssClass + " button").click
    (
    	function()
        {
       		toggleWishList($(this).val(),success);
        }
    )
}


function toggleWishList(codice,success)
{
	var request = {"codice" : codice};
	$.get("/progetto-TSW/toggleWishList",request,success);
}

function WishListSuccess(response)
{
	response = JSON.parse(response);
	if(response.inWishList)
	{
		$("#variante-" + response.codice + " button img").attr("src","img/cuore.png");
	}
	else
	{
		$("#variante-" + response.codice + " button img").attr("src","img/wish_list.png");
	}
}

function inWishList(codice,success)
{
	var request = {"codice" : codice};
	$.get("/progetto-TSW/inWishList",request,success);
}