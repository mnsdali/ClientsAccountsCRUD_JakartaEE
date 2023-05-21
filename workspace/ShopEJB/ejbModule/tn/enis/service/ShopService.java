package tn.enis.service;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateful;

import tn.enis.dto.ProductDto;

@Stateful
@LocalBean
public class ShopService {
	private double total = 0;
	private List<ProductDto> products = new ArrayList<>();

	public void add(ProductDto product) {
		products.add(product);
	}

	public List<ProductDto> listProducts() {
		return products;
	}

	public void delete(int index) {
		products.remove(index);
	}

	public void update(int positionProduct, ProductDto nouveauProduct) {
		products.set(positionProduct, nouveauProduct);
	}

	public double getTotal() {
		total = 0;
		for (ProductDto product : products) {
			total += product.getPrice() * product.getQuantity();
		}
		return total;
	}

	@javax.annotation.PostConstruct
	public void init() {
		System.out.println("------------- Nouveau client---------------");
	}

}
