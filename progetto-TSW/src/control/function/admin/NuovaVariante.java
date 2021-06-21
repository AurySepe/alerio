package control.function.admin;

import java.io.IOException;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Collection;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


import control.AdminServlet;
import model.bean.ImageBean;
import model.bean.ProductBean;
import model.bean.TemplateColorVariantBean;
import model.ds.DAOS;

@WebServlet("/admin/nuovaVariante")
@MultipartConfig

public class NuovaVariante extends AdminServlet 
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
		try
		{
			TemplateColorVariantBean variante = new TemplateColorVariantBean();
			variante.setCodice(DAOS.getProductTemplateVariantModel().nextCode());
			variante.setColore(request.getParameter("colore"));
			ServletContext context = getServletContext();
			double iva;
			synchronized (context) {
				iva = Double.parseDouble((String)context.getInitParameter("iva"));
			}
			double prezzo = Double.parseDouble(request.getParameter("prezzo")) /(1 + iva);
			variante.setPrezzoAttuale(prezzo);
			variante.setCodiceModello(Integer.parseInt(request.getParameter("codice")));
			variante.setInVendita(request.getParameter("inVendita") != null);
			DAOS.getProductTemplateVariantModel().doSave(variante);
			String[] taglie = request.getParameterValues("taglie");
			if(taglie != null)
			{
				for(String taglia : taglie)
				{
					ProductBean product = new ProductBean();
					product.setCodiceVarianteModello(variante.getCodice());
					product.setTaglia(taglia);
					String quantitaString = request.getParameter(taglia + "-quantita");
					int quantita = 0;
					try
					{
						quantita = Integer.parseInt(quantitaString);
					}
					catch(Exception e)
					{
						quantita = 0;
					}
					product.setQuantita(quantita);
					DAOS.getProductModel().doSave(product);
				}
			}
			int i = 1;
			Part p;
			while((p = request.getPart("immagine" + i)) != null  )
			{
				ImageBean image = new ImageBean();
				image.setCodiceVariante(variante.getCodice());
				image.setPosizione(i);
				byte[] bytes = p.getInputStream().readAllBytes();
				Blob b = DAOS.getBlobModel().getNewBlob();
				b.setBytes(1, bytes);
				image.setImg(b);
				DAOS.getImageModel().doSave(image);
				i++;
			}
			RequestDispatcher dispacher = getServletContext().getRequestDispatcher("/admin/variante?codice=" + variante.getCodice());
			dispacher.forward(request, response);
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_FORBIDDEN);
		}
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException
	{
		doGet(request, response);	
	}
	
	private static final String[] PARAMETRI_NECESSARI = 
		{
			"colore","prezzo","codice"
		};
}
