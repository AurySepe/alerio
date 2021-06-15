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

import model.bean.CreditCardBean;
import model.bean.DeliveryBean;
import model.bean.OrdineBean;
import model.bean.UtenteBean;
import model.dao.UtenteDAO;

public class UtenteDAODS implements UtenteDAO 
{
	
	public synchronized void doSave(UtenteBean utente) throws SQLException
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String insertSQL = "INSERT INTO " + TABLE_NAME + " (email, nome, cognome, pwd, genere, registrato) " 
							+ " VALUES(?, ?, ?, ?, ?, ?) ";  
				
				
		try
		{
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, utente.getEmail());
			preparedStatement.setString(2, utente.getNome());
			preparedStatement.setString(3, utente.getCognome());
			preparedStatement.setString(4, utente.getPwd());
			preparedStatement.setString(5, utente.getGenere());
			preparedStatement.setBoolean(6, utente.isRegistrato());
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

	
	
	public synchronized boolean doDelete(String email) throws SQLException 
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "DELETE FROM " + TABLE_NAME + " where EMAIL = ?";
		
		try 
		{
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setString(1, email);
			
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
	
	
	public synchronized UtenteBean doRetrieveByKey(String email) throws SQLException
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		UtenteBean utente=new UtenteBean();
		
		String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE EMAIL=?";
		
		try
		{
			connection=ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, email);
			
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next())
			{
				utente.setCognome(rs.getString("cognome"));
				utente.setNome(rs.getString("nome"));
				utente.setEmail(rs.getString("email"));
				utente.setPwd(rs.getString("pwd"));
				utente.setGenere(rs.getString("genere"));
				utente.setRegistrato(rs.getBoolean("registrato"));
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
		return utente;
	}
	
	public synchronized UtenteBean verificaUtente(UtenteBean utenteDaVerificare) throws SQLException
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		UtenteBean utente=new UtenteBean();
		
		String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE EMAIL = ? AND PWD = ?";
		
		try
		{
			connection=ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, utenteDaVerificare.getEmail());
			preparedStatement.setString(2, utenteDaVerificare.getPwd());
			
			ResultSet rs = preparedStatement.executeQuery();
			if(rs.next())
			{
				utente.setCognome(rs.getString("cognome"));
				utente.setNome(rs.getString("nome"));
				utente.setEmail(rs.getString("email"));
				utente.setPwd(rs.getString("pwd"));
				utente.setGenere(rs.getString("genere"));
				utente.setRegistrato(rs.getBoolean("registrato"));
			}
			else
			{
				utente = null;
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
		return utente;
	}
	
	
	public synchronized Collection<UtenteBean> doRetrieveAll() throws SQLException
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		Collection<UtenteBean> utenti = new LinkedList<UtenteBean>();
		
		String selectSQL = "SELECT * FROM " + TABLE_NAME + " ORDER BY EMAIL";
		
		try 
		{
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) 
			{
				UtenteBean utente = new UtenteBean();
				utente.setEmail(rs.getString("cognome"));
				utente.setNome(rs.getString("nome"));
				utente.setEmail(rs.getString("email"));
				utente.setPwd(rs.getString("pwd"));
				utente.setGenere(rs.getString("genere"));
				utente.setRegistrato(rs.getBoolean("registrato"));
				utenti.add(utente);
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
		return utenti;
	}
	
	public synchronized UtenteBean doRetriveForOrder(OrdineBean ordine) throws SQLException
	{
		return doRetrieveByKey(ordine.getEmail());
	}
	
	public synchronized UtenteBean doRetriveForCard(CreditCardBean card) throws SQLException
	{
		return doRetrieveByKey(card.getEmailCliente());
	}
	
	public synchronized UtenteBean doRetriveForDelivery(DeliveryBean delivery) throws SQLException
	{
		return doRetrieveByKey(delivery.getEmailCliente());
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
	
	private static final String TABLE_NAME = "cliente";

}
