package com.vp.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.vp.model.Mascotavp;

public class mascotaDao {

	 public List<Mascotavp> mascotasDuenio(String id){
			List<Mascotavp> mascotas = new ArrayList<>();
			EntityManager em;
			EntityManagerFactory emf;
			emf = Persistence.createEntityManagerFactory("VetOnline");
			em = emf.createEntityManager();
			
			try {
				em.getTransaction().begin();
				mascotas = em.createQuery("SELECT m.idMVP, m.nombresMVP, m.fotoMVP FROM Mascotavp AS m WHERE m.dueniovp = '" +id + "'").getResultList();
				em.getTransaction().commit();
				
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			
			return mascotas;
		}
}
