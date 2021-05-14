package control;

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

import model.ImageBean;
import model.ImageDAO;
import model.ImageDAODS;
import model.TemplateColorVariantBean;
import model.TemplateColorVariantDAO;
import model.TemplateColorVariantDAODS;
import model.ProductTemplateBean;
import model.ProductTemplateDAO;
import model.ProductTemplateDAODS;

@WebServlet("/catalogo")
public class CatalogoServlet extends HttpServlet 
{

	private static final long serialVersionUID = 1L;
	
	private static ProductTemplateDAO productTemplateModel = new ProductTemplateDAODS();
	private static ImageDAO imageModel = new ImageDAODS();
	private static TemplateColorVariantDAO productTemplateVariantModel = new TemplateColorVariantDAODS();
	
	public void doGet(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException
	{
		response.setContentType("text/html");
		String order = request.getParameter("ordine");
		Collection<ProductTemplateBean> catalogo = null;
		try
		{
			catalogo = productTemplateModel.doRetrieveAll(order);
			for(ProductTemplateBean b : catalogo)
			{
				b.setVariantiModello(productTemplateVariantModel.doRetriveVariantsForTemplate(b));
				for(TemplateColorVariantBean d : b.getVariantiModello())
				{
					d.setImmaginiVariante(imageModel.doRetrieveAllFromTemplateVariant(d));
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
