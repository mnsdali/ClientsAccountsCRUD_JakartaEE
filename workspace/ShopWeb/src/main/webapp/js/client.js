function deleteClient(cin, nbComptes) {
	


	swal({
		title: "Are you sure?",
		text: "Once deleted, you will not be able to recover this product!",
		icon: "warning",
		buttons: true,
		dangerMode: true,
	})
		.then((willDelete) => {
			if (willDelete) {
				if (nbComptes>0){
					swal({title: "Error Deletion!",
						text: "You still have Comptes to delete.", 
					     icon: "error",
					   });
					}
				else{
						$.ajax({
						url : "ClientServlet",
						type : "POST",
						data : {
						'action' : "delete",
						'cin' : cin
						},
						success : function() {
						$("#" + cin).remove();
						swal("Your Client has been deleted!", {
						     icon: "success",
						   });
						},
						error : function() {
						swal("Poof! server error!", {
						     icon: "error",
						   });
						}
					});
				}
				
			} else {
				swal({
					title: "Your Client is safe!",
					icon: "success",
				});
				
			
				
				
			}
		});
}