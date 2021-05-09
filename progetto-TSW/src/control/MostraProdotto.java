package control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ImageDAO;
import model.ImageDAODS;
import model.ProductDAO;
import model.ProductDAODS;
import model.TemplateColorVariantBean;
import model.TemplateColorVariantDAO;
import model.TemplateColorVariantDAODS;
import model.ProductTemplateBean;
import model.ProductTemplateDAO;
import model.ProductTemplateDAODS;

@WebServlet("/mostraProdotto")
public class MostraProdotto extends HttpServlet 
{
	private static ProductTemplateDAO productTemplateModel = new ProductTemplateDAODS();
	private static TemplateColorVariantDAO productTemplateVariantModel = new TemplateColorVariantDAODS(); 
	private static ProductDAO productModel = new ProductDAODS();
	private static ImageDAO imageModel = new ImageDAODS();
	
	public void doGet(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException
	{
		String templateCode = request.getParameter("codiceModello");
		if(templateCode == null)
		{
			chiamaErrore(request, response, "Prodotto mancante");
			return;
		}
		ProductTemplateBean modelloProdotto;
		try
		{
			int codiceModello = Integer.parseInt(templateCode);
			String code = request.getParameter("codice");
			TemplateColorVariantBean templateVariant;
			modelloProdotto = productTemplateModel.doRetrieveByKey(codiceModello);
			modelloProdotto.setVariantiModello(productTemplateVariantModel.doRetriveVariantsForTemplate(modelloProdotto));
			if(code == null)
			{
				templateVariant = modelloProdotto.getVariantiModello().get(0);
			}
			else
			{
				int codice = Integer.parseInt(code);
				templateVariant = productTemplateVariantModel.doRetrieveByKey(codice);
				templateVariant.setModelloProdotto(modelloProdotto);
			}
			templateVariant.setProdotti(productModel.doRetriveForVariant(templateVariant));
			templateVariant.setImmaginiVariante(imageModel.doRetrieveAllFromTemplateVariant(templateVariant));
			if(templateVariant.getCodice() != -1)
				request.setAttribute("prodotto", templateVariant);
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
