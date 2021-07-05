package sn.isi.dao;

import java.util.List;

import sn.isi.entities.Categorie;

public interface ICategorie {

	public int add(Categorie c);
	public int update(Categorie c);
	public int delete(int id);
	public List<Categorie> getProduit(String mc);
	public Categorie getCatgorieById(int id);
	public List<Categorie> lister();
}
