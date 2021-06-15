package model.bean;

import java.util.Collection;
import java.util.List;

public class UtenteBean {

	
	public String getEmail() 
	{
		return email;
	}
	
	public void setEmail(String email) 
	{
		this.email = email;
	}
	
	public String getNome() 
	{
		return nome;
	}
	
	public void setNome(String nome) 
	{
		this.nome = nome;
	}
	
	public String getCognome() 
	{
		return cognome;
	}
	
	public void setCognome(String cognome) 
	{
		this.cognome = cognome;
	}
	
	public String getPwd() 
	{
		return pwd;
	}
	
	public void setPwd(String pwd) 
	{
		this.pwd = pwd;
	}
	
	public String getGenere() 
	{
		return genere;
	}
	
	public void setGenere(String genere) 
	{
		this.genere = genere;
	}
	
	public boolean isRegistrato() 
	{
		return registrato;
	}
	
	public void setRegistrato(boolean registrato) 
	{
		this.registrato = registrato;
	}
	
	
	
	public List<OrdineBean> getOrdini() 
	{
		return ordini;
	}

	public void setOrdini(List<OrdineBean> ordini) 
	{
		this.ordini = ordini;
	}

	public Collection<CreditCardBean> getCarte() {
		return carte;
	}

	public void setCarte(Collection<CreditCardBean> carte) {
		this.carte = carte;
	}

	public Collection<DeliveryBean> getIndirizzi() {
		return indirizzi;
	}

	public void setIndirizzi(Collection<DeliveryBean> indirizzi) {
		this.indirizzi = indirizzi;
	}



	private String email;
	
	private String nome;
	
	private String cognome;
	
	private String pwd;
	
	private String genere;
	
	private boolean registrato;
	
	private List<OrdineBean> ordini;
	
	private Collection<CreditCardBean> carte;
	
	private Collection<DeliveryBean> indirizzi;
	
}
