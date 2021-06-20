/**
 * 
 */

function attivaWishList()
{
	$(".variante button").each
     (
     	function()
        {
       		inWishList($(this).val());
        }
     )
    $(".variante button").click
    (
    	function()
        {
       		toggleWishList($(this).val());
        }
    )
}


function toggleWishList(codice)
{
	var request = {"codice" : codice};
	$.get("/progetto-TSW/toggleWishList",request,WishListSuccess);
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

function inWishList(codice)
{
	var request = {"codice" : codice};
	$.get("/progetto-TSW/inWishList",request,WishListSuccess);
}