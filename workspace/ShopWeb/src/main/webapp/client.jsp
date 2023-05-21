<%@page import="tn.enis.entity.Client"%>
<%@page import="tn.enis.dto.ProductDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Clients</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/containers.css" rel="stylesheet">
<body>
	<%
	List<Client> clients = (List<Client>) request.getAttribute("clients");
	
	%>
	
	<div class="clTable1 d-flex">
	<div class="clTable11 mr-2">
		<h1>Add new Client</h1>
		<form action="ClientServlet" method="POST">
			<table>
				<tr>
					<td>cin</td>
					<td><input name="cin" type="text" required></td>
				</tr>
				<tr>
					<td>nom</td>
					<td><input name="nom" type="text" required></td>
				</tr>
				<tr>
					<td>prenom</td>
					<td><input name="prenom" type="text" required></td>
				</tr>
				<tr>
					<td>adresse</td>
					<td><input name="adresse" type="text" required></td>
				</tr>
				<tr>
					<td></td>
					<td><input class="btn btn-primary" type="submit" name="action"
						value="add"></td>
				</tr>
			</table>
		</form>
	</div>
	
	
	<div class="clTable12 ml-2">
		
		 <h1> A total of <%=clients.size() %> clients </h1>
		 <h2> Check their
		 <a href="CompteServlet">	
			<button class="btn btn-outline-light">    <img src="img/comptes.png" style="height: 30px; width: 30px;"> 
				<span style="font-weight: bold;
									 fonts-size: 14px;">comptes </span></button> 
		 </a>
		 </h2> 
	</div>
	</div>
	<br>
	
	<div class="clTable2">
	<h1>List of clients</h1>
	
	
	<table class="table table-hover table-light table-striped" border="1">
		<thead class="thead-dark">
			<tr>
				<th>Cin</th>
				<th>Nom</th>
				<th>Prenom</th>
				<th>Adresse</th>
				<th>Comptes</th>
				<th>#</th>
				
			</tr>
		</thead>
		<%
		if (clients != null && !clients.isEmpty()) {
			for (Client client : clients) {
				String cin = client.getCin();
				int nbComptes = client.getComptes().size();
		%>
		<tr id="<%=cin%>">
			<td><%=cin%></td>
			<td><%=client.getNom()%></td>
			<td><%=client.getPrenom()%></td>
			<td><%=client.getAdresse()%></td>
			<td>
				<form action="CompteServlet" method="POST">
					 <input type="hidden" name="cin" value="<%=cin%>">
					<button type="submit" name="action" class="btn btn-outline-light" value="view" >
			         <img src="img/comptes.png" style="height:30px; width:30px;"> <%=nbComptes%> comptes
			       
			         </button>
			         
			    </form>
		    </td>
			<td  >
				<div  class="d-flex" style="margin:auto;">
			   <button class="btn btn-outline-light"  onclick="deleteClient(<%=cin%>, <%=nbComptes%>)">  
			    	<img src="img/trash.png" style="height:35px; width:35px;">
			     </button>
				<form action="ClientServlet" method="POST">
					<input type="hidden" name="cin" value="<%=cin%>"> 
					<button  type="submit" name="action" class="btn btn-outline-light py-2" value="edit"  > <img src="img/edit.png" style="height:30px; width:30px;"> </button>
				</form>
				</div>
			</td>
			
		</tr>

		<%
		}
		}
		%>

	</table>
	</div>
	        
		         
		         
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/jquery-3.6.4.min.js"></script>

	<script src="js/sweetalert.min.js"></script>
	<script src="js/client.js"></script>
	


</body>
</html>