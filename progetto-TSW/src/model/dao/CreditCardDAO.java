package model.dao;

import java.sql.SQLException;
import java.util.Collection;
import model.bean.CreditCardBean;
import model.bean.OrdineBean;
import model.bean.UtenteBean;


public interface CreditCardDAO 
{
	public void doSave(CreditCardBean creditCard) throws SQLException;

	public boolean doDelete(int code) throws SQLException;

	public CreditCardBean doRetrieveByKey(int code) throws SQLException;
	
	public Collection<CreditCardBean> doRetrieveAll() throws SQLException;
	
	public CreditCardBean doRetrieveByOrder(OrdineBean ordine) throws SQLException;
	
	public Collection<CreditCardBean> doRetrieveAllByUtente(UtenteBean utente) throws SQLException;
	
	public int nextCode() throws SQLException;
	
}
