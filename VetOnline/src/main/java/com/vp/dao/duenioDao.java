package com.vp.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.vp.model.Dueniovp;

public class duenioDao {
	
	public List<Dueniovp> logInDuenio(Dueniovp d){
		List<Dueniovp> duenio = new ArrayList<>();
		EntityManager em;
		EntityManagerFactory emf;
		emf = Persistence.createEntityManagerFactory("VetOnline");
		em = emf.createEntityManager();
		
		try {
			em.getTransaction().begin();
			duenio = em.createQuery("FROM Dueniovp AS d WHERE correoDVP = '" + d.getCorreoDVP() + "' AND contraDVP = '" + d.getContraDVP() + "'").getResultList();
			em.getTransaction().commit();
			
			for(Dueniovp dvp:duenio) {
				d.setIdDVP(dvp.getIdDVP());
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return duenio;
	}
	
	public List<Dueniovp> datosDuenio(String id){
		List<Dueniovp> duenio = new ArrayList<>();
		EntityManager em;
		EntityManagerFactory emf;
		emf = Persistence.createEntityManagerFactory("VetOnline");
		em = emf.createEntityManager();
		
		try {
			em.getTransaction().begin();
			duenio = em.createQuery("FROM Dueniovp AS d WHERE idDVP = '" + id + "'").getResultList();
			em.getTransaction().commit();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return duenio;
	}
	
	public void registrarDuenio(Dueniovp dvp) {
		EntityManager em;
		EntityManagerFactory emf;
		emf = Persistence.createEntityManagerFactory("VetOnline");
		em = emf.createEntityManager();
		
		try {
			em.getTransaction().begin();
			em.persist(dvp);
			em.flush();
			em.getTransaction().commit();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
}
