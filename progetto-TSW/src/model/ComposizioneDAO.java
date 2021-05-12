package model;

import java.sql.SQLException;
import java.util.Collection;

public interface ComposizioneDAO {
	
	public void doSave(ComposizioneBean composizione) throws SQLException;

	public boolean doDelete(int codiceOrdine) throws SQLException;

	public ComposizioneBean doRetrieveByKey(int CodiceOrdine) throws SQLException;
	
	public Collection<ComposizioneBean> doRetrieveAll() throws SQLException;

}
