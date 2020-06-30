package com.vp.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the mascotavp database table.
 * 
 */
@Entity
@NamedQuery(name="Mascotavp.findAll", query="SELECT m FROM Mascotavp m")
public class Mascotavp implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int idMVP;

	private String edadMVP;

	private String especieMVP;

	private String fotoMVP;

	private String nombresMVP;

	//bi-directional many-to-one association to Agendamascotasvp
	@OneToMany(mappedBy="mascotavp")
	private List<Agendamascotasvp> agendamascotasvps;

	//bi-directional many-to-one association to Consultavp
	@OneToMany(mappedBy="mascotavp")
	private List<Consultavp> consultavps;

	//bi-directional many-to-one association to Dueniovp
	@ManyToOne
	@JoinColumn(name="idDVP")
	private Dueniovp dueniovp;

	//bi-directional many-to-one association to Razavp
	@ManyToOne
	@JoinColumn(name="idRVP")
	private Razavp razavp;

	public Mascotavp() {
	}

	public int getIdMVP() {
		return this.idMVP;
	}

	public void setIdMVP(int idMVP) {
		this.idMVP = idMVP;
	}

	public String getEdadMVP() {
		return this.edadMVP;
	}

	public void setEdadMVP(String edadMVP) {
		this.edadMVP = edadMVP;
	}

	public String getEspecieMVP() {
		return this.especieMVP;
	}

	public void setEspecieMVP(String especieMVP) {
		this.especieMVP = especieMVP;
	}

	public String getFotoMVP() {
		return this.fotoMVP;
	}

	public void setFotoMVP(String fotoMVP) {
		this.fotoMVP = fotoMVP;
	}

	public String getNombresMVP() {
		return this.nombresMVP;
	}

	public void setNombresMVP(String nombresMVP) {
		this.nombresMVP = nombresMVP;
	}

	public List<Agendamascotasvp> getAgendamascotasvps() {
		return this.agendamascotasvps;
	}

	public void setAgendamascotasvps(List<Agendamascotasvp> agendamascotasvps) {
		this.agendamascotasvps = agendamascotasvps;
	}

	public Agendamascotasvp addAgendamascotasvp(Agendamascotasvp agendamascotasvp) {
		getAgendamascotasvps().add(agendamascotasvp);
		agendamascotasvp.setMascotavp(this);

		return agendamascotasvp;
	}

	public Agendamascotasvp removeAgendamascotasvp(Agendamascotasvp agendamascotasvp) {
		getAgendamascotasvps().remove(agendamascotasvp);
		agendamascotasvp.setMascotavp(null);

		return agendamascotasvp;
	}

	public List<Consultavp> getConsultavps() {
		return this.consultavps;
	}

	public void setConsultavps(List<Consultavp> consultavps) {
		this.consultavps = consultavps;
	}

	public Consultavp addConsultavp(Consultavp consultavp) {
		getConsultavps().add(consultavp);
		consultavp.setMascotavp(this);

		return consultavp;
	}

	public Consultavp removeConsultavp(Consultavp consultavp) {
		getConsultavps().remove(consultavp);
		consultavp.setMascotavp(null);

		return consultavp;
	}

	public Dueniovp getDueniovp() {
		return this.dueniovp;
	}

	public void setDueniovp(Dueniovp dueniovp) {
		this.dueniovp = dueniovp;
	}

	public Razavp getRazavp() {
		return this.razavp;
	}

	public void setRazavp(Razavp razavp) {
		this.razavp = razavp;
	}

}