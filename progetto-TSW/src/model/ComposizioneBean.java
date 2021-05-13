package model;

public class ComposizioneBean {

	public int getCodiceProdotto() 
	{
		return codiceProdotto;
	}

	public void setCodiceProdotto(int codiceProdotto) 
	{
		this.codiceProdotto = codiceProdotto;
	}

	public int getCodiceOrdine()
	{
		return codiceOrdine;
	}

	public void setCodiceOrdine(int codiceOrdine) 
	{
		this.codiceOrdine = codiceOrdine;
	}

	public int getQuantita() 
	{
		return quantita;
	}

	public void setQuantita(int quantita) 
	{
		this.quantita = quantita;
	}

	public double getPrezzo() 
	{
		return prezzo;
	}

	public void setPrezzo(double prezzo) 
	{
		this.prezzo = prezzo;
	}
	
	public ProductBean getProdotto() 
	{
		return prodotto;
	}

	public void setProdotto(ProductBean prodotto) 
	{
		this.prodotto = prodotto;
	}

	public OrdineBean getOrdine() 
	{
		return ordine;
	}

	public void setOrdine(OrdineBean ordine) 
	{
		this.ordine = ordine;
	}



	private int codiceProdotto;
	
	private int codiceOrdine;
	
	private int quantita;
	
	private double prezzo;
	
	private ProductBean prodotto;
	
	private OrdineBean ordine;
}
