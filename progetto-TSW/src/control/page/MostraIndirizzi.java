package control.page;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.UtenteServlet;
import model.bean.UtenteBean;
import model.ds.DAOS;

@WebServlet("/indirizzi")
public class MostraIndirizzi extends UtenteServlet 
{
	public void doGet(HttpServletRequest request,HttpServletResponse response)
	throws ServletException,IOException
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
			request.setAttribute("utente", utente);
			utente.setIndirizzi(DAOS.getDeliveryModel().doRetrieveAllByUtente(utente));
			request.setAttribute("indirizzi", utente.getIndirizzi());
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
			response.sendError(403);
			return;
		}
		RequestDispatcher dispacher = getServletContext().getRequestDispatcher("/indirizzi.jsp");
		dispacher.forward(request, response);
	}
	
	
	public void doPost(HttpServletRequest request,HttpServletResponse response)
	throws ServletException,IOException
	{
		doGet(request, response);
	}
}
