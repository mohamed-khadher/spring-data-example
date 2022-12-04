<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/axentix@2.2.1/dist/axentix.min.css">
<title>Accés Refusé</title>
<style>
	.fullsec{
		display:flex;
		width: 100%;
		height: 100vh;
		justify-content: center;
		align-items: center;
		flex-direction: column;
	}
</style>
</head>
<body>
	<div class="fullsec">
		<div class="p-3 my-2 rounded-1 yellow light-4 text-yellow text-dark-4 bd-solid bd-yellow bd-dark-1 bd-1">
		  <span class="iconify-inline" data-icon="mdi:alert"></span> Vous ne possédez pas de previlege pour accéder cette section !
		</div>
		<a href="<c:url value="/logout"/>">
			<button class="btn shadow-1 rounded-2 red btn-small">Se Déconnecter</button>
		</a>
	</div>
</body>
</html>