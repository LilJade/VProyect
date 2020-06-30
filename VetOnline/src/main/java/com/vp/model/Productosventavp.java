package com.vp.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the productosventavp database table.
 * 
 */
@Entity
@NamedQuery(name="Productosventavp.findAll", query="SELECT p FROM Productosventavp p")
public class Productosventavp implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int idProdVentVP;

	private String descripcionProdVentVP;

	private String imagenProdVentVP;

	private String nombreProdVentVP;

	private String precioProdVentVP;

	public Productosventavp() {
	}

	public int getIdProdVentVP() {
		return this.idProdVentVP;
	}

	public void setIdProdVentVP(int idProdVentVP) {
		this.idProdVentVP = idProdVentVP;
	}

	public String getDescripcionProdVentVP() {
		return this.descripcionProdVentVP;
	}

	public void setDescripcionProdVentVP(String descripcionProdVentVP) {
		this.descripcionProdVentVP = descripcionProdVentVP;
	}

	public String getImagenProdVentVP() {
		return this.imagenProdVentVP;
	}

	public void setImagenProdVentVP(String imagenProdVentVP) {
		this.imagenProdVentVP = imagenProdVentVP;
	}

	public String getNombreProdVentVP() {
		return this.nombreProdVentVP;
	}

	public void setNombreProdVentVP(String nombreProdVentVP) {
		this.nombreProdVentVP = nombreProdVentVP;
	}

	public String getPrecioProdVentVP() {
		return this.precioProdVentVP;
	}

	public void setPrecioProdVentVP(String precioProdVentVP) {
		this.precioProdVentVP = precioProdVentVP;
	}

}