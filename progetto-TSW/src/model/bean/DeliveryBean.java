package model.bean;

public class DeliveryBean 
{
	public DeliveryBean()
	{
		
	}
	
	public int getCodice() {
		return codice;
	}

	public void setCodice(int codice) {
		this.codice = codice;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getNominativo() {
		return nominativo;
	}

	public void setNominativo(String nominativo) {
		this.nominativo = nominativo;
	}

	public String getCitta() {
		return citta;
	}

	public void setCitta(String citta) {
		this.citta = citta;
	}

	public String getCap() {
		return cap;
	}

	public void setCap(String cap) {
		this.cap = cap;
	}

	public int getNumeroCivico() {
		return numeroCivico;
	}

	public void setNumeroCivico(int numeroCivico) {
		this.numeroCivico = numeroCivico;
	}

	public String getVia() {
		return via;
	}

	public void setVia(String via) {
		this.via = via;
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



	private int codice;
	
	private String telefono;
	
	private String nominativo;
	
	private String citta;
	
	private String cap;
	
	private int numeroCivico;
	
	private String via;
	
	private String emailCliente;
	
	private UtenteBean cliente;
}
