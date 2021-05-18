package model.dao;

import java.sql.SQLException;
import java.util.Collection;
import java.util.List;

import model.bean.ProductBean;
import model.bean.ProductTemplateBean;
import model.bean.TemplateColorVariantBean;

public interface TemplateColorVariantDAO 
{
	public void doSave(TemplateColorVariantBean productDetails) throws SQLException;

	public boolean doDelete(int code) throws SQLException;

	public TemplateColorVariantBean doRetrieveByKey(int code) throws SQLException;
	
	public Collection<TemplateColorVariantBean> doRetrieveAll(String order) throws SQLException;
	
	public TemplateColorVariantBean doRetrieveProductVariant(ProductBean product) throws SQLException;
	
	public List<TemplateColorVariantBean> doRetriveVariantsForTemplate(ProductTemplateBean template)
	throws SQLException;

}
