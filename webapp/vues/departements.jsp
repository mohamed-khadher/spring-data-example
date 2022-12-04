<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Liste des departements</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/axentix@2.2.1/dist/axentix.min.css">
<style>
	.custom-footer{
		position:absolute;
		bottom: 0px;
	}
</style>
</head>

<body>
	<nav class="navbar shadow-1 primary">
		<a href="<c:url value="/logout"/>">
			<button class="btn shadow-1 rounded-2 red btn-small">Se Déconnecter</button>
		</a>
	   	<h4 class="navbar-logo navbar-centered">
	    	Liste des départements
	  	</h4>
	</nav>
	<br/>
	<div style="padding:40px;">
		<div class="card white light-shadow-5 p-4 rounded-2">
		  	<div class="table-responsive">
				<table class="table">
				    <thead>
				        <tr>
				            <td>ID</td>
				            <td>Titre</td>
				            <td>Action</td>
				        </tr>
				    </thead>
				    <tbody>
				        <c:forEach items="${listeDepartements}" var="dep">
					        <tr>
					            <td><strong>${dep.id}</strong></td>
					            <td><strong>${dep.titre}</strong></td>
					            <td>
						            <a href="ListeDepartementMateriel?depId=${dep.id}" class="btn shadow-1 rounded-2 blue btn-small">
										Liste des matériels
									</a>
								</td>
					        </tr>
				        </c:forEach>
				    </tbody>
				</table>
			</div>
		</div>
	</div>
	<footer class="footer primary custom-footer">
    	Copyright © 2022 - MK
	</footer>
	<script src="https://cdn.jsdelivr.net/npm/axentix@2.2.1/dist/axentix.min.js"></script>
</body>
</html>