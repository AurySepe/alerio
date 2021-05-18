package control.page.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.AdminServlet;

@WebServlet("/admin")
public class AdminPage extends AdminServlet 
{
	public void doGet(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException
	{
			
		if(!verificaAdmin(request, response))
			return;
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin/adminPage.jsp");
		dispatcher.forward(request, response);	
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response)
	throws IOException,ServletException
	{
		doGet(request, response);	
	}
}
