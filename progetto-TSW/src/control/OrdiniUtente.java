package control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.OrdineDAO;
import model.OrdineDAODS;
import model.UtenteBean;


@WebServlet("/ordini")
public class OrdiniUtente extends HttpServlet 
{
	private static OrdineDAO ordiniModel = new OrdineDAODS();
	
	public void doGet(HttpServletRequest request,HttpServletResponse response)
	throws ServletException, IOException
	{
		HttpSession session = request.getSession();
		UtenteBean utente;
		synchronized (session) 
		{
			utente = (UtenteBean)session.getAttribute("utente");
		}
		if(utente == null)
		{
			synchronized (session) 
			{
				String Query = "";
				if(request.getQueryString() != null)
				{
					Query = request.getQueryString();
				}
				session.setAttribute("pagina precedente", request.getRequestURI()+ Query);
				System.out.println(session.getAttribute("pagina precedente"));
			}
			response.sendRedirect(response.encodeRedirectURL("login"));
		}
		else
		{
			try
			{
				utente.setOrdini(ordiniModel.doRetriveAllForUtente(utente));
				request.setAttribute("utente", utente);
				RequestDispatcher dispacher = getServletContext().getRequestDispatcher(response.encodeRedirectURL("/ordini.jsp"));
				dispacher.forward(request, response);
			}
			catch(SQLException e)
			{
				response.sendError(response.SC_NOT_FOUND);
			}
		}
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response)
	throws ServletException,IOException
	{
		doGet(request, response);
	}
	
}
