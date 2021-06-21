package control.function.admin;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.JsonParser;

@WebServlet("/admin/login")
public class AdminLogin extends HttpServlet 
{
	public void doGet(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException
	{
		doPost(request, response);
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException
	{
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Map<String, Object> result = new HashMap<String, Object>();
		if((username != null && password != null) && username.equals("admin") && password.equals("admin"))
		{
			HttpSession session = request.getSession();
			String paginaPrecedente = "admin";
			synchronized (session) 
			{
				session.setAttribute("isAdmin", true);
				session.setMaxInactiveInterval(3600);
				if(session.getAttribute("pagina admin precedente") != null)
				{
					paginaPrecedente = (String) session.getAttribute("pagina admin precedente");
				}
			}
			result.put("admin", true);
			result.put("paginaPrecedente", paginaPrecedente);
		}
		else
		{
			result.put("admin", false);
		}
		response.setStatus(200);
		response.getWriter().println(JsonParser.toJson(result));
	}
}
