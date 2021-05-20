package control.function.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.AdminServlet;
import model.bean.ProductTemplateBean;
import model.bean.TemplateColorVariantBean;
import model.ds.DAOS;

@WebServlet("/admin/disattivaVarianti")

public class DisattivaVarianti extends AdminServlet 
{
	public void doGet(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException
	{
		if(!verificaAdmin(request, response))
			return;
		try
		{
			int codice = Integer.parseInt(request.getParameter("codice"));
			ProductTemplateBean modello = DAOS.getProductTemplateModel().doRetrieveByKey(codice);
			modello.setVariantiModello(DAOS.getProductTemplateVariantModel().doRetriveVariantsForTemplate(modello));
			String[] varianti = request.getParameterValues("varianti");
			for(TemplateColorVariantBean v : modello.getVariantiModello())
			{
				boolean trovato = false;
				if(varianti != null)
				{
					String code = "" + v.getCodice();
					for(String s : varianti)
					{
						if(code.equals(s))
						{
							trovato = true;
						}
					}
				}
				
				v.setInVendita(trovato);
				DAOS.getProductTemplateVariantModel().doUpdate(v);
			}
			response.sendRedirect(response.encodeRedirectURL("modello?codice=" + modello.getCodice()));
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
