package model.bean;

import java.sql.Date;

public class CreditCardBean 
{
	public CreditCardBean()
	{
		
	}
	
	public String getNumeroCarta() 
	{
		return numeroCarta;
	}

	public void setNumeroCarta(String numeroCarta) 
	{
		this.numeroCarta = numeroCarta;
	}

	public Date getDataScadenza() 
	{
		return dataScadenza;
	}

	public void setDataScadenza(Date dataScadenza) 
	{
		this.dataScadenza = dataScadenza;
	}

	public String getNominativo() 
	{
		return nominativo;
	}

	public void setNominativo(String nominativo) 
	{
		this.nominativo = nominativo;
	}
	
	
	
	public String getEmailCliente() {
		return emailCliente;
	}

	public void setEmailCliente(String emailCliente) {
		this.emailCliente = emailCliente;
	}

	public UtenteBean getCliente() {
		return cliente;
	}

	public void setCliente(UtenteBean cliente) {
		this.cliente = cliente;
	}

	public int getCodice() 
	{
		return codice;
	}

	public void setCodice(int codice) 
	{
		this.codice = codice;
	}

	




	private String numeroCarta;
	
	private Date dataScadenza;
	
	private String nominativo;
	
	private String emailCliente;
	
	private UtenteBean cliente;
	
	private int codice;
	
}
