package model;

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

public class ProductDAODS implements ProductDAO {

	public synchronized void doSave(ProductBean product) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " +TABLE_NAME
				+ " (varianti_modello_per_colore, TAGLIA) "
				+ "VALUES (?, ?)";

		try 
		{
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setInt(1, product.getCodiceVarianteModello());
			preparedStatement.setString(2, product.getTaglia());
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

	public synchronized boolean doDelete(int code) throws SQLException {
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

	public synchronized ProductBean doRetrieveByKey(int code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ProductBean bean = new ProductBean();

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
				bean.setCodiceVarianteModello(rs.getInt("varianti_modello_per_colore"));
				bean.setTaglia(rs.getString("TAGLIA"));
				bean.setQuantita(rs.getInt("QUANTITA"));
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

	public synchronized Collection<ProductBean> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<ProductBean> products = new LinkedList<ProductBean>();

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
				ProductBean bean = new ProductBean();
				bean.setCodice(rs.getInt("CODICE"));
				bean.setCodiceVarianteModello(rs.getInt("varianti_modello_per_colore"));
				bean.setTaglia(rs.getString("TAGLIA"));
				bean.setQuantita(rs.getInt("QUANTITA"));
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
	
	public List<ProductBean> doRetriveForVariant(TemplateColorVariantBean productVariant) throws SQLException 
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		List<ProductBean> products = new LinkedList<ProductBean>();

		String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE varianti_modello_per_colore = ? "
				+ " ORDER BY TAGLIA DESC";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, productVariant.getCodice());

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) 
			{
				ProductBean bean = new ProductBean();
				bean.setCodice(rs.getInt("CODICE"));
				bean.setCodiceVarianteModello(rs.getInt("varianti_modello_per_colore"));
				bean.setTaglia(rs.getString("TAGLIA"));
				bean.setQuantita(rs.getInt("QUANTITA"));
				bean.setVarianteProdotto(productVariant);
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
	
	private static final String TABLE_NAME = "prodotto";


}
