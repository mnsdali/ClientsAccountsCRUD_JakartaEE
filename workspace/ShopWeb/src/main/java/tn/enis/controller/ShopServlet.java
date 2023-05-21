package tn.enis.controller;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tn.enis.dto.ProductDto;
import tn.enis.service.ShopService;

/**
 * Servlet implementation class ShopServlet
 */
@WebServlet("/ShopServlet")
public class ShopServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB
	private ShopService shopService;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if ("add".equals(request.getParameter("action"))) {
			String name = request.getParameter("name");
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			float price = Float.parseFloat(request.getParameter("price"));

			ProductDto product = new ProductDto(name, quantity, price);
			shopService.add(product);
		} else if ("delete".equals(request.getParameter("action"))) {
			int index = Integer.parseInt(request.getParameter("index"));
			shopService.delete(index);

		} else if ("delete-ajax".equals(request.getParameter("action"))) {
            int index = Integer.parseInt(request.getParameter("index"));
            shopService.delete(index);
            response.setContentType("text/plain");
            response.getWriter().print(shopService.getTotal());
            return;

        }else if ("edit".equals(request.getParameter("action"))) {
			int index = Integer.parseInt(request.getParameter("index"));

			request.setAttribute("product", shopService.listProducts().get(index));
			request.setAttribute("index", index);
			request.getRequestDispatcher("edit-shop.jsp").forward(request, response);
			return;
		} else if ("update".equals(request.getParameter("action"))) {
			int index = Integer.parseInt(request.getParameter("index"));
			String name = request.getParameter("name");
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			float price = Float.parseFloat(request.getParameter("price"));

			ProductDto product = new ProductDto(name, quantity, price);
			shopService.update(index, product);

		}

		request.setAttribute("products", shopService.listProducts());
		request.setAttribute("total", shopService.getTotal());

		request.getRequestDispatcher("shop.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
