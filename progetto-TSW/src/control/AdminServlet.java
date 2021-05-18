package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AdminServlet extends HttpServlet 
{
	public boolean verificaAdmin(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException
	{
		HttpSession session = request.getSession();
		boolean admin = false;
		synchronized (session) 
		{
			admin = session.getAttribute("isAdmin") != null;
		}
		if(!admin)
		{
			
			String Query = "";
			if(request.getQueryString() != null)
			{
				Query = "?" + request.getQueryString();
			}
			synchronized (session) 
			{
				String paginaPrecedente = request.getRequestURI() + Query;
				session.setAttribute("pagina admin precedente",  paginaPrecedente);
				System.out.println(paginaPrecedente);
			}
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin/adminLogin.jsp");
			dispatcher.forward(request, response);
		}
		return admin;
	}
}
