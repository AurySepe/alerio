package model;

import java.sql.SQLException;
import java.util.Collection;
import java.util.List;

public interface ImageDAO 
{
	public void doSave(ImageBean image) throws SQLException;

	public boolean doDelete(int code) throws SQLException;

	public ImageBean doRetrieveByKey(int code) throws SQLException;
	
	public Collection<ImageBean> doRetrieveAll(String order) throws SQLException;
	
	public List<ImageBean> doRetrieveAllFromProduct(int prodotto) throws SQLException;
}
