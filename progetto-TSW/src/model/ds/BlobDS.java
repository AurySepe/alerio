package model.ds;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BlobDS 
{
	public synchronized Blob getNewBlob() throws SQLException
	{
		Connection	connection = null;
		Blob result = null;
		try 
		{
			connection = ds.getConnection();
			result = connection.createBlob();
			return result; 
		}
		finally 
		{
			if(connection != null)
				connection.close();
				
			
		}
		
	}
	
	
	private static DataSource ds;
	
	static
	{
		try 
		{
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/storage");

		} catch (NamingException e) 
		{
			System.out.println("Error:" + e.getMessage());
		}
	}
}
