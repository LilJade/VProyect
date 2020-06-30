package com.vp.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the consultavp database table.
 * 
 */
@Entity
@NamedQuery(name="Consultavp.findAll", query="SELECT c FROM Consultavp c")
public class Consultavp implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int idCVP;

	private String descripcionCVP;

	private String estadoCVP;

	private String fechaCVP;

	//bi-directional many-to-one association to Dueniovp
	@ManyToOne
	@JoinColumn(name="idDVP")
	private Dueniovp dueniovp;

	//bi-directional many-to-one association to Mascotavp
	@ManyToOne
	@JoinColumn(name="idMVP")
	private Mascotavp mascotavp;

	//bi-directional many-to-one association to Veterinariosvp
	@ManyToOne
	@JoinColumn(name="idVVP")
	private Veterinariosvp veterinariosvp;

	public Consultavp() {
	}

	public int getIdCVP() {
		return this.idCVP;
	}

	public void setIdCVP(int idCVP) {
		this.idCVP = idCVP;
	}

	public String getDescripcionCVP() {
		return this.descripcionCVP;
	}

	public void setDescripcionCVP(String descripcionCVP) {
		this.descripcionCVP = descripcionCVP;
	}

	public String getEstadoCVP() {
		return this.estadoCVP;
	}

	public void setEstadoCVP(String estadoCVP) {
		this.estadoCVP = estadoCVP;
	}

	public String getFechaCVP() {
		return this.fechaCVP;
	}

	public void setFechaCVP(String fechaCVP) {
		this.fechaCVP = fechaCVP;
	}

	public Dueniovp getDueniovp() {
		return this.dueniovp;
	}

	public void setDueniovp(Dueniovp dueniovp) {
		this.dueniovp = dueniovp;
	}

	public Mascotavp getMascotavp() {
		return this.mascotavp;
	}

	public void setMascotavp(Mascotavp mascotavp) {
		this.mascotavp = mascotavp;
	}

	public Veterinariosvp getVeterinariosvp() {
		return this.veterinariosvp;
	}

	public void setVeterinariosvp(Veterinariosvp veterinariosvp) {
		this.veterinariosvp = veterinariosvp;
	}

}