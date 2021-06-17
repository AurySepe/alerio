package model.ds;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import model.bean.CreditCardBean;
import model.bean.OrdineBean;
import model.bean.UtenteBean;
import model.dao.CreditCardDAO;

public class CreditCardDAODS implements CreditCardDAO 
{

	@Override
	public synchronized void doSave(CreditCardBean creditCard) throws SQLException 
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String insertSQL = "INSERT INTO " + TABLE_NAME + " (numero_carta,cliente, data_scadenza, nominativo,codice) " 
							+ " VALUES(?, ? , ?, ?, ?) ";  
				
				
		try
		{
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, creditCard.getNumeroCarta());
			preparedStatement.setString(2, creditCard.getEmailCliente());
			preparedStatement.setDate(3, creditCard.getDataScadenza());
			preparedStatement.setString(4, creditCard.getNominativo());
			preparedStatement.setInt(5, creditCard.getCodice());
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

	@Override
	public synchronized boolean doDelete(int code) throws SQLException 
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "DELETE FROM " + TABLE_NAME + " where codice = ?";
		
		try 
		{
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setInt(1, code);
			
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

	@Override
	public synchronized CreditCardBean doRetrieveByKey(int code) throws SQLException 
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		CreditCardBean carta = new CreditCardBean();
		
		String selectSQL = "SELECT * FROM " + TABLE_NAME + " where codice = ?";
		
		try
		{
			connection=ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);
			
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next())
			{
				carta.setNumeroCarta(rs.getString("numero_carta"));
				carta.setDataScadenza(rs.getDate("data_scadenza"));
				carta.setEmailCliente("cliente");
				carta.setNominativo(rs.getString("nominativo"));
				carta.setCodice(rs.getInt("codice"));
				
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
		return carta;
	}

	@Override
	public synchronized Collection<CreditCardBean> doRetrieveAll() throws SQLException 
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		Collection<CreditCardBean> carte = new ArrayList<CreditCardBean>();
		
		String selectSQL = "SELECT * FROM " + TABLE_NAME ;
		try
		{
			connection=ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next())
			{
				CreditCardBean carta = new CreditCardBean();
				carta.setNumeroCarta(rs.getString("numero_carta"));
				carta.setDataScadenza(rs.getDate("data_scadenza"));
				carta.setEmailCliente("cliente");
				carta.setNominativo(rs.getString("nominativo"));
				carta.setCodice(rs.getInt("codice"));
				carte.add(carta);
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
		return carte;
		
	}
	
	public synchronized CreditCardBean doRetrieveByOrder(OrdineBean ordine) throws SQLException
	{
		return doRetrieveByKey(ordine.getCodiceCarta());
	}
	
	public synchronized Collection<CreditCardBean> doRetrieveAllByUtente(UtenteBean utente) throws SQLException
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		Collection<CreditCardBean> carte = new ArrayList<CreditCardBean>();
		
		String selectSQL = "SELECT * FROM " + TABLE_NAME + " where cliente = ? ";
		try
		{
			connection=ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, utente.getEmail());
			
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next())
			{
				CreditCardBean carta = new CreditCardBean();
				carta.setNumeroCarta(rs.getString("numero_carta"));
				carta.setDataScadenza(rs.getDate("data_scadenza"));
				carta.setEmailCliente("cliente");
				carta.setNominativo(rs.getString("nominativo"));
				carta.setCodice(rs.getInt("codice"));
				carta.setCliente(utente);
				carte.add(carta);
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
		return carte;
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
				if(result == 0)
					result = 1;
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
	
	private static final String TABLE_NAME = "carta_di_credito";

}
