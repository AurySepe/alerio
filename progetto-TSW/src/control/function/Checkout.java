package control.function;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.UtenteServlet;
import model.Carrello;
import model.ItemCarrello;
import model.bean.ComposizioneBean;
import model.bean.CreditCardBean;
import model.bean.DeliveryBean;
import model.bean.OrdineBean;
import model.bean.UtenteBean;
import model.dao.ComposizioneDAO;
import model.dao.OrdineDAO;
import model.ds.ComposizioneDAODS;
import model.ds.DAOS;
import model.ds.OrdineDAODS;

@WebServlet("/checkout")
public class Checkout extends UtenteServlet 
{
	
	
	//aggiungere controllo carta e consegna
	public void doGet(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException
	{
		if(!verificaUtente(request, response))
			return;
		Carrello cart;
		UtenteBean utente;
		HttpSession session = request.getSession();
		synchronized (session) 
		{
			cart = (Carrello) session.getAttribute("carrello");
			utente = (UtenteBean) session.getAttribute("utente");
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
				int cardCode = Integer.parseInt(request.getParameter("carta"));
				int deliveryCode = Integer.parseInt(request.getParameter("indirizzo"));
				OrdineBean ordine = new OrdineBean();
				ordine.setCodiceOrdine(DAOS.getOrdineModel().nextCode());
				System.out.println(ordine.getCodiceOrdine());
				ordine.setEmail(utente.getEmail());
				ordine.setData(new Date((new java.util.Date()).getTime()) );
				ServletContext context = getServletContext();
				double iva;
				synchronized (context) {
					iva = Double.parseDouble((String)context.getInitParameter("iva"));
				}
				ordine.setIva(iva);
				ordine.setCosto(cart.getCostoTotale());
				ordine.setCodiceCarta(cardCode);
				ordine.setCodiceConsegna(deliveryCode);
				DAOS.getOrdineModel().doSave(ordine);
				for(ItemCarrello i : cart.getElementi())
				{
					ComposizioneBean c = new ComposizioneBean();
					c.setCodiceOrdine(ordine.getCodiceOrdine());
					c.setCodiceProdotto(i.getProdotto().getCodice());
					c.setQuantita(i.getQuantitaProdotto());
					c.setPrezzo(i.getProdotto().getVarianteProdotto().getPrezzoAttuale());
					DAOS.getComposizioneModel().doSave(c);
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
				response.sendError(response.SC_FORBIDDEN);
			}
		}
		
		
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException
	{
		doGet(request, response);
	}
}
