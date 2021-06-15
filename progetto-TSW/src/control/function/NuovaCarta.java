package control.function;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import control.UtenteServlet;
import model.bean.CreditCardBean;
import model.ds.DAOS;


@WebServlet("/nuovacarta")
public class NuovaCarta extends UtenteServlet 
{
	public void doGet(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException
	{
		if(!verificaUtenteAjax(request, response))
		{
			response.sendError(403);
			return;
		}
		CreditCardBean card = new CreditCardBean();
		Gson g = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		try 
		{
			String richiesta = request.getParameter("richiesta");
			card = g.fromJson(richiesta, card.getClass());
			card.setCodice(DAOS.getCreditCardModel().nextCode());
			DAOS.getCreditCardModel().doSave(card);
			response.getWriter().print(g.toJson(card));
			response.setStatus(200);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
			response.sendError(403);
			return;
		}
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException
	{
		doGet(request, response);		
	}
}
