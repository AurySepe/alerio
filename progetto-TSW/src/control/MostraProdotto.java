package control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ProductBean;
import model.ProductDAO;
import model.ProductDAODS;

@WebServlet("/mostraProdotto")
public class MostraProdotto extends HttpServlet 
{
private static ProductDAO productModel = new ProductDAODS();
	
	public void doGet(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException
	{
		String code = request.getParameter("codice");
		if(code == null)
		{
			chiamaErrore(request, response, "Prodotto mancante");
			return;
		}
		int codice = Integer.parseInt(code);
		ProductBean bean;
		try
		{
			bean = productModel.doRetrieveByKey(codice);
			if(bean.getCodice() != -1)
				request.setAttribute("prodotto", bean);
			RequestDispatcher dispacher = getServletContext().getRequestDispatcher(response.encodeURL("/prodotto.jsp"));
			dispacher.forward(request, response);
		}
		catch (SQLException e) 
		{
			chiamaErrore(request, response, "Prodotto inesistente");
			return;
		}
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException
	{
		doGet(request, response);
	}
	
	private void chiamaErrore(HttpServletRequest request,HttpServletResponse response,String errore) throws ServletException, IOException
	{
		request.setAttribute("error", errore);
		RequestDispatcher dispacher = getServletContext().getRequestDispatcher("/error.jsp");
		dispacher.forward(request, response);
	}
}
