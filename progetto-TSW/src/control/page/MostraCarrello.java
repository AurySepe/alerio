package control.page;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Carrello;

@WebServlet("/carrello")
public class MostraCarrello extends HttpServlet 
{
	public void doGet(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException
	{
		HttpSession session = request.getSession();
		synchronized (session) 
		{
			Carrello cart = (Carrello) session.getAttribute("carrello");
			if(cart == null)
			{
				session.setAttribute("carrello", new Carrello());
			}
		}
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(response.encodeURL("/carrello.jsp"));
		dispatcher.forward(request, response);
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException
	{
		doGet(request, response);
	}
}
