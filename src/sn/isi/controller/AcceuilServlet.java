package sn.isi.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sn.isi.dao.IProduit;
import sn.isi.dao.ProduitImpl;
import sn.isi.entities.Produit;

/**
 * Servlet implementation class AcceuilServlet
 */
@WebServlet("/Acceuil")
public class AcceuilServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private IProduit produidao;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AcceuilServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		produidao = new ProduitImpl();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("user_session") == null) {
			response.sendRedirect("login.jsp");
		}else {
			List<Produit> prods = produidao.lister();
			request.setAttribute("list_produit", prods);
			request.getRequestDispatcher("acceuil.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
