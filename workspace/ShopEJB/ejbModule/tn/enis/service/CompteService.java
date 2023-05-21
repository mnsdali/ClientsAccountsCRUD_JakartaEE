package tn.enis.service;

import java.util.List;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import tn.enis.dao.CompteDao;
import tn.enis.entity.Compte;


@Stateless
@LocalBean
public class CompteService  {
	
	@EJB
	private CompteDao compteDao;

	public void save(Compte compte) {
		compteDao.save(compte);
	}
	
	public Compte find(long rib) {
		return compteDao.find(rib);

	}

	public void remove(long rib) {
		compteDao.remove(rib);
	}
	
	public void update(Compte compte) {
		compteDao.update(compte);
	}
	
	public List<Compte> findAll(){
		return compteDao.findAll();
	}
	
	public List<Compte> findByClient(String cin){
		return compteDao.findByClient(cin);
	}
	
	
}
