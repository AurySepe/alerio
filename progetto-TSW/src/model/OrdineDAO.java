package model;

import java.sql.SQLException;
import java.util.Collection;
import java.util.List;

public interface OrdineDAO {

	public void doSave(OrdineBean ordine) throws SQLException;
	
	public boolean doDelete(int codiceOrdine) throws SQLException;
	
	public OrdineBean doRetrieveByKey(int codiceOrdine) throws SQLException;
	
	public Collection<OrdineBean> doRetrieveAll() throws SQLException;
	
	public List<OrdineBean> doRetriveAllForUtente(UtenteBean utente) throws SQLException;
	
}
