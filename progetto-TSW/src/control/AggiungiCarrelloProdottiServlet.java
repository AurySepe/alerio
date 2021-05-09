package control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Carrello;
import model.ProductBean;
import model.ProductDAO;
import model.ProductDAODS;
import model.TemplateColorVariantBean;
import model.TemplateColorVariantDAO;
import model.TemplateColorVariantDAODS;
import model.ProductTemplateBean;
import model.ProductTemplateDAO;
import model.ProductTemplateDAODS;


public class AggiungiCarrelloProdottiServlet extends HttpServlet 
{
	private static ProductDAO productModel = new ProductDAODS();
	private static TemplateColorVariantDAO productTemplateVariantModel = new TemplateColorVariantDAODS();
	private static ProductTemplateDAO productTemplateModel = new ProductTemplateDAODS();
	
	public void doGet(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException
	{
		chiamaErrore(request, response, "il metodo get non è supportato");
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException
	{
		
		String id = request.getParameter("codice");
		String numero = request.getParameter("quantita");
		try
		{
			int codice =  Integer.parseInt(id);
			HttpSession session = request.getSession();
			Carrello cart;
			synchronized(session)
			{
				cart = (Carrello) session.getAttribute("carrello");
				if(cart == null)
				{
					cart = new Carrello();
					session.setAttribute("carrello", cart);
				}
			}
			ProductBean bean = new ProductBean();
			bean = productModel.doRetrieveByKey(codice);
			bean.setVarianteProdotto(productTemplateVariantModel.doRetrieveProductVariant(bean));
			bean.getVarianteProdotto().setModelloProdotto(productTemplateModel.doRetrieveVariantTemplate(bean.getVarianteProdotto()));
			if(bean.getCodice() != -1)
			{
				if(numero == null)
				{
					cart.aggiungiProdotto(bean);
				}
				else
				{
					int quantita = 0;					
					quantita = Integer.parseInt(numero);
					cart.settaQuantitaProdotto(bean, quantita); 
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		RequestDispatcher dispacher = getServletContext().getRequestDispatcher(response.encodeURL("/carrello.jsp"));
		dispacher.forward(request, response);
		
			
	
	}
	
	private void chiamaErrore(HttpServletRequest request,HttpServletResponse response,String errore) throws ServletException, IOException
	{
		request.setAttribute("error", errore);
		RequestDispatcher dispacher = getServletContext().getRequestDispatcher("/error.jsp");
		dispacher.forward(request, response);
	}
}
