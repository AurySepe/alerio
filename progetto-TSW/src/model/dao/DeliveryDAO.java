package model.dao;

import java.sql.SQLException;
import java.util.Collection;

import model.bean.DeliveryBean;
import model.bean.OrdineBean;
import model.bean.UtenteBean;

public interface DeliveryDAO 
{
	public void doSave(DeliveryBean delivery) throws SQLException;

	public boolean doDelete(int code) throws SQLException;

	public DeliveryBean doRetrieveByKey(int code) throws SQLException;
	
	public Collection<DeliveryBean> doRetrieveAll() throws SQLException;
	
	public DeliveryBean doRetriveByOrdine(OrdineBean ordine) throws SQLException;
	
	public Collection<DeliveryBean> doRetrieveAllByUtente(UtenteBean utente) throws SQLException;
	
	public int nextCode() throws SQLException;
}
