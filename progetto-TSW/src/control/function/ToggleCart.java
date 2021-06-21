package control.function;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Carrello;
import model.JsonParser;
import model.bean.ProductBean;
import model.bean.ProductTemplateBean;
import model.bean.TemplateColorVariantBean;
import model.ds.DAOS;

@WebServlet("/toggleCart")
public class ToggleCart extends HttpServlet 
{
	
	public void doGet(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException
	{
		String codice = (String)request.getParameter("codice");
		Map<String, Object> resp = new HashMap<String, Object>();
		try
		{
			int code = Integer.parseInt(codice);
			Carrello cart;
			HttpSession session = request.getSession();
			synchronized (session) 
			{
				cart = (Carrello) session.getAttribute("carrello");
				if(cart == null)
				{
					cart = new Carrello();
					session.setAttribute("carrello", cart);
				}
			}
			ProductBean prodotto = DAOS.getProductModel().doRetrieveByKey(code);
			if(cart.getQuantitaProdotto(prodotto) == 0)
			{
				TemplateColorVariantBean variant = DAOS.getProductTemplateVariantModel().doRetrieveByKey(prodotto.getCodiceVarianteModello());
				variant.setModelloProdotto(DAOS.getProductTemplateModel().doRetrieveByKey(variant.getCodiceModello()));
				
				prodotto.setVarianteProdotto(variant);
				cart.aggiungiProdotto(prodotto);
				resp.put("inCart", true);
			}
			else
			{
				cart.rimuoviProdotto(prodotto);
				resp.put("inCart", false);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			response.sendError(403);
		}
		response.getWriter().println(JsonParser.toJson(resp));
		response.setStatus(200);
			
		
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException
	{
		doGet(request, response);
	}
}
