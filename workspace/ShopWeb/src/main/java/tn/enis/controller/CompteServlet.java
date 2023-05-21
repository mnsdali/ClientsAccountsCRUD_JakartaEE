package tn.enis.controller;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tn.enis.entity.Client;
import tn.enis.entity.Compte;
import tn.enis.service.ClientService;
import tn.enis.service.CompteService;

/**
 * Servlet implementation class CompteServlet
 */
@WebServlet("/CompteServlet")
public class CompteServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@EJB
	private CompteService compteService;
	@EJB
	private ClientService clientService;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if ("view".equals(request.getParameter("action"))) {
			String cin = request.getParameter("cin");
			Client client = clientService.find(cin);
			String nom = client.getNom();
			String prenom = client.getPrenom();
			request.setAttribute("cin", cin);
			request.setAttribute("nom", nom);
			request.setAttribute("prenom", prenom);
			request.setAttribute("comptes", compteService.findByClient(cin));
		}
		if ("add".equals(request.getParameter("action"))) {
			float solde = Float.parseFloat(request.getParameter("solde"));
			String cin = request.getParameter("cin");
			String nom = request.getParameter("nom");
			String prenom = request.getParameter("prenom");
			Client client = clientService.find(cin);
			if (client==null || nom == null || prenom == null 
							 || !nom.equals(client.getNom()) 
							 || !prenom.equals(client.getPrenom())  ) {
				
					request.setAttribute("comptes", compteService.findAll());
					request.getRequestDispatcher("compte.jsp").forward(request, response);
					return;
				
			}
			Compte compte = new Compte(solde, client);
			compteService.save(compte);
		}
		if ("addPersonal".equals(request.getParameter("action"))) {
			float solde = Float.parseFloat(request.getParameter("solde"));
			String cin = request.getParameter("cin");

			Client client = clientService.find(cin);
			request.setAttribute("cin", client.getCin());
			request.setAttribute("nom", client.getNom());
			request.setAttribute("prenom", client.getNom());
			Compte compte = new Compte(solde, client);
			compteService.save(compte);
			request.setAttribute("comptes", compteService.findByClient(cin));
		} else if ("delete".equals(request.getParameter("action"))) {
			long rib = (long) Integer.parseInt(request.getParameter("rib"));

			compteService.remove(rib);

			return;

		} else if ("edit".equals(request.getParameter("action"))) {
			long rib = (long) Integer.parseInt(request.getParameter("rib"));
			String nom = request.getParameter("nom");
			String prenom = request.getParameter("prenom");
			request.setAttribute("compte", compteService.find(rib));
			request.setAttribute("rib", rib);
			request.setAttribute("nom", nom);
			request.setAttribute("prenom", prenom);
			request.getRequestDispatcher("edit-compte.jsp").forward(request, response);
			return;
		} else if ("update".equals(request.getParameter("action"))) {
			long rib = (long) Integer.parseInt(request.getParameter("rib"));
			float solde = Float.parseFloat(request.getParameter("solde"));

			Compte compte = compteService.find(rib);
			compte.setSolde(solde);
			compteService.update(compte);

		}

		if (!"view".equals(request.getParameter("action")) && !"addPersonal".equals(request.getParameter("action"))) {
			request.setAttribute("comptes", compteService.findAll());
			request.setAttribute("clients", clientService.findAll());
		}
		request.getRequestDispatcher("compte.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
