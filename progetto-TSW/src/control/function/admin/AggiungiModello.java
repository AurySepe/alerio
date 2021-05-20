package control.function.admin;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.AdminServlet;
import model.bean.ProductTemplateBean;
import model.ds.DAOS;

@WebServlet("/admin/aggiungiModello")

public class AggiungiModello extends AdminServlet 
{
	public void doGet(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException
	{
		if(!verificaAdmin(request, response))
		{			
			return; 
		}
		for(String p : PARAMETRI_NECESSARI)
		{
			if(request.getParameter(p) == null)
			{
				response.sendError(HttpServletResponse.SC_FORBIDDEN);
				return;
			}
		}
		ProductTemplateBean modello = new ProductTemplateBean();
		try
		{
			modello.setCodice(DAOS.getProductTemplateModel().nextCode());
			modello.setNome(request.getParameter("nome"));
			modello.setInformazioni(request.getParameter("informazioni"));
			modello.setCollezione(request.getParameter("collezione"));
			modello.setCategoria(request.getParameter("categoria"));
			modello.setDataAggiunta(new Date(new java.util.Date().getTime()));
			DAOS.getProductTemplateModel().doSave(modello);
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
	
	private static final String[] PARAMETRI_NECESSARI = 
		{
			"nome","informazioni","categoria","collezione"
		};
}
