package sn.isi.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import sn.isi.entities.Categorie;

public class CategorieImpl implements ICategorie {

	private EntityManager em;
	
	public CategorieImpl() {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("JPASuiviStock");
		em = emf.createEntityManager();
	}
	
	@Override
	public int add(Categorie c) {
		try {
			em.getTransaction().begin();
			em.persist(c);
			em.getTransaction().commit();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public int update(Categorie c) {
		try {
			em.getTransaction().begin();
			em.merge(c);
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
			em.remove(em.find(Categorie.class, id));
			em.getTransaction().commit();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public List<Categorie> getProduit(String mc) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Categorie getCatgorieById(int id) {
		return em.find(Categorie.class, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Categorie> lister() {
		try {
			return em.createQuery("select c from Categorie c").getResultList();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
