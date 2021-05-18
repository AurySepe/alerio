package control.page.admin;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.AdminServlet;
import model.bean.ProductTemplateBean;
import model.bean.TemplateColorVariantBean;
import model.ds.DAOS;


@WebServlet("/admin/catalogo")
public class CatalogoAdmin extends AdminServlet 
{
	
	public void doGet(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException
	{
		if(!verificaAdmin(request, response))
			return;
		try 
		{
			Collection<ProductTemplateBean> modelli = DAOS.getProductTemplateModel().doRetrieveAll("nome");
			for(ProductTemplateBean p : modelli)
			{
				p.setVariantiModello(DAOS.getProductTemplateVariantModel().doRetriveVariantsForTemplate(p));
				TemplateColorVariantBean v = p.getVariantiModello().get(0);
				v.setImmaginiVariante(DAOS.getImageModel().doRetrieveAllFromTemplateVariant(v));
			}
			request.setAttribute("catalogo", modelli);
			RequestDispatcher dispacher = getServletContext().getRequestDispatcher(response.encodeURL("/admin/adminCatalogo.jsp"));
			dispacher.forward(request, response);
		} 
		catch (Exception e) 
		{
			response.sendError(response.SC_FORBIDDEN);
			e.printStackTrace();
		}
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException
	{
		doGet(request, response);	
	}
}
