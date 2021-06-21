package model.bean;

import java.sql.Date;
import java.util.List;

public class OrdineBean {
	
	public int getCodiceOrdine() 
	{
		return codiceOrdine;
	}
	
	public void setCodiceOrdine(int codiceOrdine) 
	{
		this.codiceOrdine = codiceOrdine;
	}
	
	public String getEmail() 
	{
		return email;
	}
	
	public void setEmail(String email) 
	{
		this.email = email;
	}
	
	public Date getData() 
	{
		return data;
	}
	
	public void setData(Date data) 
	{
		this.data = data;
	}
	
	public double getIva() 
	{
		return iva;
	}
	
	public void setIva(double iva) 
	{
		this.iva = iva;
	}
	
	public double getCosto()
	{
		return costo;
	}
	
	public void setCosto(double costo) 
	{
		this.costo = costo;
	}
	
	public int getCodiceCarta() 
	{
		return codiceCarta;
	}
	
	public void setCodiceCarta(int codiceCarta) 
	{
		this.codiceCarta = codiceCarta;
	}
	
	public int getCodiceConsegna() 
	{
		return codiceConsegna;
	}
	
	public void setCodiceConsegna(int codiceConsegna) 
	{
		this.codiceConsegna = codiceConsegna;
	}
	
	
	
	public List<ComposizioneBean> getComposizione() 
	{
		return composizione;
	}

	public void setComposizione(List<ComposizioneBean> composizione) 
	{
		this.composizione = composizione;
	}

	public UtenteBean getUtente() 
	{
		return utente;
	}

	public void setUtente(UtenteBean utente) 
	{
		this.utente = utente;
	}

	
	

	public CreditCardBean getCarta() {
		return carta;
	}

	public void setCarta(CreditCardBean carta) {
		this.carta = carta;
	}

	public DeliveryBean getDelivery() {
		return delivery;
	}

	public void setDelivery(DeliveryBean delivery) {
		this.delivery = delivery;
	}




	private int codiceOrdine;
	
	private String email;
	
	private Date data;
	
	private double iva;
	
	private double costo;
	
	private int codiceCarta;
	
	private int codiceConsegna;
	
	private List<ComposizioneBean> composizione;
	
	private UtenteBean utente;
	
	private CreditCardBean carta;
	
	private DeliveryBean delivery;
}
