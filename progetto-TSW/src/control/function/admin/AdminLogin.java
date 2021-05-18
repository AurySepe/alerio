package control.function.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/admin/login")
public class AdminLogin extends HttpServlet 
{
	public void doGet(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException
	{
		response.sendError(response.SC_METHOD_NOT_ALLOWED);	
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException
	{
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		if((username != null && password != null) && username.equals("admin") && password.equals("admin"))
		{
			HttpSession session = request.getSession();
			String paginaPrecedente = "admin";
			synchronized (session) 
			{
				session.setAttribute("isAdmin", true);
				session.setMaxInactiveInterval(3600);
				if(session.getAttribute("pagina admin precedente") != null)
				{
					paginaPrecedente = (String) session.getAttribute("pagina admin precedente");
				}
			}
			response.sendRedirect(paginaPrecedente);
		}
		else
		{
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin/adminLogin.jsp");
			dispatcher.forward(request, response);
		}
	}
}
