package model.dao;

import java.sql.SQLException;
import java.util.Collection;
import java.util.List;

import model.bean.ImageBean;
import model.bean.TemplateColorVariantBean;

public interface ImageDAO 
{
	public void doSave(ImageBean image) throws SQLException;

	public boolean doDelete(int code) throws SQLException;

	public ImageBean doRetrieveByKey(int code) throws SQLException;
	
	public Collection<ImageBean> doRetrieveAll(String order) throws SQLException;
	
	public List<ImageBean> doRetrieveAllFromTemplateVariant(TemplateColorVariantBean templateVariant) throws SQLException;
}
