package sn.isi.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import sn.isi.entities.Produit;

public class ProduitImpl implements IProduit {

	private EntityManager em;
	
	public ProduitImpl() {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPASuiviStock");
		em = emf.createEntityManager();
	}
	@Override
	public int add(Produit p) {
		try {
			em.getTransaction().begin();
			em.persist(p);
			em.getTransaction().commit();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		
	}

	@Override
	public int update(Produit p) {
		try {
			em.getTransaction().begin();
			em.merge(p);
			em.getTransaction().commit();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public int delete(int id) {
		try {
			em.getTransaction().begin();
			em.remove(em.find(Produit.class, id));
			em.getTransaction().commit();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public List<Produit> getProduit(String mc) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Produit getProduitById(int id) {
		
		return em.find(Produit.class, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Produit> lister() {
		try {
			return em.createQuery("select p from Produit p").getResultList();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
