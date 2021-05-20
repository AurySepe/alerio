package model.ds;

import model.dao.ComposizioneDAO;
import model.dao.ImageDAO;
import model.dao.OrdineDAO;
import model.dao.ProductDAO;
import model.dao.ProductTemplateDAO;
import model.dao.TemplateColorVariantDAO;
import model.dao.UtenteDAO;

public class DAOS 
{
	
	
	
	public static ProductTemplateDAO getProductTemplateModel() {
		return productTemplateModel;
	}
	public static TemplateColorVariantDAO getProductTemplateVariantModel() {
		return productTemplateVariantModel;
	}
	public static ProductDAO getProductModel() {
		return productModel;
	}
	public static ImageDAO getImageModel() {
		return imageModel;
	}
	public static OrdineDAO getOrdineModel() {
		return ordineModel;
	}
	public static ComposizioneDAO getComposizioneModel() {
		return composizioneModel;
	}
	public static UtenteDAO getUtenteModel() {
		return utenteModel;
	}
	public static BlobDS getBlobModel() {
		return blobModel;
	}
	private static ProductTemplateDAO productTemplateModel = new ProductTemplateDAODS();
	private static TemplateColorVariantDAO productTemplateVariantModel = new TemplateColorVariantDAODS(); 
	private static ProductDAO productModel = new ProductDAODS();
	private static ImageDAO imageModel = new ImageDAODS();
	private static OrdineDAO ordineModel = new OrdineDAODS();
	private static ComposizioneDAO composizioneModel = new ComposizioneDAODS();
	private static UtenteDAO utenteModel = new UtenteDAODS();
	private static BlobDS blobModel = new BlobDS();
	
	
}
