package control.page.admin;

import java.io.IOException;
import java.sql.Date;
import java.util.Collection;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.AdminServlet;
import model.bean.OrdineBean;
import model.bean.UtenteBean;
import model.ds.DAOS;

@WebServlet("/admin/ordini")

public class MostraOrdini extends AdminServlet 
{
	public void doGet(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException
	{
		if(!verificaAdmin(request, response))
			return;
		try
		{	
			Collection<UtenteBean> utenti = DAOS.getUtenteModel().doRetrieveAll();
			request.setAttribute("utenti", utenti);
			RequestDispatcher dispacher = getServletContext().getRequestDispatcher(response.encodeURL("/admin/ordini.jsp"));
			dispacher.forward(request, response);
			
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
