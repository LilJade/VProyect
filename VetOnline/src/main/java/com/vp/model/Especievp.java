package com.vp.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the especievp database table.
 * 
 */
@Entity
@NamedQuery(name="Especievp.findAll", query="SELECT e FROM Especievp e")
public class Especievp implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int idEVP;

	private String descripcionEVP;

	private String especieEVP;

	//bi-directional many-to-one association to Razavp
	@OneToMany(mappedBy="especievp")
	private List<Razavp> razavps;

	public Especievp() {
	}

	public int getIdEVP() {
		return this.idEVP;
	}

	public void setIdEVP(int idEVP) {
		this.idEVP = idEVP;
	}

	public String getDescripcionEVP() {
		return this.descripcionEVP;
	}

	public void setDescripcionEVP(String descripcionEVP) {
		this.descripcionEVP = descripcionEVP;
	}

	public String getEspecieEVP() {
		return this.especieEVP;
	}

	public void setEspecieEVP(String especieEVP) {
		this.especieEVP = especieEVP;
	}

	public List<Razavp> getRazavps() {
		return this.razavps;
	}

	public void setRazavps(List<Razavp> razavps) {
		this.razavps = razavps;
	}

	public Razavp addRazavp(Razavp razavp) {
		getRazavps().add(razavp);
		razavp.setEspecievp(this);

		return razavp;
	}

	public Razavp removeRazavp(Razavp razavp) {
		getRazavps().remove(razavp);
		razavp.setEspecievp(null);

		return razavp;
	}

}