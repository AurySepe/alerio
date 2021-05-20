package model.ds;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import model.bean.ProductBean;
import model.bean.ProductTemplateBean;
import model.bean.TemplateColorVariantBean;
import model.dao.TemplateColorVariantDAO;

public class TemplateColorVariantDAODS implements TemplateColorVariantDAO {

	public synchronized void doSave(TemplateColorVariantBean productDetails) throws SQLException 
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " +TABLE_NAME
				+ " (MODELLO_PRODOTTO, COLORE,IN_VENDITA,PREZZO_ATTUALE,CODICE) "
				+ "VALUES (?, ?, ?, ?, ?)";

		try 
		{
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setInt(1, productDetails.getCodiceModello());
			preparedStatement.setString(2, productDetails.getColore());
			preparedStatement.setBoolean(3, productDetails.isInVendita());
			preparedStatement.setDouble(4, productDetails.getPrezzoAttuale());
			preparedStatement.setInt(5, productDetails.getCodice());
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
	
	public synchronized boolean doUpdate(TemplateColorVariantBean productDetails) throws SQLException
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String updateSQL = "UPDATE " + TABLE_NAME + " "
				+ "SET MODELLO_PRODOTTO = ? , COLORE = ?, IN_VENDITA = ? , PREZZO_ATTUALE = ?  "
				+ "WHERE CODICE = ? ";

		try 
		{
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(updateSQL);
			preparedStatement.setInt(1, productDetails.getCodiceModello());
			preparedStatement.setString(2, productDetails.getColore());
			preparedStatement.setBoolean(3, productDetails.isInVendita());
			preparedStatement.setDouble(4, productDetails.getPrezzoAttuale());
			preparedStatement.setInt(5, productDetails.getCodice());
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

	public synchronized TemplateColorVariantBean doRetrieveByKey(int code) throws SQLException 
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		TemplateColorVariantBean bean = new TemplateColorVariantBean();

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
				bean.setColore(rs.getString("COLORE"));
				bean.setPrezzoAttuale(rs.getDouble("PREZZO_ATTUALE"));
				bean.setInVendita(rs.getBoolean("IN_VENDITA"));
				bean.setCodiceModello(rs.getInt("MODELLO_PRODOTTO"));
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

	public synchronized Collection<TemplateColorVariantBean> doRetrieveAll(String order) throws SQLException 
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<TemplateColorVariantBean> products = new LinkedList<TemplateColorVariantBean>();

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
				TemplateColorVariantBean bean = new TemplateColorVariantBean();
				bean.setCodice(rs.getInt("CODICE"));
				bean.setColore(rs.getString("COLORE"));
				bean.setPrezzoAttuale(rs.getDouble("PREZZO_ATTUALE"));
				bean.setInVendita(rs.getBoolean("IN_VENDITA"));
				bean.setCodiceModello(rs.getInt("MODELLO_PRODOTTO"));
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
	
	
	public synchronized TemplateColorVariantBean doRetrieveProductVariant(ProductBean product) throws SQLException 
	{
		
		return doRetrieveByKey(product.getCodiceVarianteModello());
	}
	
	
	public synchronized List<TemplateColorVariantBean> doRetriveVariantsForTemplate(ProductTemplateBean template)
	throws SQLException 
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		List<TemplateColorVariantBean> products = new LinkedList<TemplateColorVariantBean>();

		String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE MODELLO_PRODOTTO = ? "
				+ " ORDER BY PREZZO_ATTUALE";


		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, template.getCodice());

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) 
			{
				TemplateColorVariantBean bean = new TemplateColorVariantBean();
				bean.setCodice(rs.getInt("CODICE"));
				bean.setColore(rs.getString("COLORE"));
				bean.setPrezzoAttuale(rs.getDouble("PREZZO_ATTUALE"));
				bean.setInVendita(rs.getBoolean("IN_VENDITA"));
				bean.setCodiceModello(rs.getInt("MODELLO_PRODOTTO"));
				bean.setModelloProdotto(template);
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
	
	private static final String TABLE_NAME = "varianti_modello_per_colore";


}
