package sn.isi.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sn.isi.dao.CategorieImpl;
import sn.isi.dao.ICategorie;
import sn.isi.dao.IProduit;
import sn.isi.dao.ProduitImpl;
import sn.isi.entities.Categorie;
import sn.isi.entities.Produit;
import sn.isi.entities.User;

/**
 * Servlet implementation class ProduitServlet
 */
@WebServlet("/Produit")
public class ProduitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private IProduit produitdao;
	private ICategorie categoriedao;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProduitServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		produitdao = new ProduitImpl();
		categoriedao = new CategorieImpl();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("user_session") == null) {
			response.sendRedirect("login.jsp");
		}else {
				List<Produit> prods = produitdao.lister();
				request.setAttribute("list_produit", prods);
				
				List<Categorie> categories = categoriedao.lister();
				request.setAttribute("list_categorie", categories);
				request.getRequestDispatcher("produit.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			String designation = request.getParameter("designation").toString();
			double prix = Double.parseDouble(request.getParameter("prix").toString());
			int quantite = Integer.parseInt(request.getParameter("quantite").toString());
			int Idcategorie = Integer.parseInt(request.getParameter("Idcategorie").toString());
			
			
			Categorie categorie = categoriedao.getCatgorieById(Idcategorie);
			User user = (User)request.getSession().getAttribute("user_session");
			
			Produit prod = new Produit();
			prod.setDesignation(designation);
			prod.setPrix(prix);
			prod.setQuantite(quantite);
			prod.setCategorie(categorie);
			prod.setIdUser(user);
			categorie.setIdUser(user);
			
			produitdao.add(prod);
			response.sendRedirect("Produit");
	}

}
