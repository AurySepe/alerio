/**
 * 
 */

function validazioneAdminLogin()
{
	$("#adminLogin-button").click
	(
		function()
		{
			var elementi = {};
			elementi.username = {"validazione" : valUsername, "valore" : getValue};
			elementi.password = {"validazione" : valPassword, "valore" : getValue};
			
        	if(controllaForm("adminLogin-form",elementi))
			{
				adminLogin();
			}
		}
	)
}

function adminLoginSuccess(response)
{
	response = JSON.parse(response);
	if(response.admin)
	{
		window.location.href =  response.paginaPrecedente;
	}
	else
	{
		$("#adminLogin-form > span.errore").html("username o password errati");
	}
}

function adminLogin()
{
	var request = {};
	$("input").each
	(
		function()
		{
			request[$(this).attr("name")] = $(this).val();
		}
	);
	$.get("/progetto-TSW/admin/login",request,adminLoginSuccess);
}

function valUsername(s)
{
	var response = {};
	response.valore = true;
	response.messaggio = "";
	if(!regPassword(s))
	{
		response.valore = false;
		response.messaggio = "inserire un username valido";
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
		response.messaggio = "inserire una password valida";
	}
	
	return response
}