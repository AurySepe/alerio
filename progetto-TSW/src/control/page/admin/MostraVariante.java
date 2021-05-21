package control.page.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.AdminServlet;
import model.bean.TemplateColorVariantBean;
import model.ds.DAOS;

@WebServlet("/admin/variante")

public class MostraVariante extends AdminServlet 
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
			variante.setModelloProdotto(DAOS.getProductTemplateModel().doRetrieveVariantTemplate(variante));
			variante.setProdotti(DAOS.getProductModel().doRetriveForVariant(variante));
			variante.setImmaginiVariante(DAOS.getImageModel().doRetrieveAllFromTemplateVariant(variante));
			request.setAttribute("variante", variante);
			RequestDispatcher dispacher = getServletContext().getRequestDispatcher("/admin/mostraVariante.jsp");
			dispacher.forward(request, response);
			return;
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
