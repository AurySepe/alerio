package control.page;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.ProductTemplateBean;
import model.bean.TemplateColorVariantBean;
import model.dao.ImageDAO;
import model.dao.ProductDAO;
import model.dao.ProductTemplateDAO;
import model.dao.TemplateColorVariantDAO;
import model.ds.DAOS;
import model.ds.ImageDAODS;
import model.ds.ProductDAODS;
import model.ds.ProductTemplateDAODS;
import model.ds.TemplateColorVariantDAODS;

@WebServlet("/mostraProdotto")
public class MostraProdotto extends HttpServlet 
{

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
			modelloProdotto = DAOS.getProductTemplateModel().doRetrieveByKey(codiceModello);
			modelloProdotto.setVariantiModello(DAOS.getProductTemplateVariantModel().doRetriveVariantsInVenditaForTemplate(modelloProdotto, null));
			if(code == null)
			{
				templateVariant = modelloProdotto.getVariantiModello().get(0);
			}
			else
			{
				int codice = Integer.parseInt(code);
				templateVariant = DAOS.getProductTemplateVariantModel().doRetrieveByKey(codice);
				templateVariant.setModelloProdotto(modelloProdotto);
			}
			templateVariant.setProdotti(DAOS.getProductModel().doRetriveForVariant(templateVariant));
			templateVariant.setImmaginiVariante(DAOS.getImageModel().doRetrieveAllFromTemplateVariant(templateVariant));
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
