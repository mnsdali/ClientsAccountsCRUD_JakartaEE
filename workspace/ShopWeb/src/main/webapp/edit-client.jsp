<%@page import="tn.enis.entity.Client"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="tn.enis.dto.ProductDto"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Client</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/containers.css" rel="stylesheet">
</head>
<body>
	<%
	Client client = (Client) request.getAttribute("client");
	String cin = client.getCin();
	String nom = client.getNom();
	String prenom = client.getPrenom();
	String adresse = client.getAdresse();
	%>
	
	<h1 class="text-center"  style="margin-top: 5%"> Edit Client</h1>
	<form action="ClientServlet" method="POST">
		
			<div class="card" style="width: 30%; margin:auto; margin-top: 5%">
			  <div class="card-header">
			    <img src="img/user.png" style="height: 30px; width: 30px;"> 
			  </div>
			  <ul class="list-group list-group-flush">
			    <li class="list-group-item">Cin <input name="newCin" type="text" value="<%=cin%>"></li>
			    <li class="list-group-item">Nom <input name="nom" type="text"  value="<%= nom%>"></li>
			    <li class="list-group-item">Prenom <input name="prenom" type="text"  value="<%= prenom%>"></li>
			    <li class="list-group-item">Adresse <input name="adresse" type="text"  value="<%= adresse%>"></li>
			    <li class="list-group-item">
			    <input type="hidden" name="cin" value="<%=cin %>">
			    <button type="submit" name="action" value="update"
			    		class="btn btn-outline-light py-2">
								<img src="img/add.png" style="height: 30px; width: 30px;"> 
			    				Client
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