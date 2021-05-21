package model.dao;

import java.sql.SQLException;
import java.util.Collection;
import java.util.List;

import model.bean.ComposizioneBean;
import model.bean.ProductBean;
import model.bean.TemplateColorVariantBean;

public interface ProductDAO 
{
	public void doSave(ProductBean product) throws SQLException;

	public boolean doDelete(int code) throws SQLException;
	
	public boolean doUpdate(ProductBean product) throws SQLException;

	public ProductBean doRetrieveByKey(int code) throws SQLException;
	
	public Collection<ProductBean> doRetrieveAll(String order) throws SQLException;
	
	public List<ProductBean> doRetriveForVariant(TemplateColorVariantBean templateVariant) throws SQLException;
	
	public ProductBean doRetriveForComposizione(ComposizioneBean composizione) throws SQLException;

}