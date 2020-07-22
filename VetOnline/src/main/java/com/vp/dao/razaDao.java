package com.vp.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.vp.model.Razavp;

public class razaDao {
	
	public List<Razavp> razasLista (){
		List<Razavp> listaRazas = new ArrayList<>();
		EntityManager em;
		EntityManagerFactory emf;
		emf = Persistence.createEntityManagerFactory("VetOnline");
		em = emf.createEntityManager();
		
		try {
			em.getTransaction().begin();
			
			listaRazas = em.createQuery("from Razavp").getResultList();
			em.getTransaction().commit();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return listaRazas;
	}
	
	public List<Object> infRazasLista (){
		List<Object> listaRazas = new ArrayList<>();
		EntityManager em;
		EntityManagerFactory emf;
		emf = Persistence.createEntityManagerFactory("VetOnline");
		em = emf.createEntityManager();
		
		try {
			em.getTransaction().begin();
			
			listaRazas = em.createQuery("SELECT e.idEVP, r.idRVP, e.especieEVP, r.especieRVP, r.descripcionRVP FROM Razavp AS r INNER JOIN Especievp AS e ON r.especievp.idEVP = e.idEVP").getResultList();
			em.getTransaction().commit();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return listaRazas;
	}
	
	
	public void agregarDatos(Razavp r){
		EntityManager em;
		EntityManagerFactory emf;
		emf = Persistence.createEntityManagerFactory("VetOnline");
		em = emf.createEntityManager();
		
		em.getTransaction().begin();
		em.persist(r);
		em.flush();
		em.getTransaction().commit();
	}
	
	public void actualizarDatos(Razavp r) {
		EntityManager em;
		EntityManagerFactory emf;
		emf = Persistence.createEntityManagerFactory("VetOnline");
		em = emf.createEntityManager();
		
		r.getIdRVP();
		r.getEspecieRVP();
		r.getDescripcionRVP();
		r.getEspecievp();
		
		em.getTransaction().begin();
		em.merge(r);
		em.flush();
		em.getTransaction().commit();
	}
	
	public void eliminarDatos(Razavp r){
		EntityManager em;
		EntityManagerFactory emf;
		emf = Persistence.createEntityManagerFactory("VetOnline");
		em = emf.createEntityManager();
		
		r = em.getReference(Razavp.class, r.getIdRVP());
		em.getTransaction().begin();
		em.remove(r);
		em.flush();
		em.getTransaction().commit();
	}
}