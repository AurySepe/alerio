package model.dao;

import java.sql.SQLException;
import java.util.Collection;

import model.bean.ProductTemplateBean;
import model.bean.TemplateColorVariantBean;


public interface ProductTemplateDAO 
{
	public void doSave(ProductTemplateBean productTemplate) throws SQLException;
	
	public boolean doUpdate(ProductTemplateBean productTemplate) throws SQLException;

	public boolean doDelete(int code) throws SQLException;

	public ProductTemplateBean doRetrieveByKey(int code) throws SQLException;
	
	public Collection<ProductTemplateBean> doRetrieveAll(String order) throws SQLException;
	
	public ProductTemplateBean doRetrieveVariantTemplate(TemplateColorVariantBean templateVariant) throws SQLException;
	
	public int nextCode() throws SQLException;
	
	public Collection<ProductTemplateBean> doRetrieveByCategory(String categoria) throws SQLException;
	
	

}
