package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SigninServlet extends HttpServlet{
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException
	{
		chiamaErrore(request, response, "il metodo get non è supportato");
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse reponse)
			throws IOException, ServletException
	{
		
	}

	private void chiamaErrore(HttpServletRequest request,HttpServletResponse response,String errore) throws ServletException, IOException
	{
		request.setAttribute("error", errore);
		RequestDispatcher dispacher = getServletContext().getRequestDispatcher("/error.jsp");
		dispacher.forward(request, response);
	}
	
}
