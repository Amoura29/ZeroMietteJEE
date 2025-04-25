<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>

<body>
	<div class="dashboard">
		<aside class="sidebar">
			<div class="profile">
				<img src="assets/avatar.png" alt="Profil">
				<h2>ZéroMiette</h2>
				
			</div>
			<nav>
				<button name="navbtn" value="home"> Home</button>
				<button name="navbtn" value="requests">My Requests</button>
				<button name="navbtn" value="profile">Profile</button>
				<button name="navbtn" value="logout">Log Out</button>
			</nav>
		</aside>

		<main class="content">
			<c :choose>
               <c :when test=”${level==1}”>
               Niveau d´ebutant 
               </c :when>
               <c :when test=”${level==2}”>Niveau interm´ediaire </c :when>
               <c :when test=”${level==3}”>Niveau confirm´e </c :when>
               <c :when test=”${level==4}”>Niveau expert </c :when>
               <c :otherwise>Niveau non reconnu : ${level}</c :otherwise>
            </c :choose>

			




	<div class="container mt-5">
		<h2 class="mb-4 text-center text-primary">ð Mes Demandes</h2>

		<div class="d-flex justify-content-center gap-3 mb-4">
			<button class="btn btn-outline-primary" (click)="getUserRequestsByState('pending')">
				â³ En attente
			</button>
			<button class="btn btn-outline-success" (click)="getUserRequestsByState('accepted')">
				â AcceptÃ©es
			</button>
			<button class="btn btn-outline-danger" (click)="getUserRequestsByState('refused')">
				â RefusÃ©es
			</button>
		</div>

		@if (errorMessage) {
		<div class="alert alert-warning text-center">{{ errorMessage }}</div>
		}
		@else if (requests.length > 0) {
		<div class="row">
			@for (req of requests; track req.annCode) {

			<div class="card shadow-sm h-100 border-start border-4 border-info">
				<div class="card-body">
					<h5 class="card-title text-info fw-bold">Annonce #{{ req.annCode }}</h5>
					<p class="card-text">
						<strong>Description :</strong> {{ req.description }}
					</p>
					<p class="card-text">
						<strong>Date :</strong>
						<span class="badge bg-secondary">{{ req.dateC}}</span>
					</p>
				</div>
			</div>

			}
		</div>
		}
		@else {
		<div class="alert alert-info text-center">ð Choisissez un Ã©tat pour afficher vos demandes.</div>
		}
	</div>


</body>

</html>

</body>
</html>