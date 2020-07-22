package com.vp.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.vp.model.Especievp;

public class especieDao {

	public List<Object> especiesLista (){
		List<Object> listaEspecies = new ArrayList<>();
		EntityManager em;
		EntityManagerFactory emf;
		emf = Persistence.createEntityManagerFactory("VetOnline");
		em = emf.createEntityManager();
		
		try {
			em.getTransaction().begin();
			
			listaEspecies = em.createQuery("SELECT e.idEVP, e.especieEVP, e.descripcionEVP FROM Especievp AS e").getResultList();
			em.getTransaction().commit();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return listaEspecies;
	}
	
	public List<Especievp> especiesListaCmbx(){
		List<Especievp> listaEspeciesCmbx = new ArrayList<>();
		EntityManager em;
		EntityManagerFactory emf;
		emf = Persistence.createEntityManagerFactory("VetOnline");
		em = emf.createEntityManager();
		
		try {
			em.getTransaction().begin();
			
			listaEspeciesCmbx = em.createQuery("FROM Especievp").getResultList();
			em.getTransaction().commit();
			
		} catch (Exception er) {
			System.out.println(er.getMessage());
		}
		
		return listaEspeciesCmbx;
	}
	
	public void agregarDatos(Especievp e){
		EntityManager em;
		EntityManagerFactory emf;
		emf = Persistence.createEntityManagerFactory("VetOnline");
		em = emf.createEntityManager();
		
		em.getTransaction().begin();
		em.persist(e);
		em.flush();
		em.getTransaction().commit();
	}
	
	public void actualizarDatos(Especievp e) {
		EntityManager em;
		EntityManagerFactory emf;
		emf = Persistence.createEntityManagerFactory("VetOnline");
		em = emf.createEntityManager();
		
		e.getIdEVP();
		e.getEspecieEVP();
		e.getDescripcionEVP();
		
		em.getTransaction().begin();
		em.merge(e);
		em.flush();
		em.getTransaction().commit();
	}
	
	public void eliminarDatos(Especievp e){
		EntityManager em;
		EntityManagerFactory emf;
		emf = Persistence.createEntityManagerFactory("VetOnline");
		em = emf.createEntityManager();
		
		e = em.getReference(Especievp.class, e.getIdEVP());
		em.getTransaction().begin();
		em.remove(e);
		em.flush();
		em.getTransaction().commit();
	}
}
