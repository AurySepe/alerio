package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class ImageDAODS implements ImageDAO 
{

	
	
	public void doSave(ImageBean image) throws SQLException 
	{
		String query = "insert into " + TABLE_NAME + "(img,posizione,prodotto) " + 
					   "values(?,?,?)";
		Connection cn = null;
		PreparedStatement prep = null;
		try
		{
			cn = ds.getConnection();
			prep = cn.prepareStatement(query);
			prep.setBlob(1, image.getImg());
			prep.setInt(2, image.getPosizione());
			prep.setInt(3, image.getProdotto());
			prep.executeUpdate();
			
		}
		finally
		{
			if(prep != null)
				prep.close();
			if(cn != null)
				cn.close();
		}
		

	}

	
	public boolean doDelete(int code) throws SQLException 
	{
		String query = "delete from " + TABLE_NAME + 
				   	   " where codice = ?";
		Connection cn = null;
		PreparedStatement prep = null;
		int result = 0;
		try
		{
			cn = ds.getConnection();
			prep = cn.prepareStatement(query);
			prep.setInt(1, code);
			result = prep.executeUpdate();
			
		}
		finally
		{
			if(prep != null)
				prep.close();
			if(cn != null)
				cn.close();
		}
		return result != 0;
	}

	
	public ImageBean doRetrieveByKey(int code) throws SQLException 
	{
		String query =  "select * from " + TABLE_NAME + 
			   	   		" where codice = ?";
		Connection cn = null;
		PreparedStatement prep = null;
		ImageBean result = new ImageBean();
		try
		{
			cn = ds.getConnection();
			prep = cn.prepareStatement(query);
			prep.setInt(1, code);
			ResultSet res = prep.executeQuery();
			while(res.next())
			{
				result.setCodice(res.getInt("codice"));
				result.setImg(res.getBlob("img"));
				result.setPosizione(res.getInt("posizione"));
				result.setProdotto(res.getInt("prodotto"));
			}
			
		}
		finally
		{
			if(prep != null)
				prep.close();
			if(cn != null)
				cn.close();
		}
		return result;
		
	}

	
	public Collection<ImageBean> doRetrieveAll(String order) throws SQLException 
	{
		
		if(order != null && !order.equals(""))
			order = " Order by " + order;
		String query =  "select * from " + TABLE_NAME + order;
		Connection cn = null;
		PreparedStatement prep = null;
		Collection<ImageBean> result = new ArrayList<ImageBean>();
		try
		{
			cn = ds.getConnection();
			prep = cn.prepareStatement(query);
			ResultSet res = prep.executeQuery();
			while(res.next())
			{
				ImageBean b = new ImageBean();
				b.setCodice(res.getInt("codice"));
				b.setImg(res.getBlob("img"));
				b.setPosizione(res.getInt("posizione"));
				b.setProdotto(res.getInt("prodotto"));
				result.add(b);
			}
			
		}
		finally
		{
			if(prep != null)
				prep.close();
			if(cn != null)
				cn.close();
		}
		return result;
	}
	
	
	
	public List<ImageBean> doRetrieveAllFromProduct(int prodotto) throws SQLException 
	{
		String query =  "select * from " + TABLE_NAME + " where prodotto = ?"
						+ " order by posizione";
		Connection cn = null;
		PreparedStatement prep = null;
		List<ImageBean> result = new ArrayList<ImageBean>();
		try
		{
			cn = ds.getConnection();
			prep = cn.prepareStatement(query);
			prep.setInt(1, prodotto);
			ResultSet res = prep.executeQuery();
			while(res.next())
			{
				ImageBean b = new ImageBean();
				b.setCodice(res.getInt("codice"));
				b.setImg(res.getBlob("img"));
				b.setPosizione(res.getInt("posizione"));
				b.setProdotto(res.getInt("prodotto"));
				result.add(b);
			}
		}
		finally
		{
			if(prep != null)
				prep.close();
			if(cn != null)
				cn.close();
		}
		return result;
		
	}
	
	private static final String TABLE_NAME = "immagini";
	
	private static DataSource ds;
	
	static
	{
		try
		{
			Context cx = new InitialContext();
			Context dataContext = (Context) cx.lookup("java:comp/env");
			ds = (DataSource) dataContext.lookup("jdbc/storage");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}
	

}
