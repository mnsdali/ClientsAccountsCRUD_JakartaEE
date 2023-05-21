package tn.enis.dao;

import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Singleton;
import javax.ejb.TransactionAttribute;
import javax.ejb.TransactionAttributeType;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;


import tn.enis.entity.Compte;


@Singleton
@LocalBean
public class CompteDao{

	@PersistenceContext
	private EntityManager em;

	public void save(Compte compte) {
		em.persist(compte);
	}

	public Compte find(long rib) {
		return em.find(Compte.class, rib);

	}
	
	
	@TransactionAttribute(TransactionAttributeType.REQUIRED)
	public void remove(long rib) {
		Compte compte = find(rib);
		em.remove(compte);
	}
	
	public void update(Compte compte) {
		em.merge(compte);
	}
	
	public List<Compte> findAll(){
		return em.createQuery("select c from Compte c", Compte.class).getResultList();
	}
	
	public List<Compte> findByClient(String cin){
		return em.createQuery("select c from Compte c where  c.client.cin=:cin", Compte.class)
						.setParameter("cin", cin)
						.getResultList();
		
	}
	

}
