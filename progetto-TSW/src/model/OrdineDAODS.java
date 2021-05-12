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

public class OrdineDAODS {

	public synchronized void doSave(OrdineBean ordine) throws SQLException
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String insertSQL = "INSERT INTO" + TABLE_NAME 
							+ " (codice, email_cliente, data_di_acquisto, iva, "
							+ "costo_totale, tipo_utente, numero_carta, codice_consegna) "
							+ " VALUES (?, ?, ?, ?; ?; ?; ?, ?) ";
		
		try
		{
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setInt(1, ordine.getCodiceOrdine());
			preparedStatement.setString(2, ordine.getEmail());
			preparedStatement.setDate(3, ordine.getData()); 
			preparedStatement.setDouble(4, ordine.getIva());
			preparedStatement.setDouble(5, ordine.getCosto());
			preparedStatement.setString(6, ordine.getTipoUtentee());
			preparedStatement.setString(7, ordine.getNumeroCarta());
			preparedStatement.setInt(8, ordine.getCodiceConsegna());
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
	
	
	
	
	
	public synchronized OrdineBean doRetrieveByKey(int codiceOrdine) throws SQLException
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		OrdineBean ordine = new OrdineBean();

		String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE CODICE = ?";
		
		try 
		{
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, codiceOrdine);

			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next())
			{
				ordine.setCodiceOrdine(rs.getInt("codiceOrdine"));
				ordine.setEmail(rs.getString("email"));
				ordine.setDate(rs.getDate("data_di_acquisto"));
				ordine.setIva(rs.getDouble("iva"));
				ordine.setCosto(rs.getDouble("costo_totale"));
				ordine.setTipoUtente(rs.getString("tipo_utente"));
				ordine.setNumeroCarta(rs.getString("numero_carta"));
				ordine.setCodiceConsegna(rs.getInt("codice_consegna"));
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
		return ordine;
		
	}
	
	
	
	
	public synchronized Collection<OrdineBean> doRetrieveAll() throws SQLException
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		Collection<OrdineBean> ordini = new LinkedList<OrdineBean>();

		String selectSQL = "SELECT * FROM " + TABLE_NAME + " ORDER BY CODICE ";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) 
			{
				OrdineBean ordine = new OrdineBean();
				ordine.setCodiceOrdine(rs.getInt("codice"));
				ordine.setEmail(rs.getString("email_cliente"));
				ordine.setDate(rs.getDate("data_di_acquisto"));
				ordine.setIva(rs.getDouble("iva"));
				ordine.setCosto(rs.getDouble("costo_totale"));
				ordine.setTipoUtente(rs.getString("tipo_utente"));
				ordine.setNumeroCarta(rs.getString("numero_carta"));
				ordine.setCodiceConsegna(rs.getInt("codice_consegna"));
				ordini.add(ordine);
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
		return ordini;
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
	
	private static final String TABLE_NAME = "ordine";

}
