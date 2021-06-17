package control.function.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import control.UtenteServlet;
import model.bean.DeliveryBean;
import model.ds.DAOS;

@WebServlet("/nuovoIndirizzo")
public class NuovoIndirizzo extends UtenteServlet 
{
	public void doGet(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException
	{
		if(!verificaUtenteAjax(request, response))
		{
			response.sendError(403);
			return;
		}
		DeliveryBean delivery = new DeliveryBean();
		Gson g = new Gson();
		
		try 
		{
			String richiesta = request.getParameter("richiesta");
			delivery = g.fromJson(richiesta, delivery.getClass());
			delivery.setCodice(DAOS.getDeliveryModel().nextCode());
			DAOS.getDeliveryModel().doSave(delivery);
			response.getWriter().print(g.toJson(delivery));
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
