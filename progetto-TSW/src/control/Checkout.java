package control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Carrello;

@WebServlet("/checkout")
public class Checkout extends HttpServlet 
{
	public void doGet(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException
	{
		HttpSession session = request.getSession();
		synchronized (session) 
		{
			Carrello cart = new Carrello();
			session.setAttribute("carrello", cart);
		}
		response.sendRedirect(response.encodeURL("catalogo"));
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException
	{
		doGet(request, response);
	}
}
