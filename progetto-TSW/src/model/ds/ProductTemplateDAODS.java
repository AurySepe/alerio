package model.ds;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import model.bean.ProductTemplateBean;
import model.bean.TemplateColorVariantBean;
import model.dao.ProductTemplateDAO;


public class ProductTemplateDAODS implements ProductTemplateDAO
{
	
	public synchronized void doSave(ProductTemplateBean product) throws SQLException 
	{

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " +TABLE_NAME
				+ " (NOME, DATA_DI_AGGIUNTA, COLLEZIONE,CATEGORIA,INFORMAZIONI,codice) "
				+ "VALUES (?, ?, ?, ?, ?, ?)";

		try 
		{
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, product.getNome());
			preparedStatement.setDate(2, product.getDataAggiunta());
			preparedStatement.setString(3, product.getCollezione());
			preparedStatement.setString(4, product.getCategoria());
			preparedStatement.setString(5, product.getInformazioni());
			preparedStatement.setInt(6, product.getCodice());
			preparedStatement.executeUpdate();

		} 
		finally 
		{
			try 
			{
				if (preparedStatement != null)
					preparedStatement.close();
			} 
			finally 
			{
				if (connection != null)
					connection.close();
			}
		}
	}
	
	public synchronized boolean doUpdate(ProductTemplateBean productTemplate) throws SQLException
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String updateSQL = "UPDATE " + TABLE_NAME + " "
				+ "SET NOME = ? , DATA_DI_AGGIUNTA = ?, COLLEZIONE = ? , CATEGORIA = ? , INFORMAZIONI = ? "
				+ "WHERE CODICE = ? ";

		try 
		{
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(updateSQL);
			preparedStatement.setString(1, productTemplate.getNome());
			preparedStatement.setDate(2, productTemplate.getDataAggiunta());
			preparedStatement.setString(3, productTemplate.getCollezione());
			preparedStatement.setString(4, productTemplate.getCategoria());
			preparedStatement.setString(5, productTemplate.getInformazioni());
			preparedStatement.setInt(6, productTemplate.getCodice());

			result = preparedStatement.executeUpdate();

		} finally 
		{
			try 
			{
				if (preparedStatement != null)
					preparedStatement.close();
			} 
			finally 
			{
				if (connection != null)
					connection.close();
			}
		}
		return (result != 0);
	}
	
	public synchronized ProductTemplateBean doRetrieveByKey(int code) throws SQLException 
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ProductTemplateBean bean = new ProductTemplateBean();

		String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE CODICE = ?";

		try 
		{
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) 
			{
				bean.setCodice(rs.getInt("CODICE"));
				bean.setNome(rs.getString("NOME"));
				bean.setInformazioni(rs.getString("INFORMAZIONI"));
				bean.setDataAggiunta(rs.getDate("DATA_DI_AGGIUNTA"));
				bean.setCategoria(rs.getString("CATEGORIA"));
				bean.setCollezione(rs.getString("COLLEZIONE"));
			}
		} 
		finally 
		{
			try 
			{
				if (preparedStatement != null)
					preparedStatement.close();
			} 
			finally 
			{
				if (connection != null)
					connection.close();
			}
		}
		return bean;
	}
	
	public synchronized boolean doDelete(int code) throws SQLException 
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "DELETE FROM " + TABLE_NAME + " WHERE CODICE = ?";

		try 
		{
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setInt(1, code);

			result = preparedStatement.executeUpdate();

		} finally 
		{
			try 
			{
				if (preparedStatement != null)
					preparedStatement.close();
			} 
			finally 
			{
				if (connection != null)
					connection.close();
			}
		}
		return (result != 0);
	}
	
	public synchronized Collection<ProductTemplateBean> doRetrieveAll(String order) throws SQLException 
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<ProductTemplateBean> products = new LinkedList<ProductTemplateBean>();

		String selectSQL = "SELECT * FROM " + TABLE_NAME;

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) 
			{
				ProductTemplateBean bean = new ProductTemplateBean();
				bean.setCodice(rs.getInt("CODICE"));
				bean.setNome(rs.getString("NOME"));
				bean.setInformazioni(rs.getString("INFORMAZIONI"));
				bean.setDataAggiunta(rs.getDate("DATA_DI_AGGIUNTA"));
				bean.setCategoria(rs.getString("CATEGORIA"));
				bean.setCollezione(rs.getString("COLLEZIONE"));
				products.add(bean);
			}

		}
		finally 
		{
			try 
			{
				if (preparedStatement != null)
					preparedStatement.close();
			} 
			finally 
			{
				if (connection != null)
					connection.close();
			}
		}
		return products;
	}
	
	
	public ProductTemplateBean doRetrieveVariantTemplate(TemplateColorVariantBean templateVariant)
	throws SQLException 
	{
		
		return doRetrieveByKey(templateVariant.getCodiceModello());
	}
	
	public Collection<ProductTemplateBean> doRetrieveByCategory(String categoria) 
	throws SQLException
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<ProductTemplateBean> products = new LinkedList<ProductTemplateBean>();

		String selectSQL = "SELECT * FROM " + TABLE_NAME;

		if (categoria != null && !categoria.equals("")) {
			selectSQL += " WHERE categoria = ? ";
		}

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			
			if (categoria != null && !categoria.equals(""))
			{
				preparedStatement.setString(1, categoria);
			}

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) 
			{
				ProductTemplateBean bean = new ProductTemplateBean();
				bean.setCodice(rs.getInt("CODICE"));
				bean.setNome(rs.getString("NOME"));
				bean.setInformazioni(rs.getString("INFORMAZIONI"));
				bean.setDataAggiunta(rs.getDate("DATA_DI_AGGIUNTA"));
				bean.setCategoria(rs.getString("CATEGORIA"));
				bean.setCollezione(rs.getString("COLLEZIONE"));
				products.add(bean);
			}

		}
		finally 
		{
			try 
			{
				if (preparedStatement != null)
					preparedStatement.close();
			} 
			finally 
			{
				if (connection != null)
					connection.close();
			}
		}
		return products;
	}
	
	
	public synchronized int nextCode() throws SQLException
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		int result = 1;

		String codiceSQL = "select max(codice) + 1 as nuovo_codice from " + TABLE_NAME;
		
		try 
		{
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(codiceSQL);
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next())
			{
				result = rs.getInt("nuovo_codice");
			}
		}
		finally
		{
			try 
			{
				if (preparedStatement != null)
					preparedStatement.close();
			} 
			finally 
			{
				if (connection != null)
					connection.close();
			}
		}
		return result;
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
	
	private static final String TABLE_NAME = "modello_prodotto";

}
