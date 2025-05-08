<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
</head>
<body>
    <div class="dashboard">
        <aside class="sidebar">
            <div class="profile">
                <img src="assets/avatar.png" alt="Profil">
                <h2>ZéroMiette</h2>
            </div>
            <nav>
                <form action="dashboard" method="post">
                    <button name="navbtn" value="home">Home</button>
                    <button name="navbtn" value="requests">My Requests</button>
                    <button name="navbtn" value="profile">Profile</button>
                    <button name="navbtn" value="logout">Log Out</button>
                </form>
            </nav>
        </aside>

        <main class="content">
            <!-- Dynamically include content based on navbtn -->
            <c:choose>
                <c:when test="${pageContent == 'home'}">
                    <!-- Include home.jsp here -->
                    <jsp:include page="home.jsp" />
                </c:when>
                <c:when test="${pageContent == 'requests'}">
                    <!-- Include requests.jsp here -->
                    <jsp:include page="requests.jsp" />
                </c:when>
                <c:when test="${pageContent == 'profile'}">
                    <!-- Include profile.jsp here -->
                    <jsp:include page="profile.jsp" />
                </c:when>
                <c:otherwise>
                    <h2>Welcome to the Dashboard</h2>
                    <!-- Default content if no button clicked -->
                </c:otherwise>
            </c:choose>
        </main>
    </div>
</body>
</html>

			




	<div class="container mt-5">
		<h2 class="mb-4 text-center text-primary">Mes Demandes</h2>

		<div class="d-flex justify-content-center gap-3 mb-4">
			<button class="btn btn-outline-primary" (click)="getUserRequestsByState('pending')">
				 En attente
			</button>
			<button class="btn btn-outline-success" (click)="getUserRequestsByState('accepted')">
				âcceptÃ©es
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