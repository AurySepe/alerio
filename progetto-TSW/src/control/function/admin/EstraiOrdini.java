package control.function.admin;

import java.io.IOException;
import java.sql.Date;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.AdminServlet;
import model.JsonParser;
import model.bean.OrdineBean;
import model.bean.UtenteBean;
import model.ds.DAOS;

@WebServlet("/admin/estraiOrdini")

public class EstraiOrdini extends AdminServlet 
{
	public void doGet(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException
	{
		if(!verificaAdminAjax(request, response))
			return;
		String inizio = request.getParameter("inizio");
		String fine = request.getParameter("fine");
		String utente = request.getParameter("utente");
		Date start = null;
		Date end = null;
		UtenteBean user = null;
		try
		{
			if(inizio != null && !inizio.equals(""))
			{
				start = Date.valueOf(inizio);
				request.setAttribute("data-inizio", start);
			}
			
			if(fine != null && !fine.equals(""))
			{
				
				end = Date.valueOf(fine);
				request.setAttribute("data-fine",end) ;
			}
			
			if(utente != null && !utente.equals(""))
			{
				user = DAOS.getUtenteModel().doRetrieveByKey(utente);
				request.setAttribute("utente", user);
			}
			Collection<OrdineBean> ordini = DAOS.getOrdineModel().doRetrieveAllByDatesAndUser(start, end, user);
			Map<String, Object> resp = new HashMap<String, Object>();
			resp.put("ordini", ordini);
			resp.put("numeroOrdini",ordini.size() );
			response.getWriter().println(JsonParser.toJson(resp));
			response.setStatus(200);
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_FORBIDDEN);
			return;
		}
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException
	{
		doGet(request, response);	
	}
}
