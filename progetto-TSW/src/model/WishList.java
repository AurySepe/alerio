package model;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;

import model.bean.TemplateColorVariantBean;

public class WishList 
{
	public WishList()
	{
		varianti = new HashMap<Integer,TemplateColorVariantBean>();
	}
	
	public boolean isInWishList(TemplateColorVariantBean variant)
	{
		return varianti.containsKey(variant.getCodice());
	}
	
	public void aggiungiProdotto(TemplateColorVariantBean variant)
	{
		varianti.put(variant.getCodice(), variant);
	}
	
	public void rimuoviProdotto(TemplateColorVariantBean variant)
	{
		varianti.remove(variant.getCodice());
	}
	
	public Collection<TemplateColorVariantBean> getVarianti()
	{
		return varianti.values();
	}
	
	private Map<Integer,TemplateColorVariantBean> varianti;
}
