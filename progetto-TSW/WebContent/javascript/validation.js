/**
 * 
 */

function controllaInput(dati,nome)
{
	var elemento = dati[nome];
	var valore = $("#" + nome + " input").val();
    if(!elemento.validazione(valore))
    {
      $("#"+ nome +" span.errore").html(elemento.errorMessage);
      dati.submit = false;
    }
    else
    {
      	$("#"+ nome +" span.errore").html("");
    }
}

function valEmail(s)
{
	var emailExp = /^\w+(\.\w+)*@\w+(\.\w+)*(\.\w{2,3})$/
	return emailExp.test(s);
	
}

function valPassword(s)
{
	var passExp = /^[a-zA-Z0-9!@#$%^&*]{5,15}$/
	return passExp.test(s);
}

function valNome(s)
{
	var nameExp = /^[a-zA-Z'\- ]+$/ 
	return nameExp.test(s);
}

function valCognome(s)
{
	var cogExp = /^[a-zA-Z'\- ]+$/ 
	return cogExp.test(s);
}

function checkEmail(s)
{
	var data = {"richiesta" : JSON.stringify({"email" : s})}
	var result = false;
	var success = 
	function(response)
	{
		response = JSON.parse(response);
		result = response.registrato;
	};
	$.get({
 	 url: "/progetto-TSW/checkEmail",
  	 data: data,
 	 success: success,
  	 async:false 
		 });
	return result;
}