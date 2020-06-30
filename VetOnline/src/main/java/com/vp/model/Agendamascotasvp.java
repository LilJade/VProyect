package com.vp.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the agendamascotasvp database table.
 * 
 */
@Entity
@NamedQuery(name="Agendamascotasvp.findAll", query="SELECT a FROM Agendamascotasvp a")
public class Agendamascotasvp implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int idAMVP;

	private String descripcionAMVP;

	private String encabezadoAMVP;

	private String fechaAMVP;

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

	public Agendamascotasvp() {
	}

	public int getIdAMVP() {
		return this.idAMVP;
	}

	public void setIdAMVP(int idAMVP) {
		this.idAMVP = idAMVP;
	}

	public String getDescripcionAMVP() {
		return this.descripcionAMVP;
	}

	public void setDescripcionAMVP(String descripcionAMVP) {
		this.descripcionAMVP = descripcionAMVP;
	}

	public String getEncabezadoAMVP() {
		return this.encabezadoAMVP;
	}

	public void setEncabezadoAMVP(String encabezadoAMVP) {
		this.encabezadoAMVP = encabezadoAMVP;
	}

	public String getFechaAMVP() {
		return this.fechaAMVP;
	}

	public void setFechaAMVP(String fechaAMVP) {
		this.fechaAMVP = fechaAMVP;
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