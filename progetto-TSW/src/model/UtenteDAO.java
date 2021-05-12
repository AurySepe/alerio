package model;

import java.sql.SQLException;
import java.util.Collection;

public interface UtenteDAO {

	public void doSave(UtenteBean utente) throws SQLException;
	
	public boolean doDelete(String email) throws SQLException;
	
	public UtenteBean doRetrieveByKey(String email) throws SQLException;
	
	public Collection<UtenteBean> doRetrieveAll() throws SQLException;
}
