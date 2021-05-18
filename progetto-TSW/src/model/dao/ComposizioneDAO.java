package model.dao;

import java.sql.SQLException;
import java.util.Collection;
import java.util.List;

import model.bean.ComposizioneBean;
import model.bean.OrdineBean;

public interface ComposizioneDAO {
	
	public void doSave(ComposizioneBean composizione) throws SQLException;

	public boolean doDelete(int codiceOrdine,int codiceProdotto) throws SQLException;

	public ComposizioneBean doRetrieveByKey(int CodiceOrdine,int codiceProdotto) throws SQLException;
	
	public Collection<ComposizioneBean> doRetrieveAll() throws SQLException;
	
	public List<ComposizioneBean> doRetriveAllForOrder(OrdineBean ordine) throws SQLException;

}
