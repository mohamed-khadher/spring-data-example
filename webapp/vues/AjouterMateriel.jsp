<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ajouter du materiel</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/axentix@2.2.1/dist/axentix.min.css">
<style>
	.custom-table{
		width:350px
	}
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
	    	Ajouter un Materiel
	  	</h4>
	  	<div class="navbar-menu ml-auto">
	    	<a class="navbar-link" href="ListeDepartementMateriel?depId=${param.depId}">Liste des materiels</a>
	  	</div>
	</nav>
	<br/>
	<div style="display:flex;height:70vh;width:100%;justify-content:center;align-items:center;">
		<form action="AddMateriel" method="POST" class="form-material form-material-bordered custom-table">
			<div class="form-field">
				<input type='text' name='titre' class="form-control rounded-1" required/>
				<label for="titre">Titre</label>
			</div>
			<div class="form-field">
				<label for="type">Type</label>
				<select name="type" 
				class="form-control form-custom-select white shadow-1"
	      		data-ax="select"
	      		id="type"
	      		>
					<option value="Info">Info</option>
					<option value="Electrique">Electrique</option>
					<option value="Civil">Civil</option>
					<option value="Mecanique">Mecanique</option>
					<option value="Chimique">Chimique</option>
				</select>
			</div>
			<div class="form-field">
				<input type='number' name='sn' class="form-control rounded-1" required/>
				<label for="sn">Série</label>
			</div>
			<div class="form-field">
				<input type='number' name='qte' class="form-control rounded-1" required/>
				<label for="qte">Quantité</label>
			</div>
			<div class="form-field">
				<label for="etat">Etat</label>
				<select name="etat"
				class="form-control form-custom-select white shadow-1"
	      		data-ax="select"
	      		id="etat"
	      		>
					<option value="true">Fonctionnel</option>
					<option value="false">Défectueux</option>
				</select>
			</div>
			<input name="depId" value="${param.depId}" type="hidden"/>
			<button type="submit" class="btn rounded-2 blue btn-press">Ajouter</button>
		</form>
	</div>
	<footer class="footer primary custom-footer">
    	Copyright © 2022 - MK
	</footer>
	<script src="https://cdn.jsdelivr.net/npm/axentix@2.2.1/dist/axentix.min.js"></script>
</body>
</html>