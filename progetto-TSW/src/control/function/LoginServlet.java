package control.function;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import model.WishList;
import model.bean.TemplateColorVariantBean;
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
		Gson g = new Gson();
		
		try 
		{
			Map<String, Object> resp = new HashMap<String, Object>();
			utente.setEmail(mail);
			utente.setPwd(pwd);
			utente=DAOS.getUtenteModel().verificaUtente(utente);
			
			if(utente==null)
			{		
				resp.put("loggato", false);
			}
			else
			{
				resp.put("loggato", true);
				String paginaPrecedente;
				WishList wishList;
				synchronized (session) 
				{
					wishList = (WishList)session.getAttribute("wishList");
					if(wishList != null)
					{
						for(TemplateColorVariantBean variant : wishList.getVarianti())
						{
							if(!DAOS.getProductTemplateVariantModel().IsInWishList(variant, utente))
							{
								DAOS.getProductTemplateVariantModel().doSaveInWishList(variant, utente);
							}
						}
						session.removeAttribute("wishList");
					}
					session.setAttribute("loggato", "true");
					session.setAttribute("utente", utente);
					paginaPrecedente = (String) session.getAttribute("pagina precedente");
					session.setMaxInactiveInterval(3600);
				}
				
				if(paginaPrecedente !=null)
					resp.put("pagina", paginaPrecedente);
				else
					resp.put("pagina", "homepage.jsp");
				
				
			}
			response.getWriter().println(g.toJson(resp));
			response.setStatus(200);	
			
				
		}
		catch(Exception e)
		{
			e.printStackTrace();
			response.sendError(403);		
		}
		
	}

	private void chiamaErrore(HttpServletRequest request,HttpServletResponse response,String errore) throws ServletException, IOException
	{
		request.setAttribute("error", errore);
		RequestDispatcher dispacher = getServletContext().getRequestDispatcher("/error.jsp");
		dispacher.forward(request, response);
	}
}
