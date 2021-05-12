package model;

import java.util.Date;

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
	
	public void setDate(Date data) 
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
	
	public String getTipoUtentee() 
	{
		return tipoUtente;
	}
	
	public void setTipoUtente(String tipoUtente) 
	{
		this.tipoUtente = tipoUtente;
	}
	
	public String getNumeroCarta() 
	{
		return numeroCarta;
	}
	
	public void setNumeroCarta(String numeroCarta) 
	{
		this.numeroCarta = numeroCarta;
	}
	
	public int getCodiceConsegna() 
	{
		return codiceConsegna;
	}
	
	public void setCodiceConsegna(int codiceConsegna) 
	{
		this.codiceConsegna = codiceConsegna;
	}
	
	private int codiceOrdine;
	
	private String email;
	
	private Date data;
	
	private double iva;
	
	private double costo;
	
	private String tipoUtente;
	
	private String numeroCarta;
	
	private int codiceConsegna;
}
