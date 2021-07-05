package sn.isi.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sn.isi.dao.IUser;
import sn.isi.dao.UserImpl;
import sn.isi.entities.User;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/User")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private IUser userdao;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		userdao = new UserImpl();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			List<User> users = userdao.lister();
			request.setAttribute("list_users", users);
			request.getRequestDispatcher("user.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action").toString();
		if(action.equals("Envoyer")) {
			String nom = request.getParameter("nom").toString();
			String prenom = request.getParameter("prenom").toString();
			String email = request.getParameter("email").toString();
			String password = request.getParameter("password").toString();
			int etat = 0;
			User user = new User();
			user.setNom(nom);
			user.setPrenom(prenom);
			user.setEmail(email);
			user.setPassword(password);
			user.setEtat(etat);
			userdao.add(user);
			response.sendRedirect("User");
		}
	}

}
