<%@page import="tn.enis.entity.Compte"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="tn.enis.dto.ProductDto"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Compte</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/containers.css" rel="stylesheet">
</head>
<body>
	<%
	Compte compte = (Compte) request.getAttribute("compte");
	long rib = (long) request.getAttribute("rib");
	String nom = (String) request.getAttribute("nom");
	String prenom = (String) request.getAttribute("prenom");
	float solde = compte.getSolde();
	%>
	<h1 class="text-center"  style="margin-top: 5%"> Edit Compte</h1>
	<form action="CompteServlet" method="POST">
		
		<div class="card" style="width: 30%; margin:auto; margin-top: 5%">
			  <div class="card-header">
			    Owner : <%= prenom+" "+nom %>
			  </div>
			  <ul class="list-group list-group-flush">
			    <li class="list-group-item">Solde</li>
			    <li class="list-group-item"><input name="solde" type="text" value="<%=solde %>"></li>
			    <li class="list-group-item">
			    <input type="hidden" name="rib" value="<%=rib %>">
			    <button type="submit" name="action" value="update"
			    		class="btn btn-outline-light py-2">
								<img src="img/add.png" style="height: 30px; width: 30px;"> 
			    				Compte
			    </button>
			    </li>
			  </ul>
		</div>
			

		
	</form>
		
	
	  <script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/jquery-3.6.4.min.js"></script>

	<script src="js/sweetalert.min.js"></script>
</body>
</html>