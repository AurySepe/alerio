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

@WebServlet("/utente")

public class MostraPaginaUtente extends UtenteServlet 
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
		
		request.setAttribute("utente", utente);
		RequestDispatcher dispacher = getServletContext().getRequestDispatcher("/utente.jsp");
		dispacher.forward(request, response);
	}
	
	
	public void doPost(HttpServletRequest request,HttpServletResponse response)
	throws ServletException,IOException
	{
		doGet(request, response);
	}
}
