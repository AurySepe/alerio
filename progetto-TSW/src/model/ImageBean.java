package model;

import java.sql.Blob;


public class ImageBean 
{
	
	public ImageBean()
	{
		codice = -1;
		codiceVariante = -1;
	}
	
	
	public int getCodice() {
		return codice;
	}

	public void setCodice(int codice) {
		this.codice = codice;
	}

	public int getCodiceVariante() {
		return codiceVariante;
	}

	public void setCodiceVariante(int codiceVariante) {
		this.codiceVariante = codiceVariante;
	}
	
	public int getPosizione() {
		return posizione;
	}


	public void setPosizione(int posizione) {
		this.posizione = posizione;
	}

	public Blob getImg() {
		return img;
	}

	public void setImg(Blob blob) {
		this.img = blob;
	}

	public TemplateColorVariantBean getVarianteModello() 
	{
		return varianteModello;
	}


	public void setVarianteModello(TemplateColorVariantBean varianteModello) 
	{
		this.varianteModello = varianteModello;
	}

	private int codice;
	
	private int codiceVariante;
	
	private int posizione;
	
	private Blob img;
	
	private TemplateColorVariantBean varianteModello;
}
