function addToCart(data,successFunction,failFunction)
{
	$.get("/progetto-TSW/aggiungiCarrello",data,successFunction).fail(failFunction);
}