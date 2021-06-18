package control.function;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.JsonParser;
import model.bean.UtenteBean;
import model.ds.DAOS;

@WebServlet("/checkEmail")

public class CheckEmail extends HttpServlet 
{
	public void doGet(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException
	{
		doPost(request, response);
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException
	{
		String richiesta = request.getParameter("richiesta");
		try
		{
			Map<String, Object> m = JsonParser.fromJson(richiesta);
			String email = (String) m.get("email");
			UtenteBean u = DAOS.getUtenteModel().doRetrieveByKey(email);
			if(u.getEmail() == null)
				m.put("registrato", false);
			else
				m.put("registrato", u.getEmail().equals(email));
				
			response.getWriter().print(JsonParser.toJson(m));
			response.setStatus(200);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			response.sendError(401);
		}
	}
}
