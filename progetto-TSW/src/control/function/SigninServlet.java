package control.function;

import java.io.IOException;

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

@WebServlet("/SigninServlet")
public class SigninServlet extends HttpServlet{
	
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException
	{
		chiamaErrore(request, response, "il metodo get non è supportato");
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
			DAOS.getUtenteModel().doSave(utente);
			synchronized(session)
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
		catch(Exception e)
		{
			e.printStackTrace();
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/signinPage.jsp");
			dispatcher.forward(request, response);
		}
		
		
	}

	private void chiamaErrore(HttpServletRequest request,HttpServletResponse response,String errore) throws ServletException, IOException
	{
		request.setAttribute("error", errore);
		RequestDispatcher dispacher = getServletContext().getRequestDispatcher("/error.jsp");
		dispacher.forward(request, response);
	}
	
}
