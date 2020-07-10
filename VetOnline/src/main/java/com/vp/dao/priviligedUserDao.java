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
}
