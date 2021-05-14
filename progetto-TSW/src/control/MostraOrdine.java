package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.ComposizioneBean;
import model.ComposizioneDAO;
import model.ComposizioneDAODS;
import model.ImageDAO;
import model.ImageDAODS;
import model.OrdineBean;
import model.OrdineDAO;
import model.OrdineDAODS;
import model.ProductBean;
import model.ProductDAO;
import model.ProductDAODS;
import model.ProductTemplateBean;
import model.ProductTemplateDAO;
import model.ProductTemplateDAODS;
import model.TemplateColorVariantBean;
import model.TemplateColorVariantDAO;
import model.TemplateColorVariantDAODS;
import model.UtenteBean;
import model.UtenteDAO;
import model.UtenteDAODS;

@WebServlet("/ordine")
public class MostraOrdine extends HttpServlet 
{
	private static OrdineDAO ordineModel = new OrdineDAODS();
	private static ComposizioneDAO composizioneModel = new ComposizioneDAODS();
	private static UtenteDAO utenteModel = new UtenteDAODS();
	private static ProductDAO productModel = new ProductDAODS();
	private static TemplateColorVariantDAO templateColourVariantModel = new TemplateColorVariantDAODS();
	private static ProductTemplateDAO productTemplatModel = new ProductTemplateDAODS();
	private static ImageDAO imageModel = new ImageDAODS();
	
	public void doGet(HttpServletRequest request,HttpServletResponse response)
	throws ServletException,IOException
	{
		try
		{
			int codice = Integer.parseInt(request.getParameter("codice"));
			OrdineBean ordine = ordineModel.doRetrieveByKey(codice);
			ordine.setUtente(utenteModel.doRetriveForOrder(ordine));
			HttpSession session = request.getSession();
			UtenteBean utente;
			synchronized (session) 
			{
				utente = (UtenteBean) session.getAttribute("utente");
			}
			if(utente == null)
			{
				synchronized (session) 
				{
					String Query = "";
					if(request.getQueryString() != null)
					{
						Query = "?" + request.getQueryString();
					}
					session.setAttribute("pagina precedente", request.getRequestURI() + Query);
					System.out.println(session.getAttribute("pagina precedente"));
				}
				response.sendRedirect(response.encodeRedirectURL("loginPage.jsp"));
			}
			else
			{
				if(utente.getEmail().equals(ordine.getUtente().getEmail()))
				{
					ordine.setComposizione(composizioneModel.doRetriveAllForOrder(ordine));
					for(ComposizioneBean c : ordine.getComposizione())
					{
						ProductBean p = productModel.doRetriveForComposizione(c);
						c.setProdotto(p);
						TemplateColorVariantBean v = templateColourVariantModel.doRetrieveProductVariant(p);
						p.setVarianteProdotto(v);
						v.setImmaginiVariante(imageModel.doRetrieveAllFromTemplateVariant(v));
						ProductTemplateBean t = productTemplatModel.doRetrieveVariantTemplate(v);
						v.setModelloProdotto(t);
					}
					request.setAttribute("ordine", ordine);
					RequestDispatcher dispacher = getServletContext().getRequestDispatcher(response.encodeRedirectURL("/ordine.jsp"));
					dispacher.forward(request, response);
				}
				else
				{
					response.sendError(response.SC_FORBIDDEN);
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			response.sendError(response.SC_NOT_FOUND);
		}
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response)
	throws ServletException,IOException
	{
		doGet(request, response);		
	}
}
