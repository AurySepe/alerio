package model;

import java.sql.Date;
import java.util.List;

public class ProductBean 
{
	
	public ProductBean()
	{
		codice = -1;
	}
	
	public double getPrezzo() 
	{
		return prezzo;
	}

	public void setPrezzo(double prezzo) 
	{
		this.prezzo = prezzo;
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

	public String getColore() 
	{
		return colore;
	}

	public void setColore(String colore) 
	{
		this.colore = colore;
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

	public char getTaglia() 
	{
		return taglia;
	}

	public void setTaglia(char taglia) 
	{
		this.taglia = taglia;
	}

	public boolean isInVendita() 
	{
		return inVendita;
	}

	public void setInVendita(boolean inVendita) 
	{
		this.inVendita = inVendita;
	}


	public List<ImageBean> getImmagini() {
		return immagini;
	}

	public void setImmagini(List<ImageBean> immagini) {
		this.immagini = immagini;
	}


	private double prezzo;
	
	private int codice;
	
	private String nome;
	
	private String informazioni;
	
	private String collezione;
	
	private String colore;
	
	private String categoria;
	
	private Date dataAggiunta;
	
	private char taglia;
	
	private boolean inVendita;
	
	private List<ImageBean> immagini;

}
