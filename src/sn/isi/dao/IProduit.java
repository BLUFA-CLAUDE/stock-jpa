package sn.isi.dao;

import java.util.List;

import sn.isi.entities.Produit;

public interface IProduit {

	public int add(Produit p);
	public int update(Produit p);
	public int delete(int id);
	public List<Produit> getProduit(String mc);
	public Produit getProduitById(int id);
	public List<Produit> lister();
}
