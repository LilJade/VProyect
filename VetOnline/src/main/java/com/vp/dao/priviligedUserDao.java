package com.vp.dao;

import java.util.ArrayList;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.vp.model.Priviligeduservp;

public class priviligedUserDao {

	public List<Priviligeduservp> logInPV(Priviligeduservp pv){
		List<Priviligeduservp> privU = new ArrayList<>();
		EntityManager em;
		EntityManagerFactory emf;
		emf = Persistence.createEntityManagerFactory("VetOnline");
		em = emf.createEntityManager();
		
		try {
			em.getTransaction().begin();
			privU = em.createQuery("FROM Priviligeduservp WHERE correoPVP = '" + pv.getCorreoPVP() + "' AND contraPVP = '" + pv.getContraPVP() + "'").getResultList();
			em.getTransaction().commit();
			
			for(Priviligeduservp puvp:privU) {
				pv.setIdPVP(puvp.getIdPVP());
				pv.setAccessPVP(puvp.getAccessPVP());
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return privU;
	}
	
	 public boolean actualizarPVP(Priviligeduservp prv){
		EntityManager em;
		EntityManagerFactory emf;
		emf= Persistence.createEntityManagerFactory("VetOnline");
		em = emf.createEntityManager();
		
		prv.getIdPVP();
		prv.getNombresPVP();
		prv.getApellidosPVP();
		prv.getDireccionPVP();
		prv.getCorreoPVP();
		prv.getContraPVP();
		prv.getAccessPVP();
		
		try {
			em.getTransaction().begin();
			em.merge(prv);
			em.flush();
			em.getTransaction().commit();
			
			return true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return false;
		}
	}
	
	public List<Priviligeduservp> datosPvp(String id){
		List<Priviligeduservp> Userpv = new ArrayList<>();
		EntityManager em;
		EntityManagerFactory emf;
		emf = Persistence.createEntityManagerFactory("VetOnline");
		em = emf.createEntityManager();
		
		try {
			em.getTransaction().begin();
			Userpv = em.createQuery("FROM Priviligeduservp WHERE idPVP = '" + id + "'").getResultList();
			em.getTransaction().commit();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return Userpv;
	}
	
	public List<Priviligeduservp> modsLista (){
		List<Priviligeduservp> listaMods = new ArrayList<>();
		EntityManager em;
		EntityManagerFactory emf;
		emf = Persistence.createEntityManagerFactory("VetOnline");
		em = emf.createEntityManager();
		
		try {
			em.getTransaction().begin();
			
			listaMods = em.createQuery("from Priviligeduservp WHERE accessPVP = 1").getResultList();
			em.getTransaction().commit();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return listaMods;
	}
	public void agregarModerador(Priviligeduservp pr) {
		EntityManager em;
		EntityManagerFactory emf;
		emf = Persistence.createEntityManagerFactory("VetOnline");
		em = emf.createEntityManager();
		
		em.getTransaction().begin();
		em.persist(pr);
		em.flush();
		em.getTransaction().commit();
		
	}
	public void actualizarModerador (Priviligeduservp pr) {
		EntityManager em;
		EntityManagerFactory emf;
		emf = Persistence.createEntityManagerFactory("VetOnline");
		em = emf.createEntityManager();
		
		pr.getIdPVP();
		pr.getNombresPVP();
		pr.getApellidosPVP();
		pr.getDireccionPVP();
		pr.getCorreoPVP();
		pr.getContraPVP();
		pr.getAccessPVP();
		
		em.getTransaction().begin();
		em.merge(pr);
		em.flush();
		em.getTransaction().commit();
		
	}

	public void eliminarModerador (Priviligeduservp pr) {
		EntityManager em;
		EntityManagerFactory emf;
		emf = Persistence.createEntityManagerFactory("VetOnline");
		em = emf.createEntityManager();
		
		pr = em.getReference(Priviligeduservp.class, pr.getIdPVP());
		em.getTransaction().begin();
		em.remove(pr);
		em.flush();
		em.getTransaction().commit();
		
	}
	public List<Priviligeduservp> listaUservp(){
		List<Priviligeduservp> userpv = new ArrayList<>();
		
		EntityManager em;
		EntityManagerFactory emf;
		emf = Persistence.createEntityManagerFactory("VetOnline");
		em = emf.createEntityManager();
		
		try {
			em.getTransaction().begin();
			userpv= em.createQuery("SELECT p FROM Priviligeduservp p").getResultList();
			em.getTransaction().commit();
			
		} catch (Exception e) {
		System.out.println(e+"Error en el listaUservp");
		}
		
		return userpv;
	}
}
