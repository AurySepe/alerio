package control.function;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.UtenteBean;
import model.dao.UtenteDAO;
import model.ds.DAOS;
import model.ds.UtenteDAODS;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	
	
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
		HttpSession session = request.getSession(true);
		UtenteBean utente=new UtenteBean();
		
		try 
		{
			utente.setEmail(mail);
			utente.setPwd(pwd);
			utente=DAOS.getUtenteModel().verificaUtente(utente);
			if(utente==null)
			{		
				RequestDispatcher dispatcher=getServletContext().getRequestDispatcher(response.encodeURL("/loginPage.jsp"));
				dispatcher.forward(request, response);
			}
			else
			{
				String paginaPrecedente;
				synchronized (session) 
				{
					session.setAttribute("loggato", "true");
					session.setAttribute("utente", utente);
					paginaPrecedente = (String) session.getAttribute("pagina precedente");
					session.setMaxInactiveInterval(3600);
				}
				
				if(paginaPrecedente !=null)
					response.sendRedirect(paginaPrecedente);
				else
					response.sendRedirect("homepage.jsp"); 
			}
				
			
				
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}

	private void chiamaErrore(HttpServletRequest request,HttpServletResponse response,String errore) throws ServletException, IOException
	{
		request.setAttribute("error", errore);
		RequestDispatcher dispacher = getServletContext().getRequestDispatcher("/error.jsp");
		dispacher.forward(request, response);
	}
}
