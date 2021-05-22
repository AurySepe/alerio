package model.dao;

import java.sql.Date;
import java.sql.SQLException;
import java.util.Collection;
import java.util.List;

import model.bean.OrdineBean;
import model.bean.UtenteBean;

public interface OrdineDAO {

	public void doSave(OrdineBean ordine) throws SQLException;
	
	public boolean doDelete(int codiceOrdine) throws SQLException;
	
	public OrdineBean doRetrieveByKey(int codiceOrdine) throws SQLException;
	
	public Collection<OrdineBean> doRetrieveAll() throws SQLException;
	
	public List<OrdineBean> doRetriveAllForUtente(UtenteBean utente) throws SQLException;
	
	public int nextCode() throws SQLException;
	
	public Collection<OrdineBean> doRetrieveAllByDatesAndUser(Date inizio,Date fine,UtenteBean utente) throws SQLException;
	
}
