package control.page;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Carrello;
import model.ItemCarrello;
import model.bean.ProductBean;
import model.ds.DAOS;

@WebServlet("/carrello")
public class MostraCarrello extends HttpServlet 
{
	public void doGet(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException
	{
		HttpSession session = request.getSession();
		synchronized (session) 
		{
			Carrello cart = (Carrello) session.getAttribute("carrello");
			if(cart == null)
			{
				cart = new Carrello();
				session.setAttribute("carrello", cart);
			}
			for(ItemCarrello i : cart.getElementi())
			{
				try
				{					
					ProductBean p = i.getProdotto();
					p.setVarianteProdotto(DAOS.getProductTemplateVariantModel().doRetrieveProductVariant(p));
					p.getVarianteProdotto().setModelloProdotto(DAOS.getProductTemplateModel().doRetrieveVariantTemplate(p.getVarianteProdotto()));
					p.getVarianteProdotto().setImmaginiVariante(DAOS.getImageModel().doRetrieveAllFromTemplateVariant(p.getVarianteProdotto()));
				}
				catch(Exception e)
				{
					e.printStackTrace();
					response.sendError(403);
				}
				
			}
		}
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(response.encodeURL("/carrello.jsp"));
		dispatcher.forward(request, response);
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException
	{
		doGet(request, response);
	}
}
