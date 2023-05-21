package tn.enis.service;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;

/**
 * Session Bean implementation class CalculatrieService
 */
@Stateless
@LocalBean
public class CalculatrieService {

	public float add(float x, float y) {
		return x + y;
	}

	public float mult(float x, float y) {
		return x * y;
	}

	public float sub(float x, float y) {
		return x - y;
	}

}
