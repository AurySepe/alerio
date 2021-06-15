package control.page;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.UtenteServlet;
import model.bean.UtenteBean;
import model.dao.OrdineDAO;
import model.ds.DAOS;
import model.ds.OrdineDAODS;


@WebServlet("/ordini")
public class OrdiniUtente extends UtenteServlet
{
	
	
	public void doGet(HttpServletRequest request,HttpServletResponse response)
	throws ServletException, IOException
	{
		if(!verificaUtente(request, response))
			return;
		HttpSession session = request.getSession();
		UtenteBean utente;
		synchronized (session) 
		{
			utente = (UtenteBean)session.getAttribute("utente");
		}
		
		try
		{
			utente.setOrdini(DAOS.getOrdineModel().doRetriveAllForUtente(utente));
			request.setAttribute("utente", utente);
			RequestDispatcher dispacher = getServletContext().getRequestDispatcher(response.encodeRedirectURL("/ordini.jsp"));
			dispacher.forward(request, response);
		}
		catch(SQLException e)
		{
			e.printStackTrace();
			response.sendError(403);
			return;
		}
		
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response)
	throws ServletException,IOException
	{
		doGet(request, response);
	}
	
}
