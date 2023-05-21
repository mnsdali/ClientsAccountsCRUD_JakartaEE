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
	
	
	<div class="d-flex" style="width: 50%;margin: auto; margin-top: 3em; ">
		<div class="card" style="width: 47%; margin-right: 3%">
			  <img class="card-img-top" src="img/user.png" style="margin:auto;width: 64px;height: 64px;">
			  <div class="card-body">
			    <h5 class="card-title">Clients Section</h5>
			    <p class="card-text">A CRUD Section for clients to manage both Client and Compte objects.</p>
			  </div>
			  <div class="card-body">
			   <a href="ClientServlet">  <button class="btn btn-outline-dark">   <img src="img/user.png"> clients </button> </a>
			    
			  </div>
		</div>
		<div class="card" style="width: 47%;margin-left: 3%" >
			  <img class="card-img-top" src="img/comptes.png" style="margin:auto;width: 64px;height: 64px;">
			  <div class="card-body">
			    <h5 class="card-title">Comptes Section</h5>
			    <p class="card-text">A CRUD Section for comptes to manage both Client and Compte objects.</p>
			  </div>
			  <div class="card-body">
			   <a href="CompteServlet"><button class="btn btn-outline-dark">    <img src="img/comptes.png"> comptes </button></a> 
			    
			  </div>
		</div>
	</div>
	<script src="js/bootstrap.bundle.min.js" ></script>
  	<script src="js/jquery-3.6.4.min.js" ></script> 
  	<script src="js/sweetalert.min.js" ></script>
  	<script src="js/product.js" ></script>
  	 

</body>
</html>