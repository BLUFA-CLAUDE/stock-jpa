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
import sn.isi.entities.Categorie;
import sn.isi.entities.User;

/**
 * Servlet implementation class CategorieServlet
 */
@WebServlet("/Categorie")
public class CategorieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private ICategorie categoriedao;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategorieServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		categoriedao = new CategorieImpl();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("user_session") == null) {
			response.sendRedirect("Login");
		}else {
				List<Categorie> categories = categoriedao.lister();
				request.setAttribute("list_categorie", categories);
				request.getRequestDispatcher("categorie.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nom = request.getParameter("nom");
		
		Categorie categorie = new Categorie();
		categorie.setNomCategorie(nom);
		User user = (User)request.getSession().getAttribute("user_session");
		categorie.setIdUser(user);
		
		categoriedao.add(categorie);
		response.sendRedirect("Categorie");
	}

}
