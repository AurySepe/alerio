package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UtenteServlet extends HttpServlet 
{
	public boolean verificaUtente(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException
	{
		HttpSession session = request.getSession();
		boolean utente = true;
		synchronized (session) 
		{
			utente = session.getAttribute("utente") != null;
		}
		if(!utente)
		{
					
			String Query = "";
			if(request.getQueryString() != null)
			{
				Query = "?" + request.getQueryString();
			}
			synchronized (session) 
			{
				String paginaPrecedente = request.getRequestURI() + Query;
				session.setAttribute("pagina precedente",  paginaPrecedente);
				System.out.println(paginaPrecedente);
			}
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/loginPage.jsp");
			dispatcher.forward(request, response);
		}
		return utente;
	}
}
