package control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.UtenteBean;
import model.UtenteDAO;
import model.UtenteDAODS;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	
	public static UtenteDAO dao=new UtenteDAODS();
	
	public void doGet (HttpServletRequest request, HttpServletResponse response) 
		throws IOException, ServletException
	{
		chiamaErrore(request, response, "il metodo get non è supportato");
	}
	
	public void doPost (HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException
	{
		String mail=request.getParameter("email");
		String pwd=request.getParameter("password");
		System.out.println(mail + pwd);
		HttpSession session = request.getSession(true);
		UtenteBean utente=new UtenteBean();
		
		try 
		{
			utente.setEmail(mail);
			utente.setPwd(pwd);
			utente=dao.verificaUtente(utente);
			if(utente==null)
			{			
				response.sendRedirect("loginPage.jsp");
			}
			else
			{
				
				session.setAttribute("loggato", "true");
				session.setAttribute("utente", utente);
				if(session.getAttribute("pagina precedente")!=null)
					response.sendRedirect((String)session.getAttribute("pagina precedente"));
				else
					response.sendRedirect("homepage.jsp");
			}
				
			
				
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("pagina bianca");
		}
		
	}

	private void chiamaErrore(HttpServletRequest request,HttpServletResponse response,String errore) throws ServletException, IOException
	{
		request.setAttribute("error", errore);
		RequestDispatcher dispacher = getServletContext().getRequestDispatcher("/error.jsp");
		dispacher.forward(request, response);
	}
}
