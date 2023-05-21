package tn.enis.service;

import java.util.List;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import tn.enis.dao.ClientDao;
import tn.enis.entity.Client;
import tn.enis.entity.Compte;


/**
 * Session Bean implementation class clientService
 */
@Stateless
@LocalBean
public class ClientService  {
	

	@EJB
	private ClientDao clientDao;

	public void save(Client client) {
		clientDao.save(client);
	}
	
	public Client find(String cin) {
		return clientDao.find(cin);

	}

	public void remove(String cin) {
		clientDao.remove(cin);
	}
	
	public void update(Client client) {
		clientDao.update(client);
	}
	
	public List<Client> findAll(){
		return clientDao.findAll();
	}
	
	public double getTotal(Client client) {
		double total = 0;
		for (Compte compte : client.getComptes()) {
			total += compte.getSolde();
		}
		return total;
	}
}
