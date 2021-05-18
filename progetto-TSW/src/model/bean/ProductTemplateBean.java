package model.bean;

import java.sql.Date;
import java.util.List;

public class ProductTemplateBean 
{
	
	public ProductTemplateBean()
	{
		codice = -1;
	}

	public int getCodice() 
	{
		return codice;
	}

	public void setCodice(int codice) 
	{
		this.codice = codice;
	}

	public String getNome() 
	{
		return nome;
	}

	public void setNome(String nome) 
	{
		this.nome = nome;
	}

	public String getInformazioni() 
	{
		return informazioni;
	}

	public void setInformazioni(String informazioni) 
	{
		this.informazioni = informazioni;
	}

	public String getCollezione() 
	{
		return collezione;
	}

	public void setCollezione(String collezione) 
	{
		this.collezione = collezione;
	}


	public String getCategoria() 
	{
		return categoria;
	}

	public void setCategoria(String categoria) 
	{
		this.categoria = categoria;
	}

	public Date getDataAggiunta() 
	{
		return dataAggiunta;
	}

	public void setDataAggiunta(Date dataAggiunta) 
	{
		this.dataAggiunta = dataAggiunta;
	}

	
	public List<TemplateColorVariantBean> getVariantiModello() 
	{
		return variantiModello;
	}

	public void setVariantiModello(List<TemplateColorVariantBean> variantiModello) 
	{
		this.variantiModello = variantiModello;
	}


	private int codice;
	
	private String nome;
	
	private String informazioni;
	
	private String collezione;
	
	private String categoria;
	
	private Date dataAggiunta;
	
	private List<TemplateColorVariantBean> variantiModello;
	

}
