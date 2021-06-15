package control.function.admin;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import control.AdminServlet;
import model.bean.ProductTemplateBean;
import model.bean.TemplateColorVariantBean;
import model.ds.DAOS;

@WebServlet("/admin/disattivaVarianti")

public class DisattivaVarianti extends AdminServlet 
{
	public void doGet(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException
	{
		if(!verificaAdminAjax(request, response))
		{
			response.sendError(HttpServletResponse.SC_FORBIDDEN);
			return;
		}
			
		try
		{
			String codice = request.getParameter("codice");
			int code = Integer.parseInt(codice);
			TemplateColorVariantBean v = DAOS.getProductTemplateVariantModel().doRetrieveByKey(code);
			v.setInVendita(!v.isInVendita());
			DAOS.getProductTemplateVariantModel().doUpdate(v);
			response.setStatus(200);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_FORBIDDEN);
			return;
		}
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException
	{
		doGet(request, response);		
	}
}
