package model.dao;

import java.sql.SQLException;
import java.util.Collection;

import model.bean.OrdineBean;
import model.bean.UtenteBean;

public interface UtenteDAO {

	public void doSave(UtenteBean utente) throws SQLException;
	
	public boolean doDelete(String email) throws SQLException;
	
	public UtenteBean doRetrieveByKey(String email) throws SQLException;
	
	public Collection<UtenteBean> doRetrieveAll() throws SQLException;
	
	public UtenteBean verificaUtente(UtenteBean utente) throws SQLException;
	
	public UtenteBean doRetriveForOrder(OrdineBean ordine) throws SQLException;
}
