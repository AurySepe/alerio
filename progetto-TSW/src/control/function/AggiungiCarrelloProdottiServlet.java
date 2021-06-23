package control.function;

import java.io.IOException;
import java.sql.SQLException;
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

import model.Carrello;
import model.ItemCarrello;
import model.JsonParser;
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
		doPost(request, response);
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
					synchronized (cart) 
					{	
						cart.aggiungiProdotto(bean);
					}
				}
				else
				{
					int quantita = 0;					
					quantita = Integer.parseInt(numero);
					synchronized (cart) 
					{	
						cart.settaQuantitaProdotto(bean, quantita);  
					}
				}
			}
			ItemCarrello i = cart.getItem(bean);
			if(i == null)
			{
				i = new ItemCarrello(bean,-1);
			}
			Map<String, Object> resp = new HashMap<String, Object>();
			resp.put("quantita", i.getQuantitaProdotto());
			resp.put("codice", i.getProdotto().getCodice());
			resp.put("prezzo", i.getProdotto().getVarianteProdotto().getPrezzoAttuale());
			Gson g = new Gson();
			response.getWriter().print(JsonParser.toJson(resp));
			response.setStatus(HttpServletResponse.SC_OK);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
		}
	}
}
