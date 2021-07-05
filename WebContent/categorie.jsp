<jsp:include page="header.jsp"></jsp:include>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="content">
    <div class="container-fluid">
       <div class="row">
           <div class="col-md-4">
                <div class="card ">
                   <div class="card-header ">
                        <h4 class="card-title">Enregistrer une Categorie</h4>
                    </div>
                    <div class="card-body ">
                         <form action="Categorie" method="post">
							<div class="form-group">
								<label class="control-label">Nom de la categorie :</label>
								<input type="text" name="nom" class="form-control"/>
							</div>
							<div>
								<input type="submit" class="btn btn-primary" value="Enregistrer">
							</div>
						</form>
                         
                            <hr>
                         <div class="stats">
                              
                         </div>
                    </div>
                </div>
          </div>
          <div class="col-md-8">
               <div class="card ">
                   <div class="card-header ">
                         <h4 class="card-title">Liste de Categories</h4>
                    </div>
                    <div class="card-body ">
                                              <form action="Produit" method="get">
						<label>Mot Clé</label>
						<input type="text" name="motCle" value="" />
						<input type="submit" class="btn btn btn-primary" value="Rechercher" name="action" >
					</form>
					<br>
				<table class="table table-bordered">
					<tr>
						<th>Nom</th>
						<th>Utilisateur</th>
						<th>Action</th>
						<th>Action</th>
						<th>Action</th>
					</tr>
					<c:forEach items="${list_categorie}" var="ca">
					<tr>
						<td>${ca.nomCategorie }</td>
						<td>${ca.idUser.prenom} ${ca.idUser.nom}</td>
						<td>
							<a href="Produit?action=Update&ref=<c:out value='${p.ref}'/>">Edit</a>
						</td>
						<td>
	                  		<a onclick="return confirm('Etes-vous sûr ?')" href="Produit?action=Supprimer&ref=${p.ref }">Supprimer</a>
						</td>
                  		<td>Visualiser</td>
					</tr>
					</c:forEach>
				</table>
                     </div>
                     <div class="card-footer ">
                          <div class="legend">
                               
                           </div>
                            <hr>
                            <div class="stats">
                              
                            </div>
                    </div>
                 </div>
          	</div>
       </div>            
    </div>
</div>


<jsp:include page="footer.jsp"></jsp:include>