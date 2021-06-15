package control.function.admin;

import java.io.IOException;
import java.util.Enumeration;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.AdminServlet;
import model.JsonParser;
import model.bean.ProductBean;
import model.bean.TemplateColorVariantBean;
import model.ds.DAOS;

@WebServlet("/admin/modificaVariante")

public class ModificaVariante extends AdminServlet 
{
	public void doGet(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException
	{
		if(!verificaAdminAjax(request, response))
		{
			response.sendError(HttpServletResponse.SC_FORBIDDEN);
			return;
		}
		try
		{
			Map<String, Object> req = JsonParser.fromJson(request.getParameter("richiesta"));
			int code = Integer.parseInt((String) req.get("codice"));
			TemplateColorVariantBean variante = DAOS.getProductTemplateVariantModel().doRetrieveByKey(code);
			variante.setProdotti(DAOS.getProductModel().doRetriveForVariant(variante));
			for(ProductBean prodotto : variante.getProdotti())
			{
				String taglia = prodotto.getTaglia();
				String quantitaString = (String) req.get("quantita-" + taglia);
				int quantita = 0;
				if(quantitaString != null && !quantitaString.equals(""))
				{
					quantita = Integer.parseInt(quantitaString); 
				}
				prodotto.setQuantita(quantita);
				DAOS.getProductModel().doUpdate(prodotto);
			}
			Double prezzo = Double.parseDouble((String) req.get("prezzo"));
			variante.setPrezzoAttuale(prezzo);
			DAOS.getProductTemplateVariantModel().doUpdate(variante);
			response.setStatus(200);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_FORBIDDEN);
			return;
		}
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException
	{
		doGet(request, response);	
	}
}
