package control.function;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import control.UtenteServlet;
import model.JsonParser;
import model.WishList;
import model.bean.TemplateColorVariantBean;
import model.bean.UtenteBean;
import model.ds.DAOS;

@WebServlet("/toggleWishList")
public class ToggleWishlist extends UtenteServlet 
{
	public void doGet(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException
	{
		
		Map<String, Object> risposta = new HashMap<String, Object>();
		try
		{
			int codice = Integer.parseInt(request.getParameter("codice"));
			risposta.put("codice", codice);
			TemplateColorVariantBean variante = DAOS.getProductTemplateVariantModel().doRetrieveByKey(codice);
			if(verificaUtenteAjax(request, response))
			{
				UtenteBean utente;
				HttpSession session = request.getSession();
				synchronized (session) 
				{
					utente = (UtenteBean)session.getAttribute("utente");
				}
				if(!DAOS.getProductTemplateVariantModel().IsInWishList(variante, utente))
				{
					DAOS.getProductTemplateVariantModel().doSaveInWishList(variante, utente);
					risposta.put("inWishList", true);
				}
				else
				{
					DAOS.getProductTemplateVariantModel().doDeleteFromWishList(variante, utente);
					risposta.put("inWishList", false);
				}
			}
			else
			{
				WishList wishList;
				HttpSession session = request.getSession();
				synchronized (session) 
				{
					wishList = (WishList)session.getAttribute("wishList");
					if(wishList == null)
					{
						wishList = new WishList();
						session.setAttribute("wishList", wishList);
					}
				}
				
				if(!wishList.isInWishList(variante))
				{
					wishList.aggiungiProdotto(variante);
					risposta.put("inWishList", true);
				}
				else
				{
					wishList.rimuoviProdotto(variante);
					risposta.put("inWishList", false);
				}
			}
			response.getWriter().println(JsonParser.toJson(risposta));
			response.setStatus(200);
			
			
		}
		catch (Exception e) 
		{
			e.printStackTrace();
			response.sendError(403);
			return;
		}
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException
	{
		doGet(request, response);
	}
}
