<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>${nomDep}</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/axentix@2.2.1/dist/axentix.min.css">
<style>
	.custom-footer{
		position:absolute;
		bottom:0px;
	}
</style>
</head>
<body>
	<nav class="navbar shadow-1 primary">
		<a href="<c:url value="/logout"/>">
			<button class="btn shadow-1 rounded-2 red btn-small">Se Déconnecter</button>
		</a>
	   	<h4 class="navbar-logo navbar-centered">
	    	${nomDep}
	  	</h4>
	  	<div class="navbar-menu ml-auto">
	    	<a class="navbar-link" href="home">Liste des departements</a>
	  	</div>
	</nav>
	<br/>
	<div style="display:flex;justify-content:center;width:100%;">
		<a href="formMateriel?depId=${param['depId']}" style="text-decoration: underline;"><button class="btn shadow-1 primary rounded-4">Ajouter un Materiel</button></a>
	</div>
	<br/>
	<div style="padding:15px;">
		<div class="card white light-shadow-5 p-4 rounded-2">
		  	<div class="table-responsive">
				<table class="table">
				    <thead>
				        <tr>
				            <td>ID</td>
				            <td>Titre</td>
				            <td>Type</td>
				            <td>Serie</td>
				            <td>Quantité</td>
				            <td>Etat</td>
				            <td>Action</td>
				        </tr>
				    </thead>
				    <tbody>
				        <c:forEach items="${listeMateriel}" var="mat">
					        <tr>
					            <td><strong>${mat.id}</strong></td>
					            <td><strong>${mat.titre}</strong></td>
					            <td><strong>${mat.type}</strong></td>
					            <td><strong>${mat.sn}</strong></td>
					            <td><strong>${mat.qte}</strong></td>
					            <td>
					            <c:if test="${mat.etat == true}"></c:if>
					            <c:choose>
								  <c:when test="${mat.etat == true}">
								    <div class="p-2 rounded-4 font-s1 font-w600 green light-4 text-green text-dark-4 d-inline-block">Fonctionnel</div>
								  </c:when>
								  <c:when test="${mat.etat == false}">
								    <div class="p-2 rounded-4 font-s1 font-w600 blue light-4 text-blue text-dark-3 d-inline-block">Déffectueux</div>
								  </c:when>
								</c:choose>
					            </td>
					            <td>
					            	<a href="removeMateriel?matId=${mat.id}" class="btn shadow-1 rounded-2 red btn-small">Supprimer</a>
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
</body>
</html>