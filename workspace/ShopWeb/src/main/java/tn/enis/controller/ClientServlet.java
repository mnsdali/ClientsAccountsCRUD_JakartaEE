package tn.enis.controller;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tn.enis.entity.Client;
import tn.enis.service.ClientService;

/**
 * Servlet implementation class ClientServlet
 */
@WebServlet("/ClientServlet")
public class ClientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB
	private ClientService clientService;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if ("add".equals(request.getParameter("action"))) {
			String cin = request.getParameter("cin");
			String nom = request.getParameter("nom");
			String prenom = request.getParameter("prenom");
			String adresse = request.getParameter("adresse");

			Client client = new Client(cin, nom, prenom, adresse);
			clientService.save(client);
		} else if ("delete".equals(request.getParameter("action"))) {
			String cin = request.getParameter("cin");
			
			clientService.remove(cin);
			
			return;

		} else if ("edit".equals(request.getParameter("action"))) {
			String cin = request.getParameter("cin");

			request.setAttribute("client", clientService.find(cin));
			request.getRequestDispatcher("edit-client.jsp").forward(request, response);
			return;
		} if ("update".equals(request.getParameter("action"))) {
		    String newCin = request.getParameter("newCin");
		    String cin = request.getParameter("cin");
		    String nom = request.getParameter("nom");
		    String prenom = request.getParameter("prenom");
		    String adresse = request.getParameter("adresse");

		    Client client = clientService.find(cin);
		    Client clientNew = clientService.find(newCin);
		    if (clientNew == null) {
		    	clientService.remove(cin);
		        client.setCin(newCin);
		        client.setNom(nom);
		        client.setPrenom(prenom);
		        client.setAdresse(adresse);
		        clientService.update(client); // added this line
		    } else if (newCin.equals(cin)) {
		        client.setNom(nom);
		        client.setPrenom(prenom);
		        client.setAdresse(adresse);
		        clientService.update(client); // added this line
		    }
		   
		}

		request.setAttribute("clients", clientService.findAll());

		request.getRequestDispatcher("client.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
