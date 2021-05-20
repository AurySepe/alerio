package control.page;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.UtenteServlet;
import model.bean.ComposizioneBean;
import model.bean.OrdineBean;
import model.bean.ProductBean;
import model.bean.ProductTemplateBean;
import model.bean.TemplateColorVariantBean;
import model.bean.UtenteBean;
import model.dao.ComposizioneDAO;
import model.dao.ImageDAO;
import model.dao.OrdineDAO;
import model.dao.ProductDAO;
import model.dao.ProductTemplateDAO;
import model.dao.TemplateColorVariantDAO;
import model.dao.UtenteDAO;
import model.ds.ComposizioneDAODS;
import model.ds.DAOS;
import model.ds.ImageDAODS;
import model.ds.OrdineDAODS;
import model.ds.ProductDAODS;
import model.ds.ProductTemplateDAODS;
import model.ds.TemplateColorVariantDAODS;
import model.ds.UtenteDAODS;

@WebServlet("/ordine")
public class MostraOrdine extends UtenteServlet
{
	
	public void doGet(HttpServletRequest request,HttpServletResponse response)
	throws ServletException,IOException
	{
		if(!verificaUtente(request, response))
			return;
		try
		{
			int codice = Integer.parseInt(request.getParameter("codice"));
			OrdineBean ordine = DAOS.getOrdineModel().doRetrieveByKey(codice);
			ordine.setUtente(DAOS.getUtenteModel().doRetriveForOrder(ordine));
			HttpSession session = request.getSession();
			UtenteBean utente;
			synchronized (session) 
			{
				utente = (UtenteBean) session.getAttribute("utente");
			}
			
			if(utente.getEmail().equals(ordine.getUtente().getEmail()))
			{
				ordine.setComposizione(DAOS.getComposizioneModel().doRetriveAllForOrder(ordine));
				for(ComposizioneBean c : ordine.getComposizione())
				{
					ProductBean p = DAOS.getProductModel().doRetriveForComposizione(c);
					c.setProdotto(p);
					TemplateColorVariantBean v = DAOS.getProductTemplateVariantModel().doRetrieveProductVariant(p);
					p.setVarianteProdotto(v);
					v.setImmaginiVariante(DAOS.getImageModel().doRetrieveAllFromTemplateVariant(v));
					ProductTemplateBean t = DAOS.getProductTemplateModel().doRetrieveVariantTemplate(v);
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
