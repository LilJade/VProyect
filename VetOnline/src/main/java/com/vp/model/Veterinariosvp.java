package com.vp.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the veterinariosvp database table.
 * 
 */
@Entity
@NamedQuery(name="Veterinariosvp.findAll", query="SELECT v FROM Veterinariosvp v")
public class Veterinariosvp implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int idVVP;

	private String apellidosVVP;

	private String contraVVP;

	private String correoVVP;

	private String descripcionVVP;

	private int edadVVP;

	private String fotoVVP;

	private String nombresVVP;

	//bi-directional many-to-one association to Agendamascotasvp
	@OneToMany(mappedBy="veterinariosvp")
	private List<Agendamascotasvp> agendamascotasvps;

	//bi-directional many-to-one association to Consultavp
	@OneToMany(mappedBy="veterinariosvp")
	private List<Consultavp> consultavps;

	public Veterinariosvp() {
	}

	public int getIdVVP() {
		return this.idVVP;
	}

	public void setIdVVP(int idVVP) {
		this.idVVP = idVVP;
	}

	public String getApellidosVVP() {
		return this.apellidosVVP;
	}

	public void setApellidosVVP(String apellidosVVP) {
		this.apellidosVVP = apellidosVVP;
	}

	public String getContraVVP() {
		return this.contraVVP;
	}

	public void setContraVVP(String contraVVP) {
		this.contraVVP = contraVVP;
	}

	public String getCorreoVVP() {
		return this.correoVVP;
	}

	public void setCorreoVVP(String correoVVP) {
		this.correoVVP = correoVVP;
	}

	public String getDescripcionVVP() {
		return this.descripcionVVP;
	}

	public void setDescripcionVVP(String descripcionVVP) {
		this.descripcionVVP = descripcionVVP;
	}

	public int getEdadVVP() {
		return this.edadVVP;
	}

	public void setEdadVVP(int edadVVP) {
		this.edadVVP = edadVVP;
	}

	public String getFotoVVP() {
		return this.fotoVVP;
	}

	public void setFotoVVP(String fotoVVP) {
		this.fotoVVP = fotoVVP;
	}

	public String getNombresVVP() {
		return this.nombresVVP;
	}

	public void setNombresVVP(String nombresVVP) {
		this.nombresVVP = nombresVVP;
	}

	public List<Agendamascotasvp> getAgendamascotasvps() {
		return this.agendamascotasvps;
	}

	public void setAgendamascotasvps(List<Agendamascotasvp> agendamascotasvps) {
		this.agendamascotasvps = agendamascotasvps;
	}

	public Agendamascotasvp addAgendamascotasvp(Agendamascotasvp agendamascotasvp) {
		getAgendamascotasvps().add(agendamascotasvp);
		agendamascotasvp.setVeterinariosvp(this);

		return agendamascotasvp;
	}

	public Agendamascotasvp removeAgendamascotasvp(Agendamascotasvp agendamascotasvp) {
		getAgendamascotasvps().remove(agendamascotasvp);
		agendamascotasvp.setVeterinariosvp(null);

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
		consultavp.setVeterinariosvp(this);

		return consultavp;
	}

	public Consultavp removeConsultavp(Consultavp consultavp) {
		getConsultavps().remove(consultavp);
		consultavp.setVeterinariosvp(null);

		return consultavp;
	}

}