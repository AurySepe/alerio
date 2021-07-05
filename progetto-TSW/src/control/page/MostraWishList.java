package control.page;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.UtenteServlet;
import model.WishList;
import model.bean.TemplateColorVariantBean;
import model.bean.UtenteBean;
import model.ds.DAOS;

@WebServlet("/wishList")
public class MostraWishList extends UtenteServlet 
{
	public void doGet(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException
	{
		try
		{
			Collection<TemplateColorVariantBean> varianti = new ArrayList<TemplateColorVariantBean>();
			if(verificaUtenteAjax(request, response))
			{
				UtenteBean utente;
				HttpSession session = request.getSession();
				synchronized (session) 
				{
					utente = (UtenteBean)session.getAttribute("utente");
				}	
			
				varianti = DAOS.getProductTemplateVariantModel().doRetrieveByUserWishlist(utente);
			
			}
			else
			{
				WishList wish;
				HttpSession session = request.getSession();
				synchronized (session) 
				{
					wish = (WishList)session.getAttribute("wishList");
					if(wish == null)
					{
						wish = new WishList();
						session.setAttribute("wishList", wish);
					}
				}
				varianti = wish.getVarianti();
			}
			for(TemplateColorVariantBean variante: varianti)
			{
				variante.setModelloProdotto(DAOS.getProductTemplateModel().doRetrieveVariantTemplate(variante));
				variante.setImmaginiVariante(DAOS.getImageModel().doRetrieveAllFromTemplateVariant(variante));
			}
			request.setAttribute("varianti", varianti);
			RequestDispatcher dispacher = getServletContext().getRequestDispatcher(response.encodeURL("/wishList.jsp"));
			dispacher.forward(request, response);
		}
		catch (Exception e) 
		{
			e.printStackTrace();
			response.sendError(403);
			return;
		}
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException
	{
		doGet(request, response);
	}
}
