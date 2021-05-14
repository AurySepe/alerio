package control;

import java.io.IOException;

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

@WebServlet("/SigninServlet")
public class SigninServlet extends HttpServlet{
	
	public static UtenteDAO dao=new UtenteDAODS();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException
	{
		chiamaErrore(request, response, "il metodo get non � supportato");
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException
	{
		String mail=request.getParameter("email");
		String pwd=request.getParameter("password");
		String nome=request.getParameter("nome");
		String cognome=request.getParameter("cognome");
		String genere=request.getParameter("genere");
		
		UtenteBean utente=new UtenteBean();
		HttpSession session=request.getSession(true);
		utente.setEmail(mail);
		utente.setPwd(pwd);
		utente.setCognome(cognome);
		utente.setNome(nome);
		utente.setGenere(genere);
		utente.setRegistrato(true);
		try 
		{
			String paginaPrecedente;
			synchronized(session)
			{
				dao.doSave(utente);
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
