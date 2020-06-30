package com.vp.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the razavp database table.
 * 
 */
@Entity
@NamedQuery(name="Razavp.findAll", query="SELECT r FROM Razavp r")
public class Razavp implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int idRVP;

	private String descripcionRVP;

	private String especieRVP;

	//bi-directional many-to-one association to Mascotavp
	@OneToMany(mappedBy="razavp")
	private List<Mascotavp> mascotavps;

	//bi-directional many-to-one association to Especievp
	@ManyToOne
	@JoinColumn(name="idEVP")
	private Especievp especievp;

	public Razavp() {
	}

	public int getIdRVP() {
		return this.idRVP;
	}

	public void setIdRVP(int idRVP) {
		this.idRVP = idRVP;
	}

	public String getDescripcionRVP() {
		return this.descripcionRVP;
	}

	public void setDescripcionRVP(String descripcionRVP) {
		this.descripcionRVP = descripcionRVP;
	}

	public String getEspecieRVP() {
		return this.especieRVP;
	}

	public void setEspecieRVP(String especieRVP) {
		this.especieRVP = especieRVP;
	}

	public List<Mascotavp> getMascotavps() {
		return this.mascotavps;
	}

	public void setMascotavps(List<Mascotavp> mascotavps) {
		this.mascotavps = mascotavps;
	}

	public Mascotavp addMascotavp(Mascotavp mascotavp) {
		getMascotavps().add(mascotavp);
		mascotavp.setRazavp(this);

		return mascotavp;
	}

	public Mascotavp removeMascotavp(Mascotavp mascotavp) {
		getMascotavps().remove(mascotavp);
		mascotavp.setRazavp(null);

		return mascotavp;
	}

	public Especievp getEspecievp() {
		return this.especievp;
	}

	public void setEspecievp(Especievp especievp) {
		this.especievp = especievp;
	}

}