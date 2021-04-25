package model;

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


public class ProductDAODS implements ProductDAO
{
	
	public synchronized void doSave(ProductBean product) throws SQLException 
	{

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " +TABLE_NAME
				+ " (NOME, PREZZO_ATTUALE, DATA_DI_AGGIUNTA, COLLEZIONE,COLORE,CATEGORIA,INFORMAZIONI,TAGLIA,IN_VENDITA) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try 
		{
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, product.getNome());
			preparedStatement.setDouble(2, product.getPrezzo());
			preparedStatement.setDate(3, product.getDataAggiunta());
			preparedStatement.setString(4, product.getCollezione());
			preparedStatement.setString(5, product.getColore());
			preparedStatement.setString(6, product.getCategoria());
			preparedStatement.setString(7, product.getInformazioni());
			preparedStatement.setDouble(8, product.getTaglia());
			preparedStatement.setBoolean(9, product.isInVendita());

			preparedStatement.executeUpdate();

			connection.commit();
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
	
	public synchronized ProductBean doRetrieveByKey(int code) throws SQLException 
	{
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
				bean.setNome(rs.getString("NOME"));
				bean.setInformazioni(rs.getString("INFORMAZIONI"));
				bean.setPrezzo(rs.getDouble("PREZZO_ATTUALE"));
				bean.setDataAggiunta(rs.getDate("DATA_DI_AGGIUNTA"));
				bean.setCategoria(rs.getString("CATEGORIA"));
				bean.setColore(rs.getString("COLORE"));
				bean.setCollezione(rs.getString("COLLEZIONE"));
				bean.setInVendita(rs.getBoolean("IN_VENDITA"));
				bean.setTaglia(rs.getString("TAGLIA").charAt(0));
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
			connection.commit();

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
	
	public synchronized Collection<ProductBean> doRetrieveAll(String order) throws SQLException 
	{
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
				bean.setNome(rs.getString("NOME"));
				bean.setInformazioni(rs.getString("INFORMAZIONI"));
				bean.setPrezzo(rs.getDouble("PREZZO_ATTUALE"));
				bean.setDataAggiunta(rs.getDate("DATA_DI_AGGIUNTA"));
				bean.setCategoria(rs.getString("CATEGORIA"));
				bean.setColore(rs.getString("COLORE"));
				bean.setCollezione(rs.getString("COLLEZIONE"));
				bean.setInVendita(rs.getBoolean("IN_VENDITA"));
				bean.setTaglia(rs.getString("TAGLIA").charAt(0));
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