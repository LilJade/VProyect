package com.vp.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the dueniovp database table.
 * 
 */
@Entity
@NamedQuery(name="Dueniovp.findAll", query="SELECT d FROM Dueniovp d")
public class Dueniovp implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int idDVP;

	private String apellidosDVP;

	private String contraDVP;

	private String correoDVP;

	private String direccionDVP;

	private int edadDVP;

	private String fotoDVP;

	private String nombresDVP;

	private String telefonoDVP;

	//bi-directional many-to-one association to Agendamascotasvp
	@OneToMany(mappedBy="dueniovp")
	private List<Agendamascotasvp> agendamascotasvps;

	//bi-directional many-to-one association to Consultavp
	@OneToMany(mappedBy="dueniovp")
	private List<Consultavp> consultavps;

	//bi-directional many-to-one association to Mascotavp
	@OneToMany(mappedBy="dueniovp")
	private List<Mascotavp> mascotavps;

	public Dueniovp() {
	}

	public int getIdDVP() {
		return this.idDVP;
	}

	public void setIdDVP(int idDVP) {
		this.idDVP = idDVP;
	}

	public String getApellidosDVP() {
		return this.apellidosDVP;
	}

	public void setApellidosDVP(String apellidosDVP) {
		this.apellidosDVP = apellidosDVP;
	}

	public String getContraDVP() {
		return this.contraDVP;
	}

	public void setContraDVP(String contraDVP) {
		this.contraDVP = contraDVP;
	}

	public String getCorreoDVP() {
		return this.correoDVP;
	}

	public void setCorreoDVP(String correoDVP) {
		this.correoDVP = correoDVP;
	}

	public String getDireccionDVP() {
		return this.direccionDVP;
	}

	public void setDireccionDVP(String direccionDVP) {
		this.direccionDVP = direccionDVP;
	}

	public int getEdadDVP() {
		return this.edadDVP;
	}

	public void setEdadDVP(int edadDVP) {
		this.edadDVP = edadDVP;
	}

	public String getFotoDVP() {
		return this.fotoDVP;
	}

	public void setFotoDVP(String fotoDVP) {
		this.fotoDVP = fotoDVP;
	}

	public String getNombresDVP() {
		return this.nombresDVP;
	}

	public void setNombresDVP(String nombresDVP) {
		this.nombresDVP = nombresDVP;
	}

	public String getTelefonoDVP() {
		return this.telefonoDVP;
	}

	public void setTelefonoDVP(String telefonoDVP) {
		this.telefonoDVP = telefonoDVP;
	}

	public List<Agendamascotasvp> getAgendamascotasvps() {
		return this.agendamascotasvps;
	}

	public void setAgendamascotasvps(List<Agendamascotasvp> agendamascotasvps) {
		this.agendamascotasvps = agendamascotasvps;
	}

	public Agendamascotasvp addAgendamascotasvp(Agendamascotasvp agendamascotasvp) {
		getAgendamascotasvps().add(agendamascotasvp);
		agendamascotasvp.setDueniovp(this);

		return agendamascotasvp;
	}

	public Agendamascotasvp removeAgendamascotasvp(Agendamascotasvp agendamascotasvp) {
		getAgendamascotasvps().remove(agendamascotasvp);
		agendamascotasvp.setDueniovp(null);

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
		consultavp.setDueniovp(this);

		return consultavp;
	}

	public Consultavp removeConsultavp(Consultavp consultavp) {
		getConsultavps().remove(consultavp);
		consultavp.setDueniovp(null);

		return consultavp;
	}

	public List<Mascotavp> getMascotavps() {
		return this.mascotavps;
	}

	public void setMascotavps(List<Mascotavp> mascotavps) {
		this.mascotavps = mascotavps;
	}

	public Mascotavp addMascotavp(Mascotavp mascotavp) {
		getMascotavps().add(mascotavp);
		mascotavp.setDueniovp(this);

		return mascotavp;
	}

	public Mascotavp removeMascotavp(Mascotavp mascotavp) {
		getMascotavps().remove(mascotavp);
		mascotavp.setDueniovp(null);

		return mascotavp;
	}

}