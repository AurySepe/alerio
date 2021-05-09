package control;

import java.io.IOException;
import java.sql.Blob;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import model.ImageBean;
import model.ImageDAO;
import model.ImageDAODS;



@WebServlet("/immagine")
public class MostraImmagine extends HttpServlet 
{
	public void doGet(HttpServletRequest request,HttpServletResponse response)
	throws ServletException,IOException
	{
		String code = request.getParameter("codice");
		response.setContentType("image/*");
		try
		{
			int codice = Integer.parseInt(code);
			ImageBean img = imageModel.doRetrieveByKey(codice);
			Blob imgBlob = img.getImg();
			byte[] imageBytes = imgBlob.getBytes(1, (int) imgBlob.length());
			response.setContentLength(imageBytes.length);
			response.getOutputStream().write(imageBytes);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
		}
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response)
	throws ServletException,IOException
	{
			doGet(request, response);	
	}
	
	private static ImageDAO imageModel = new ImageDAODS();
}
