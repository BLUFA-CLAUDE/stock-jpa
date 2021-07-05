<jsp:include page="header.jsp"></jsp:include>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="content">
       <div class="row">
           <div class="col-lg-4">
                <div class="card mb-4">
                   <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                        <h4 class="m-0 font-weight-bold text-primary">Enregistrer un produit</h4>
                    </div>
                    <div class="card-body ">
                     	<form action="Produit" method="post">
						<div class="form-group">
							<label class="control-label">Designation :</label>
							<input type="text" name="designation" class="form-control"/>
						</div>
						<div class="form-group">
							<label class="control-label">Prix :</label>
							<input type="text" name="prix" class="form-control"/>
						</div>
						<div class="form-group">
							<label class="control-label">Quantite :</label>
							<input type="text" name="quantite" class="form-control"/>
						</div>
						<div class="form-group ">
                              <label class="control-label">Categorie :</label>    
                                  <select name="Idcategorie" id="inputState" class="select2-single-placeholder form-control">
                                    <option selected>Choisir ...</option>
                                    <c:forEach items="${list_categorie}" var="ca">
                                    	<option value="${ca.idCategorie }">${ca.nomCategorie }</option>
                                    </c:forEach>
                                  </select>
                        </div>
						<div>
							<input type="submit" class="btn btn-primary" value="Enregistrer" >
						</div>
					</form>
                 
                    </div>
                    
                    <div class="card-footer ">  
                    </div>
                </div>
          </div>
          <div class="col-lg-8 mb-4">
               <div class="card">
                   <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                         <h4 class="m-0 font-weight-bold text-primary">Liste de produits</h4>
                    </div>
                    <div class="card-body ">
					<div class="table-responsive">
						<table class="table align-items-center table-flush">
							<thead class="thead-light">
							<tr>
								<th>Designation</th>
								<th>Categorie</th>
								<th>Prix</th>
								<th>Quantite</th>
								<th>Utilisateur</th>
								<th>Action</th>
								<th>Action</th>
								<th>Action</th>
							</tr>
							 </thead>
							 <tbody>
							<c:forEach items="${list_produit}" var="p">
							<tr>
								<td>${p.designation }</td>
								<td>${p.categorie.nomCategorie }</td>
								<td>${p.prix }</td>
								<td>${p.quantite }</td>
								<td>${p.idUser.prenom} ${p.idUser.nom}</td>
								<td>
									<a class="btn btn-sm btn-warning" href="">Edit</a>
								</td>
								<td>
			                  		<a class="btn btn-sm btn-danger" href="">Supprimer</a>
								</td>
		                  		<td>
			                  		<a class="btn btn-sm btn-success" href="">Visualiser</a>
								</td>
							</tr>
							</c:forEach>
							</tbody>
						</table>
						</div>
                     </div>
                     <div class="card-footer "></div>    
                 </div>
          	</div>
       </div>            
</div>


<jsp:include page="footer.jsp"></jsp:include>