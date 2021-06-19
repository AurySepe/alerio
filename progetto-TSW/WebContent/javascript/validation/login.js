/**
 * 
 */

function validazioneLogin()
{
	$("#login-button").click
     (
     	function()
       	{
       		var elementi = {};
			elementi.email = {"validazione" : valEmail, "valore" : getValue};
			elementi.password = {"validazione" : valPassword, "valore" : getValue};
       		if(controllaForm("form-login",elementi))
        	{
        		var email = $("#email input").val();
        		var password = $("#password input").val();
        		var request = {"email" : email , "password" : password};
        		$.post("/progetto-TSW/LoginServlet",request,cambiaPagina);
        	}
      	}
      )
}

function cambiaPagina(response)
{
	response = JSON.parse(response);
    if(response.loggato)
    {
      	window.location.href =  response.pagina;
    }
    else
    {
    	$("#form-login > span.errore").html("account non trovato");
    }
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