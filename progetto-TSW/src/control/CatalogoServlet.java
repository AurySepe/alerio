package control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ProductBean;
import model.ProductDAO;
import model.ProductDAODS;

public class CatalogoServlet extends HttpServlet 
{

	private static final long serialVersionUID = 1L;
	
	private static ProductDAO productModel = new ProductDAODS();
	
	public void doGet(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException
	{
		response.setContentType("text/html");
		String order = request.getParameter("ordine");
		Collection<ProductBean> catalogo = null;
		try
		{
			catalogo = productModel.doRetrieveAll(order);
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
