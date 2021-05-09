package model;

public class ItemCarrello 
{
	public ItemCarrello(ProductBean prodotto,int quantita)
	{
		this.prodotto = prodotto;
		quantitaProdotto = quantita;
	}
	
	
	
	public ProductBean getProdotto() {
		return prodotto;
	}

	public void setProdotto(ProductBean prodotto) {
		this.prodotto = prodotto;
	}

	public int getQuantitaProdotto() {
		return quantitaProdotto;
	}

	public void setQuantitaProdotto(int quantitaProdotto) {
		this.quantitaProdotto = quantitaProdotto;
	}
	


	private ProductBean prodotto;
	
	private int quantitaProdotto;
}
