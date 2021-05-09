package model;

import java.sql.SQLException;
import java.util.Collection;


public interface ProductTemplateDAO 
{
	public void doSave(ProductTemplateBean productInformation) throws SQLException;

	public boolean doDelete(int code) throws SQLException;

	public ProductTemplateBean doRetrieveByKey(int code) throws SQLException;
	
	public Collection<ProductTemplateBean> doRetrieveAll(String order) throws SQLException;
	
	public ProductTemplateBean doRetrieveVariantTemplate(TemplateColorVariantBean templateVariant) throws SQLException;

}
