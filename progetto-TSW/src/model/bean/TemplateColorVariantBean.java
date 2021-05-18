package model.bean;

import java.util.List;

public class TemplateColorVariantBean 
{
	
	public int getCodice() 
	{
		return codice;
	}

	public void setCodice(int codice) 
	{
		this.codice = codice;
	}

	public int getCodiceModello() 
	{
		return codiceModello;
	}

	public void setCodiceModello(int codiceModello) 
	{
		this.codiceModello = codiceModello;
	}

	public String getColore() 
	{
		return colore;
	}

	public void setColore(String colore) 
	{
		this.colore = colore;
	}

	public boolean isInVendita() 
	{
		return inVendita;
	}

	public void setInVendita(boolean inVendita) 
	{
		this.inVendita = inVendita;
	}

	public double getPrezzoAttuale() 
	{
		return prezzoAttuale;
	}

	public void setPrezzoAttuale(double prezzoAttuale) 
	{
		this.prezzoAttuale = prezzoAttuale;
	}

	public ProductTemplateBean getModelloProdotto() 
	{
		return modelloProdotto;
	}

	public void setModelloProdotto(ProductTemplateBean modelloProdotto) 
	{
		this.modelloProdotto = modelloProdotto;
	}

	public List<ImageBean> getImmaginiVariante() 
	{
		return immaginiVariante;
	}

	public void setImmaginiVariante(List<ImageBean> immaginiVariante) 
	{
		this.immaginiVariante = immaginiVariante;
	}

	public List<ProductBean> getProdotti() 
	{
		return prodotti;
	}

	public void setProdotti(List<ProductBean> prodotti) 
	{
		this.prodotti = prodotti;
	}

	private int codice;
	
	private int codiceModello;
	
	private String colore;
	
	private boolean inVendita;
	
	private double prezzoAttuale;
	
	private ProductTemplateBean modelloProdotto;
	
	private List<ImageBean> immaginiVariante;
	
	private List<ProductBean> prodotti;
}
