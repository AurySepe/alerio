package model;

import java.util.ArrayList;
import java.util.List;

import model.bean.ProductBean;

public class Carrello 
{
	public Carrello()
	{
		elementi = new ArrayList<ItemCarrello>();
	}
	
	public void aggiungiProdotto(ProductBean bean) 
	{
		for(ItemCarrello i : elementi)
		{
			int codice = i.getProdotto().getCodice();
			if(bean.getCodice() == codice)
			{
				i.setQuantitaProdotto(i.getQuantitaProdotto() + 1);
				return;
			}
		}
		elementi.add(new ItemCarrello(bean, 1));	
	}
	
	public void rimuoviProdotto(ProductBean bean)
	{
		for(ItemCarrello i : elementi)
		{
			int codice = i.getProdotto().getCodice();
			if(bean.getCodice() == codice)
			{
				elementi.remove(i);
				return;
			}
		}
	}
	
	public void settaQuantitaProdotto(ProductBean bean, int quantita)
	{
		for(ItemCarrello i : elementi)
		{
			int codice = i.getProdotto().getCodice();
			if(bean.getCodice() == codice)
			{
				if(quantita <= 0)
				{
					elementi.remove(i);
				}
				else
				{					
					i.setQuantitaProdotto(quantita);
				}
				return;
			}
		}
	}
	
	public int getQuantitaProdotto(ProductBean bean)
	{
		for(ItemCarrello i : elementi)
		{
			int codice = i.getProdotto().getCodice();
			if(bean.getCodice() == codice)
			{
				return i.getQuantitaProdotto();
			}
		}
		return 0;
	}
	
	public List<ItemCarrello> getElementi() 
	{
		return elementi;
	}
	
	public boolean isEmpty()
	{
		return elementi.isEmpty();
	}
	
	public double getCostoTotale()
	{
		double result = 0;
		for(ItemCarrello i : elementi)
		{
			result += i.getQuantitaProdotto()*i.getProdotto().getVarianteProdotto().getPrezzoAttuale();
		}
		return result;
	}
	
	public ItemCarrello getItem(ProductBean bean)
	{
		for(ItemCarrello i : elementi)
		{
			int codice = i.getProdotto().getCodice();
			if(bean.getCodice() == codice)
			{
				return i;
			}
		}
		return null;
	}



	private List<ItemCarrello> elementi;

}


