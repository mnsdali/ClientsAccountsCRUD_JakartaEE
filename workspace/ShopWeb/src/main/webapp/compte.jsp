<%@page import="tn.enis.entity.Compte"%>
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
<link href="css/jquery-ui.css" rel="stylesheet">
<body>
	<%
	List<Compte> comptes = (List<Compte>) request.getAttribute("comptes");
	List<Client> clients = (List<Client>) request.getAttribute("clients");
	String cin = (String) request.getAttribute("cin");
	String nom = (String) request.getAttribute("nom");
	if (nom != null) {

		String prenom = (String) request.getAttribute("prenom");
	%>
	<div class="clTable1 d-flex">
		<div class="clTable11 mr-2">
			<h1>Add new Compte</h1>
			<form action="CompteServlet" method="POST">
				<table>
					<tr>
						<td>Solde</td>
						<td><input name="solde" type="text" required></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="hidden" name="cin" value="<%=cin%>">
							<input class="btn btn-primary" type="submit" name="action"
							value="addPersonal"></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="clTable12 ml-2">

			<h1>
				A total of
				<%=comptes.size()%>
				comptes
			</h1>
			<h2>
				Check <a href="ClientServlet">
					<button class="btn btn-outline-light">
						<img src="img/user.png" style="height: 30px; width: 30px;">
						<span style="font-weight: bold; fonts-size: 14px;">clients
						</span>
					</button>
				</a>
			</h2>
		</div>
	</div>
	<br>
	<h1 class="text-center">
		Owned by :
		<%=prenom + " " + nom%>
	</h1>


	<div class="clTable2">
		<h1>List of comptes</h1>

		<%
		if (comptes != null && !comptes.isEmpty()) {
			Client client = comptes.get(0).getClient();
		%>

		<table class="table table-hover table-light table-striped center"
			border="1">
			<thead>
				<tr class="thead-dark">
					<th>Rib</th>
					<th>Solde</th>

					<th>#</th>
				</tr>
			</thead>


			<%
			for (Compte compte : comptes) {
				Long rib = compte.getRib();
			%>
			<tr id=<%=rib%>>
				<td><%=rib%></td>
				<td><%=compte.getSolde()%></td>

				<td>


					<div class="d-flex" style="margin: auto;">

						<button class="btn btn-outline-light"
							onclick="deleteCompte(<%=rib%>)">
							<img src="img/trash.png" style="height: 35px; width: 35px;">
						</button>
						<form action="CompteServlet" method="POST">
							<input type="hidden" name="rib" value="<%=rib%>">
							<input type="hidden" name="prenom" value="<%=client.getPrenom()%>">
							<input type="hidden" name="nom" value="<%=client.getNom()%>">
							<button type="submit" name="action" value="edit"
								class="btn btn-outline-light py-2">
								<img src="img/edit.png" style="height: 30px; width: 30px;">
							</button>
						</form>
					</div>

				</td>
			</tr>
			<%
			}
			%>
		</table>
	</div>
	<%
	}
	} else {
	%>
	<div class="clTable1 d-flex">
		<div class="clTable11 mr-2 ui-widget">
			<h1>Add new Compte</h1>
			<form action="CompteServlet" method="POST">
				<table>
					<tr>
						<td>Solde</td>
						<td><input name="solde" type="text" required></td>
					</tr>
					<tr>
						<td>Cin</td>
						<td><input id="cin" type="text" name="cin" required></td>
					</tr>
					<tr>
						<td>Nom</td>
						<td><input id="nom" type="text" name="nom" required></td>
					</tr>
					<tr>
						<td>Prenom</td>
						<td><input id="prenom" type="text" name="prenom" required></td>
					</tr>
					<tr>

						<td><input class="btn btn-primary" type="submit"
							name="action" value="add"></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="clTable12 ml-2">

			<h1>
				A total of
				<%=comptes.size()%>
				comptes
			</h1>
			<h2>
				Check <a href="ClientServlet">
					<button class="btn btn-outline-light">
						<img src="img/user.png" style="height: 30px; width: 30px;">
						<span style="font-weight: bold; fonts-size: 14px;">clients
						</span>
					</button>
				</a>
			</h2>
		</div>
	</div>
	<br>
	<div class="clTable2">
		<h1>List of comptes</h1>


		<%
		if (comptes != null && !comptes.isEmpty()) {
		%>


		<table class="table table-hover table-light table-striped center">
			<thead class="thead-dark">
				<tr>
					<th>Rib</th>
					<th>Solde</th>
					<th>Owner</th>
					<th>#</th>
				</tr>
			</thead>


			<%
			for (Compte compte : comptes) {
				Client client = compte.getClient();
				Long rib = compte.getRib();
			%>
			<tr id="<%=rib%>">
				<td><%=rib%></td>
				<td><%=compte.getSolde()%></td>
				<td><%=client.getCin() + " : " + client.getNom() + " " + client.getPrenom()%></td>
				<td>


					<div class="d-flex" style="margin: auto;">

						<button class="btn btn-outline-light"
							onclick="deleteCompte(<%=rib%>)">
							<img src="img/trash.png" style="height: 35px; width: 35px;">
						</button>

						<form action="CompteServlet" method="POST">
							<input type="hidden" name="rib" value="<%=rib%>">
							<input type="hidden" name="nom" value="<%=client.getNom()%>">
							<input type="hidden" name="prenom" value="<%=client.getPrenom()%>">
							<button type="submit" name="action" value="edit"
								class="btn btn-outline-light py-2">
								<img src="img/edit.png" style="height: 30px; width: 30px;">
							</button>
						</form>
					</div>

				</td>
			</tr>
			<%
			}
			}
			%>

			<%
			}
			%>
		</table>

	</div>

	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/jquery-3.6.4.min.js"></script>

	<script src="js/sweetalert.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script src="js/compte.js"></script>
	<script>
	var	req = [];
	  <%if (nom == null && clients!=null && !clients.isEmpty()) {
		int id = 1;
		for (Client client : clients) {
			String tcin = client.getCin();
			String tnom = client.getNom();
			String tprenom = client.getPrenom();%>
	         dict = {"label": '<%=tcin+": "+tnom+" "+tprenom%>',
	        		 "value": '<%=tcin+": "+tnom+" "+tprenom%>',
	        		 "cin": '<%=tcin%>',
	        		 "nom": '<%=tnom%>',
	                 "prenom": '<%=tprenom%>',
	                 
	                 "id": <%=id%>
	         };
	         req.push(dict);
	         <%id++;
	}
	}%>
	
	console.log(req);
	 
	</script>
	
	<script>
	
		
		
		  $('#nom').autocomplete({ 
		    source: req,
		    select: function (event, ui) { 
		      console.log(ui.item.cin); 
		      
		    
		      $('#cin').val(ui.item.cin);
		      $('#nom').val(ui.item.nom);
		      $('#prenom').val(ui.item.prenom); 
		      
		      return false;
		    }
		  });
		
		  $('#prenom').autocomplete({ 
		    source: req.map(function(item) { return item.cin; }),
		    select: function (event, ui) { 
		      console.log(ui.item.cin); // Check if ui.item.cin and ui.item.nom are valid for selected item
		      
		      
		      $('#cin').val(ui.item.cin);
		      $('#nom').val(ui.item.nom);
		      $('#prenom').val(ui.item.prenom); 
		    
		      return false;
		    }
		  });
		  
		  $('#cin').autocomplete({
			  source: req, // use "value" property as source
			  select: function (event, ui) { 
			    console.log(ui.item.cin); 
			    
			    $('#cin').val(ui.item.cin);
			    $('#nom').val(ui.item.nom);
			    $('#prenom').val(ui.item.prenom); 
			
			    return false;
			  }
			});
		  
		  
	</script>
</body>
</html>