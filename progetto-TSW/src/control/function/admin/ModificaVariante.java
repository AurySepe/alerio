package control.function.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.AdminServlet;
import model.bean.ProductBean;
import model.bean.TemplateColorVariantBean;
import model.ds.DAOS;

@WebServlet("/admin/modificaVariante")

public class ModificaVariante extends AdminServlet 
{
	public void doGet(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException
	{
		if(!verificaAdmin(request, response))
			return;
		try
		{
			int code = Integer.parseInt(request.getParameter("codice"));
			TemplateColorVariantBean variante = DAOS.getProductTemplateVariantModel().doRetrieveByKey(code);
			variante.setProdotti(DAOS.getProductModel().doRetriveForVariant(variante));
			for(ProductBean prodotto : variante.getProdotti())
			{
				String taglia = prodotto.getTaglia();
				String quantitaString = request.getParameter("quantita-" + taglia);
				int quantita = 0;
				if(quantitaString != null && !quantitaString.equals(""))
				{
					quantita = Integer.parseInt(quantitaString); 
				}
				prodotto.setQuantita(quantita);
				DAOS.getProductModel().doUpdate(prodotto);
			}
			response.sendRedirect(response.encodeRedirectURL("variante?codice=" + variante.getCodice()));
			return;
		}
		catch(Exception e)
		{
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
