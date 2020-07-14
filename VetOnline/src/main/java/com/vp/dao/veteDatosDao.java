package com.vp.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;


import com.vp.model.Veterinariosvp;



public class veteDatosDao {

public List<Veterinariosvp> ListaVete(){
		
		List<Veterinariosvp> lista = new ArrayList<>();
		
		EntityManager em;
		EntityManagerFactory emf;
		emf = Persistence.createEntityManagerFactory("VetOnline");
		em = emf.createEntityManager();
		
		try {
			
		em.getTransaction().begin();
		
		lista = em.createQuery("from Veterinariosvp").getResultList();
		em.getTransaction().commit();
		
			
	 }
		
	catch (Exception e) {
		
		System.out.println(e);
		
	}
	
		
		return lista;
	}

public void eliminarUsuario(Veterinariosvp V) {
	
	EntityManager em;
	EntityManagerFactory emf;
	emf = Persistence.createEntityManagerFactory("VetOnline");
	em = emf.createEntityManager();
	
	V = em.getReference(Veterinariosvp.class, V.getIdVVP());
	em.getTransaction().begin();
	em.remove(V);
	em.flush();
	em.getTransaction().commit();
	
}

public void agregarVeterinario(Veterinariosvp v) {
	
	EntityManager em;
	EntityManagerFactory emf;
	emf = Persistence.createEntityManagerFactory("VetOnline");
	em = emf.createEntityManager();
	
	em.getTransaction().begin();
	em.persist(v);
	em.flush();
	em.getTransaction().commit();
	
	
	
}
	
	
}
