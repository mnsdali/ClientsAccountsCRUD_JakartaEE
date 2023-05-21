package tn.enis.dao;

import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Singleton;
import javax.ejb.TransactionAttribute;
import javax.ejb.TransactionAttributeType;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import tn.enis.entity.Client;


@Singleton
@LocalBean
public class ClientDao {

	@PersistenceContext
	private EntityManager em;

	public void save(Client client) {
		em.persist(client);
	}

	public Client find(String cin) {
		return em.find(Client.class, cin);

	}

	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void remove(String cin) {
		Client client = find(cin);
		em.remove(client);
	}

	
	public void update(Client client) {
		em.merge(client);
	}

	public List<Client> findAll() {
		return em.createQuery("select c from Client c", Client.class).getResultList();
	}

}
