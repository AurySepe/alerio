package control.function;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Carrello;
import model.bean.ProductBean;
import model.bean.ProductTemplateBean;
import model.bean.TemplateColorVariantBean;
import model.dao.ProductDAO;
import model.dao.ProductTemplateDAO;
import model.dao.TemplateColorVariantDAO;
import model.ds.DAOS;
import model.ds.ProductDAODS;
import model.ds.ProductTemplateDAODS;
import model.ds.TemplateColorVariantDAODS;

@WebServlet("/aggiungiCarrello")
public class AggiungiCarrelloProdottiServlet extends HttpServlet 
{
	
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
			bean = DAOS.getProductModel().doRetrieveByKey(codice);
			bean.setVarianteProdotto(DAOS.getProductTemplateVariantModel().doRetrieveProductVariant(bean));
			bean.getVarianteProdotto().setModelloProdotto(DAOS.getProductTemplateModel().doRetrieveVariantTemplate(bean.getVarianteProdotto()));
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
