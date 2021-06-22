package control.page;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.ImageBean;
import model.bean.ProductTemplateBean;
import model.bean.TemplateColorVariantBean;
import model.dao.ImageDAO;
import model.dao.ProductTemplateDAO;
import model.dao.TemplateColorVariantDAO;
import model.ds.DAOS;
import model.ds.ImageDAODS;
import model.ds.ProductTemplateDAODS;
import model.ds.TemplateColorVariantDAODS;

@WebServlet("/catalogo")
public class CatalogoServlet extends HttpServlet 
{

	private static final long serialVersionUID = 1L;
	
	
	public void doGet(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException
	{
		response.setContentType("text/html");
		String categoria = request.getParameter("categoria");
		String genere = request.getParameter("genere");
		Collection<ProductTemplateBean> catalogo = null;
		try
		{
			
			catalogo = DAOS.getProductTemplateModel().doRetrieveByCategory(categoria);
			for(ProductTemplateBean b : catalogo)
			{
				b.setVariantiModello(DAOS.getProductTemplateVariantModel().doRetriveVariantsInVenditaForTemplate(b,genere));
				for(TemplateColorVariantBean d : b.getVariantiModello())
				{
					d.setImmaginiVariante(DAOS.getImageModel().doRetrieveAllFromTemplateVariant(d));
				}
			}
			request.setAttribute("catalogo", catalogo);
		}
		catch (SQLException e)
		{
			e.printStackTrace();
			request.setAttribute("error", "errore nella visualizzazione del catalogo");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/error.jsp");
			dispatcher.forward(request, response);
			return;
		}
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/catalogo.jsp");
		dispatcher.forward(request, response);
		
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException
	{
		doGet(request, response);
	}

	
}
