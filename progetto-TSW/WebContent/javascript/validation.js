/**
 * 
 */

function controllaForm(nomeForm,elementi)
{
    elementi.submit = true;
    $("#"+ nomeForm +" div.input").each
    (
    	function ()
       	{
        	controllaInput(elementi,$(this).attr("id"))
        }
        				
    );		
    return elementi.submit;	
}

function controllaInput(dati,nome)
{
	var elemento = dati[nome];
	var valore = elemento.valore($("#" + nome + " input"));
	var risposta = elemento.validazione(valore);
    if(!risposta.valore)
    {
      dati.submit = false;
    }
    $("#"+ nome +" span.errore").html(risposta.messaggio);
}

function regEmail(s)
{
	var emailExp = /^\w+(\.\w+)*@\w+(\.\w+)*(\.\w{2,3})$/
	return emailExp.test(s);
	
}

function regPassword(s)
{
	var passExp = /^[a-zA-Z0-9!@#$%^&*]{5,15}$/
	return passExp.test(s);
}

function regNome(s)
{
	var nameExp = /^[a-zA-Z'\- ]+$/ 
	return nameExp.test(s);
}

function regCognome(s)
{
	var cogExp = /^[a-zA-Z'\- ]+$/ 
	return cogExp.test(s);
}

function regColore(s)
{
	var colExp = /^[a-zA-Z'\- ]+$/ 
	return colExp.test(s);
}

function regPrezzo(s)
{
	var prezzoExp = /^\d+(\.(\d){1,2})?$/ 
	return prezzoExp.test(s);
}

function regQuantita(s)
{
	var quantitaExp = /^\d+$/ 
	return quantitaExp.test(s);
}

function regNumeroCivico(s)
{
	var quantitaExp = /^[1-9]\d*$/ 
	return quantitaExp.test(s);
}

function regCarta(s)
{
	var quantitaExp = /^\d{16}$/ 
	return quantitaExp.test(s);
}

function regCap(s)
{
	var quantitaExp = /^\d{5}$/ 
	return quantitaExp.test(s);
}

function regTelefono(s)
{
	var quantitaExp = /^(\+\d{2,})?\d{10}$/ 
	return quantitaExp.test(s);
}

//restituisce vero se l'email è già registrata
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

function getValue(elemento)
{
 	return elemento.val();
}

function valNominativo(s)
{
	var response = {};
	response.valore = true;
	response.messaggio = "";
	if(!regNome(s))
	{
		response.valore = false;
		response.messaggio = "il nominativo non è valido";
	}
	
	return response
}