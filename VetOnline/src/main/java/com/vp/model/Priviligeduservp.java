package com.vp.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the priviligeduservp database table.
 * 
 */
@Entity
@NamedQuery(name="Priviligeduservp.findAll", query="SELECT p FROM Priviligeduservp p")
public class Priviligeduservp implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int idPVP;

	private int accessPVP;

	private String apellidosPVP;

	private String contraPVP;

	private String correoPVP;

	private String direccionPVP;

	private String nombresPVP;

	public Priviligeduservp() {
	}

	public int getIdPVP() {
		return this.idPVP;
	}

	public void setIdPVP(int idPVP) {
		this.idPVP = idPVP;
	}

	public int getAccessPVP() {
		return this.accessPVP;
	}

	public void setAccessPVP(int accessPVP) {
		this.accessPVP = accessPVP;
	}

	public String getApellidosPVP() {
		return this.apellidosPVP;
	}

	public void setApellidosPVP(String apellidosPVP) {
		this.apellidosPVP = apellidosPVP;
	}

	public String getContraPVP() {
		return this.contraPVP;
	}

	public void setContraPVP(String contraPVP) {
		this.contraPVP = contraPVP;
	}

	public String getCorreoPVP() {
		return this.correoPVP;
	}

	public void setCorreoPVP(String correoPVP) {
		this.correoPVP = correoPVP;
	}

	public String getDireccionPVP() {
		return this.direccionPVP;
	}

	public void setDireccionPVP(String direccionPVP) {
		this.direccionPVP = direccionPVP;
	}

	public String getNombresPVP() {
		return this.nombresPVP;
	}

	public void setNombresPVP(String nombresPVP) {
		this.nombresPVP = nombresPVP;
	}

}