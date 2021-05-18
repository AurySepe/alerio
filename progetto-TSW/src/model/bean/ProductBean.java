package model.bean;

public class ProductBean 
{

	public int getCodice() 
	{
		return codice;
	}

	public void setCodice(int codice) 
	{
		this.codice = codice;
	}

	public int getCodiceVarianteModello() 
	{
		return codiceVarianteModello;
	}

	public void setCodiceVarianteModello(int codiceVarianteModello) 
	{
		this.codiceVarianteModello = codiceVarianteModello;
	}

	public String getTaglia() 
	{
		return taglia;
	}

	public void setTaglia(String taglia) 
	{
		this.taglia = taglia;
	}

	public int getQuantita() 
	{
		return quantita;
	}

	public void setQuantita(int quantita) 
	{
		this.quantita = quantita;
	}

	public TemplateColorVariantBean getVarianteProdotto() 
	{
		return varianteProdotto;
	}

	public void setVarianteProdotto(TemplateColorVariantBean varianteProdotto) 
	{
		this.varianteProdotto = varianteProdotto;
	}

	private int codice;
	
	private int codiceVarianteModello;
	
	private String taglia;
	
	private int quantita;
	
	private TemplateColorVariantBean varianteProdotto;
}
