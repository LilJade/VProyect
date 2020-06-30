package com.vp.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the adopcionvp database table.
 * 
 */
@Entity
@NamedQuery(name="Adopcionvp.findAll", query="SELECT a FROM Adopcionvp a")
public class Adopcionvp implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int idAVP;

	private String contactoAVP;

	private String descripcionAVP;

	private String edadAVP;

	private String especieAVP;

	private int estadoAVP;

	private String generoAVP;

	private String razaAVP;

	public Adopcionvp() {
	}

	public int getIdAVP() {
		return this.idAVP;
	}

	public void setIdAVP(int idAVP) {
		this.idAVP = idAVP;
	}

	public String getContactoAVP() {
		return this.contactoAVP;
	}

	public void setContactoAVP(String contactoAVP) {
		this.contactoAVP = contactoAVP;
	}

	public String getDescripcionAVP() {
		return this.descripcionAVP;
	}

	public void setDescripcionAVP(String descripcionAVP) {
		this.descripcionAVP = descripcionAVP;
	}

	public String getEdadAVP() {
		return this.edadAVP;
	}

	public void setEdadAVP(String edadAVP) {
		this.edadAVP = edadAVP;
	}

	public String getEspecieAVP() {
		return this.especieAVP;
	}

	public void setEspecieAVP(String especieAVP) {
		this.especieAVP = especieAVP;
	}

	public int getEstadoAVP() {
		return this.estadoAVP;
	}

	public void setEstadoAVP(int estadoAVP) {
		this.estadoAVP = estadoAVP;
	}

	public String getGeneroAVP() {
		return this.generoAVP;
	}

	public void setGeneroAVP(String generoAVP) {
		this.generoAVP = generoAVP;
	}

	public String getRazaAVP() {
		return this.razaAVP;
	}

	public void setRazaAVP(String razaAVP) {
		this.razaAVP = razaAVP;
	}

}