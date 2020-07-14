package com.vp.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.vp.model.Razavp;
import com.vp.model.Veterinariosvp;

public class veterinarioDao {
	

	public List<Veterinariosvp> verVeterinario(Veterinariosvp V){
		List<Veterinariosvp> vete = new ArrayList<>();
		EntityManager em;
		EntityManagerFactory emf;
		emf = Persistence.createEntityManagerFactory("VetOnline");
		em = emf.createEntityManager();
		
		try {
			em.getTransaction().begin();
			vete = em.createQuery("FROM Veterinariosvp AS d WHERE correoVVP = '" + V.getCorreoVVP() + "' AND contraVVP = '" + V.getContraVVP() + "'").getResultList();
			em.getTransaction().commit();
			
			for(Veterinariosvp datosIds:vete) {
				
			    V.setIdVVP(datosIds.getIdVVP());
			    
					
				}
			
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return vete;
	}
		
	public List<Veterinariosvp> vetsLista (){
		List<Veterinariosvp> listaVets = new ArrayList<>();
		EntityManager em;
		EntityManagerFactory emf;
		emf = Persistence.createEntityManagerFactory("VetOnline");
		em = emf.createEntityManager();
		
		try {
			em.getTransaction().begin();
			
			listaVets = em.createQuery("from Veterinariosvp").getResultList();
			em.getTransaction().commit();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return listaVets;
	}
	
	public List<Veterinariosvp> datosVete(String Id){
		List<Veterinariosvp> vete = new ArrayList<>();
		EntityManager em;
		EntityManagerFactory emf;
		emf = Persistence.createEntityManagerFactory("VetOnline");
		em = emf.createEntityManager();
		
		try {
			em.getTransaction().begin();
			vete = em.createQuery("FROM Veterinariosvp AS v WHERE idVVP = '" + Id + "'").getResultList();
			em.getTransaction().commit();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return vete;
	}
	
	
	
	
	
}
