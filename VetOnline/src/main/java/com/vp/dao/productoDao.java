package com.vp.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.vp.model.Productosventavp;
import com.vp.model.Razavp;

public class productoDao {
	

		
		public List<Productosventavp> proLista (){
			List<Productosventavp> listapro = new ArrayList<>();
			EntityManager em;
			EntityManagerFactory emf;
			emf = Persistence.createEntityManagerFactory("VetOnline");
			em = emf.createEntityManager();
			
			try {
				em.getTransaction().begin();
				
				listapro = em.createQuery("from Productosventavp").getResultList();
				em.getTransaction().commit();
				
			} catch (Exception e) {
				System.out.println(e);
			}
			
			return listapro;
		}

}
