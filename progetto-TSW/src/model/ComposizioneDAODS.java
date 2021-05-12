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

public class ComposizioneDAODS {
	
private static DataSource ds;
	
	public synchronized void doSave(ComposizioneBean composizione) throws SQLException
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String insertSQL = "INSERT INTO " +TABLE_NAME
				+ " (codice_prodotto, codice_ordine, quantita, prezzo) "
				+ "VALUES (?, ?, ?, ?)";
		
		try 
		{
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setInt(1, composizione.getCodiceProdotto());
			preparedStatement.setInt(2, composizione.getCodiceOrdine());
			preparedStatement.setInt(3, composizione.getQuantita());
			preparedStatement.setDouble(3, composizione.getPrezzo());
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

	
	public synchronized boolean doDelete(int codiceOrdine) throws SQLException
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		int result = 0;

		String deleteSQL = "DELETE FROM " + TABLE_NAME + " WHERE CODICE = ?";

		try 
		{
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setInt(1, codiceOrdine);

			result = preparedStatement.executeUpdate();

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
		return (result != 0);
	}

	
	public synchronized ComposizioneBean doRetrieveByKey(int codiceOrdine) throws SQLException
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		ComposizioneBean composizione = new ComposizioneBean();

		String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE CODICE = ?";

		try 
		{
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, codiceOrdine);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) 
			{
				composizione.setCodiceProdotto(rs.getInt("codice_prodotto"));
				composizione.setCodiceOrdine(rs.getInt("codice_ordine"));
				composizione.setQuantita(rs.getInt("quantita"));
				composizione.setPrezzo(rs.getDouble("prezzo"));
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
		return composizione;
	}

	public synchronized Collection<ComposizioneBean> doRetrieveAll() throws SQLException
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		Collection<ComposizioneBean> composizioni = new LinkedList<ComposizioneBean>();

		String selectSQL = "SELECT * FROM " + TABLE_NAME + " ORDER BY CODICE_ORDINE";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) 
			{
				ComposizioneBean composizione = new ComposizioneBean();
				composizione.setCodiceOrdine(rs.getInt("codice_ordine"));
				composizione.setCodiceProdotto(rs.getInt("codice_prodotto"));
				composizione.setQuantita(rs.getInt("quantita"));
				composizione.setPrezzo(rs.getDouble("prezzo"));
				composizioni.add(composizione);
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
		return composizioni;
	}

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
	
	private static final String TABLE_NAME = "composizione";


}
