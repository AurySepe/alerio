package model;

import java.sql.SQLException;
import java.util.Collection;

public interface OrdineDAO {

	public void doSave(OrdineBean ordine) throws SQLException;
	
	public boolean doDelete(int codiceOrdine) throws SQLException;
	
	public OrdineBean doRetrieveByKey(int codiceOrdine) throws SQLException;
	
	public Collection<OrdineBean> doRetrieveAll() throws SQLException;
	
}
