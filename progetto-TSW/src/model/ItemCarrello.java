package model;

public class ItemCarrello 
{
	public ItemCarrello(ProductBean bean,int quantita)
	{
		this.bean = bean;
		quantitaProdotto = quantita;
	}
	
	
	
	public ProductBean getBean() {
		return bean;
	}

	public void setBean(ProductBean bean) {
		this.bean = bean;
	}

	public int getQuantitaProdotto() {
		return quantitaProdotto;
	}

	public void setQuantitaProdotto(int quantitaProdotto) {
		this.quantitaProdotto = quantitaProdotto;
	}
	


	private ProductBean bean;
	
	private int quantitaProdotto;
}
