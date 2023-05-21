<%@page import="tn.enis.dto.ProductDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Shop</title>
 <link href="css/bootstrap.min.css" rel="stylesheet" >
<body>
	<h1>Add new Product</h1>
	<form action="ShopServlet" method="POST">
		<table>
			<tr>
				<td>name</td>
				<td><input name="name" type="text" required></td>
			</tr>
			<tr>
				<td>quantity</td>
				<td><input name="quantity" type="text" required></td>
			</tr>
			<tr>
				<td>price</td>
				<td><input name="price" type="text" required></td>
			</tr>
			<tr>
				<td></td>
				<td><input class="btn btn-primary" type="submit" name="action" value="add"></td>
			</tr>
		</table>
	</form>
	<hr>
	
	<h1>List of products</h1>
    <%
    List<ProductDto> products = (List<ProductDto>) request.getAttribute("products");
    Double total = (Double) request.getAttribute("total");
    %>
    <h2>
        total <span id="total"><%=total%></span>
    </h2>
	<table class="table table-hover table-light table-striped"  border="1">
		<thead  class="thead-dark">
		<tr>
			<th>N°</th>
			<th>name</th>
			<th>quantity</th>
			<th>price</th>
			<th>Delete</th>
			<th>Delete-Ajax</th>
			<th>Edit </th>
		</tr>
		</thead>
		<%
		if (products != null && !products.isEmpty()) {
			int i = 0;
			for (ProductDto product : products) {
		%>
		<tr id="<%=i%>">
			<td><%=i%></td>
			<td><%=product.getName()%></td>
			<td><%=product.getQuantity()%></td>
			<td><%=product.getPrice()%></td>
			<td><a href="ShopServlet?action=delete&index=<%=i%>">delete</a></td>
			<td><a href="javascript:deleteProduct(<%=i%>)">delete-ajax</a></td>
			<td>
			<form action="ShopServlet" method="POST">
			  <input type="hidden" name="index" value="<%=i %>">
			  <input type="submit" name="action" value="edit">
			</form>
			
			</td>
		</tr>

		<%
		i++;
		}
		}
		%>

	</table>
	
	 <script src="js/bootstrap.bundle.min.js" ></script>
  	 <script src="js/jquery-3.6.4.min.js" ></script>
  	 
  	 <script src="js/sweetalert.min.js" ></script>
  	 <script src="js/product.js" ></script>
  	 

</body>
</html>