package model.dao;

import java.sql.SQLException;
import java.util.Collection;
import java.util.List;

import model.bean.ProductBean;
import model.bean.ProductTemplateBean;
import model.bean.TemplateColorVariantBean;
import model.bean.UtenteBean;

public interface TemplateColorVariantDAO 
{
	public void doSave(TemplateColorVariantBean productDetails) throws SQLException;
	
	public boolean doUpdate(TemplateColorVariantBean templateVariant) throws SQLException;

	public boolean doDelete(int code) throws SQLException;

	public TemplateColorVariantBean doRetrieveByKey(int code) throws SQLException;
	
	public Collection<TemplateColorVariantBean> doRetrieveAll(String order) throws SQLException;
	
	public TemplateColorVariantBean doRetrieveProductVariant(ProductBean product) throws SQLException;
	
	public List<TemplateColorVariantBean> doRetriveVariantsForTemplate(ProductTemplateBean template)
	throws SQLException;
	
	public List<TemplateColorVariantBean> doRetriveVariantsInVenditaForTemplate(ProductTemplateBean template,String genere)
	throws SQLException;
	
	public int nextCode() throws SQLException;
	
	public Collection<TemplateColorVariantBean> doRetrieveByUserWishlist(UtenteBean utente) throws SQLException;
	
	public boolean doSaveInWishList(TemplateColorVariantBean variant, UtenteBean utente) throws SQLException;
	
	public boolean doDeleteFromWishList(TemplateColorVariantBean variant, UtenteBean utente) throws SQLException;
	
	public boolean IsInWishList(TemplateColorVariantBean variant, UtenteBean utente) throws SQLException;

}
