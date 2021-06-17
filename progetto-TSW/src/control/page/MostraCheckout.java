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
import model.Carrello;
import model.bean.UtenteBean;
import model.ds.DAOS;

@WebServlet("/mostraCheckout")

public class MostraCheckout extends UtenteServlet 
{
	public void doGet(HttpServletRequest request,HttpServletResponse response)
	throws ServletException,IOException
	{
		if(!verificaUtente(request, response))
			return;
		HttpSession session = request.getSession();
		UtenteBean utente;
		Carrello cart;
		synchronized (session) 
		{
			utente = (UtenteBean)session.getAttribute("utente");
			cart = (Carrello)session.getAttribute("carrello");
		}
		try 
		{
			request.setAttribute("utente", utente);
			request.setAttribute("carrello", cart);
			utente.setCarte(DAOS.getCreditCardModel().doRetrieveAllByUtente(utente));
			utente.setIndirizzi(DAOS.getDeliveryModel().doRetrieveAllByUtente(utente));
			request.setAttribute("indirizzi", utente.getIndirizzi());
			request.setAttribute("carte", utente.getCarte());
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
			response.sendError(403);
			return;
		}
		RequestDispatcher dispacher = getServletContext().getRequestDispatcher("/checkout.jsp");
		dispacher.forward(request, response);
	}
	
	
	public void doPost(HttpServletRequest request,HttpServletResponse response)
	throws ServletException,IOException
	{
		doGet(request, response);
	}
}
