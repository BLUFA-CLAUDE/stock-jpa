<jsp:include page="header.jsp"></jsp:include>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="content">
    <div class="container-fluid">
       <div class="row">
           <div class="col-md-4">
                <div class="card ">
                   <div class="card-header ">
                        <h4 class="card-title">Enregistrer un utilisateur</h4>
                    </div>
                    <div class="card-body ">
                  <form action="User" method="post">
	            	<div class="form-group">
	            		<label class="control-label">Nom</label>
	            		<input class="form-control" type="text" name="nom" required="required">
	            	</div>
	            	<div class="form-group">
	            		<label class="control-label">Prenom</label>
	            		<input class="form-control" type="text" name="prenom" required="required">
	            	</div>
	            	<div class="form-group">
	            		<label class="control-label">Email</label>
	            		<input class="form-control" type="email" name="email" required="required">
	            	</div>
	            	<div class="form-group">
	            		<label class="control-label">Mot de pass</label>
	            		<input class="form-control" type="password" name="password" required="required">
	            	</div>
	            	<div class="form-group">
	            		<input class="btn btn-success" type="submit" name="action" value="Envoyer" >
	            		<input class="btn btn-danger" type="reset" name="action" value="Annuler" >
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
                         <h4 class="card-title">Liste des Utilisateurs</h4>
                    </div>
                    <div class="card-body ">
                                    	<form action="User" method="get">
					<label>Mot Clé</label>
					<input type="text" name="motcle" value="" />
					<input type="submit" class="btn btn btn-primary" value="Rechercher" name="action" >
				</form>
				<br>
             <table class="table table-bordered">
                  	<tr>
                  		<th>Nom</th>
                  		<th>Prenom</th>
                  		<th>Email</th>
                  		<th>Action</th>
                  		<th>Action</th>
                  		<th>Action</th>
                  	</tr>
                  	<c:forEach items="${list_users}" var="u">
                  		<tr>
                  			<td>${u.nom}</td>
                  			<td>${u.prenom}</td>
                  			<td>${u.email}</td>
                  			<td>Editer</td>
                  			<td>Supprimer</td>
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