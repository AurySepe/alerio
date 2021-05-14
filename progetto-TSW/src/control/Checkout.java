package control;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Carrello;
import model.ComposizioneBean;
import model.ComposizioneDAO;
import model.ComposizioneDAODS;
import model.ItemCarrello;
import model.OrdineBean;
import model.OrdineDAO;
import model.OrdineDAODS;
import model.UtenteBean;

@WebServlet("/checkout")
public class Checkout extends HttpServlet 
{
	private static OrdineDAO ordineModel = new OrdineDAODS();
	private static ComposizioneDAO composizioneModel = new ComposizioneDAODS();
	
	
	//aggiungere controllo carta e consegna
	public void doGet(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException
	{
		Carrello cart;
		UtenteBean utente;
		HttpSession session = request.getSession();
		
		synchronized (session) 
		{
			cart = (Carrello) session.getAttribute("carrello");
			utente = (UtenteBean) session.getAttribute("utente");
		}
		if(utente == null)
		{
			synchronized (session) 
			{
				String Query = "";
				if(request.getQueryString() != null)
				{
					Query = "?" +  request.getQueryString();
				}
				session.setAttribute("pagina precedente", request.getRequestURI()+ Query);
				System.out.println(session.getAttribute("pagina precedente"));
			}
			response.sendRedirect(response.encodeRedirectURL("loginPage.jsp"));
			return;
		}
		
		if(cart.isEmpty())
		{
			response.sendError(response.SC_FORBIDDEN);
			return;
		}
		else
		{
			try
			{
				OrdineBean ordine = new OrdineBean();
				ordine.setCodiceOrdine(ordineModel.nextCode());
				ordine.setEmail(utente.getEmail());
				ordine.setDate(new Date((new java.util.Date()).getTime()) );
				ordine.setIva(0.22);
				ordine.setCosto(cart.getCostoTotale());
				ordine.setTipoUtente("R");
				ordine.setNumeroCarta("AAAA");
				ordine.setCodiceConsegna(1);
				ordineModel.doSave(ordine);
				for(ItemCarrello i : cart.getElementi())
				{
					ComposizioneBean c = new ComposizioneBean();
					c.setCodiceOrdine(ordine.getCodiceOrdine());
					c.setCodiceProdotto(i.getProdotto().getCodice());
					c.setQuantita(i.getQuantitaProdotto());
					c.setPrezzo(i.getProdotto().getVarianteProdotto().getPrezzoAttuale());
					composizioneModel.doSave(c);
				}
				synchronized (session) 
				{
					session.setAttribute("carrello", new Carrello());
					
				}
				response.sendRedirect(response.encodeRedirectURL("ordine?codice=" + ordine.getCodiceOrdine()));
			}
			catch(Exception e)
			{
				e.printStackTrace();
				response.sendError(response.SC_NOT_FOUND);
			}
		}
		
		
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException
	{
		doGet(request, response);
	}
}
