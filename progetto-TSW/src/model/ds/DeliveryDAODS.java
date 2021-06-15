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

import model.bean.DeliveryBean;
import model.bean.OrdineBean;
import model.bean.UtenteBean;
import model.dao.DeliveryDAO;

public class DeliveryDAODS implements DeliveryDAO {

	@Override
	public synchronized void doSave(DeliveryBean delivery) throws SQLException 
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String insertSQL = "INSERT INTO " + TABLE_NAME + " (telefono,nominativo,citta,cap,numero_civico,via,cliente) " 
							+ " VALUES( ? , ? , ? , ? , ? , ? , ?) ";  
				
				
		try
		{
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, delivery.getTelefono());
			preparedStatement.setString(2, delivery.getNominativo());
			preparedStatement.setString(3, delivery.getCitta());
			preparedStatement.setString(4, delivery.getCap());
			preparedStatement.setInt(5, delivery.getNumeroCivico());
			preparedStatement.setString(6, delivery.getVia());
			preparedStatement.setString(7, delivery.getEmailCliente());
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
	public synchronized DeliveryBean doRetrieveByKey(int code) throws SQLException 
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		DeliveryBean delivery = new DeliveryBean();
		
		String selectSQL = "SELECT * FROM " + TABLE_NAME + " where codice = ?";
		
		try
		{
			connection=ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);
			
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next())
			{
				delivery.setCodice(rs.getInt("codice"));
				delivery.setTelefono(rs.getString("telefono"));
				delivery.setNominativo(rs.getString("nominativo"));
				delivery.setCitta(rs.getString("citta"));
				delivery.setCap(rs.getString("cap"));
				delivery.setNumeroCivico(rs.getInt("numero_civico"));
				delivery.setEmailCliente("cliente");
				delivery.setVia(rs.getString("via"));
			
				
				
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
		return delivery;
	}

	@Override
	public synchronized Collection<DeliveryBean> doRetrieveAll() throws SQLException 
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		Collection<DeliveryBean> deliverys = new ArrayList<DeliveryBean>();
		
		String selectSQL = "SELECT * FROM " + TABLE_NAME ;
		try
		{
			connection=ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next())
			{
				DeliveryBean delivery = new DeliveryBean();
				delivery.setCodice(rs.getInt("codice"));
				delivery.setTelefono(rs.getString("telefono"));
				delivery.setNominativo(rs.getString("nominativo"));
				delivery.setCitta(rs.getString("citta"));
				delivery.setCap(rs.getString("cap"));
				delivery.setNumeroCivico(rs.getInt("numero_civico"));
				delivery.setEmailCliente("cliente");
				delivery.setVia(rs.getString("via"));
				deliverys.add(delivery);
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
		return deliverys;
	}
	
	public synchronized DeliveryBean doRetriveByOrdine(OrdineBean ordine) throws SQLException
	{
		return doRetrieveByKey(ordine.getCodiceConsegna());
	}
	
	public synchronized Collection<DeliveryBean> doRetrieveAllByUtente(UtenteBean utente) throws SQLException
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		Collection<DeliveryBean> deliverys = new ArrayList<DeliveryBean>();
		
		String selectSQL = "SELECT * FROM " + TABLE_NAME + " where cliente = ?  ";
		try
		{
			connection=ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, utente.getEmail());
			
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next())
			{
				DeliveryBean delivery = new DeliveryBean();
				delivery.setCodice(rs.getInt("codice"));
				delivery.setTelefono(rs.getString("telefono"));
				delivery.setNominativo(rs.getString("nominativo"));
				delivery.setCitta(rs.getString("citta"));
				delivery.setCap(rs.getString("cap"));
				delivery.setNumeroCivico(rs.getInt("numero_civico"));
				delivery.setEmailCliente("cliente");
				delivery.setVia(rs.getString("via"));
				delivery.setCliente(utente);
				deliverys.add(delivery);
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
		return deliverys;
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
	
	private static final String TABLE_NAME = "informazioni_di_consegna";

}
