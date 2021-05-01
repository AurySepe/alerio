package model;

import java.io.InputStream;
import java.sql.Blob;


public class ImageBean 
{
	
	public ImageBean()
	{
		codice = -1;
		prodotto = -1;
	}
	
	
	public int getCodice() {
		return codice;
	}

	public void setCodice(int codice) {
		this.codice = codice;
	}

	public int getProdotto() {
		return prodotto;
	}

	public void setProdotto(int prodotto) {
		this.prodotto = prodotto;
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

	private int codice;
	
	private int prodotto;
	
	private int posizione;
	
	private Blob img;
}
