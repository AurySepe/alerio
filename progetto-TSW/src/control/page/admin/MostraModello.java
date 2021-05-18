package control.page.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.AdminServlet;
import model.bean.ProductTemplateBean;
import model.bean.TemplateColorVariantBean;
import model.ds.DAOS;

@WebServlet("/admin/modello")

public class MostraModello extends AdminServlet 
{
	public void doGet(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException
	{
		if(!verificaAdmin(request, response))
			return;
		String codice = request.getParameter("codice");
		try
		{
			int code = Integer.parseInt(codice);
			ProductTemplateBean modello = DAOS.getProductTemplateModel().doRetrieveByKey(code);
			modello.setVariantiModello(DAOS.getProductTemplateVariantModel().doRetriveVariantsForTemplate(modello));
			for(TemplateColorVariantBean v : modello.getVariantiModello())
			{
				v.setImmaginiVariante(DAOS.getImageModel().doRetrieveAllFromTemplateVariant(v));
			}
			request.setAttribute("modello", modello);
			RequestDispatcher dispacher = getServletContext().getRequestDispatcher(response.encodeURL("/admin/adminModello.jsp"));
			dispacher.forward(request, response);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			response.sendError(response.SC_FORBIDDEN);
		}
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException
	{
		doGet(request, response);	
	}
}
