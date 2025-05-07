<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
<div class="row">
    <nav class="navbar bg-primary navbar-expand" data-bs-theme="dark">
        <div class="container-fluid">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href="Controller?myBtn=redir&page=administrator.jsp">Acceuil</a>
                </li>
            </ul>
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
				<li class="nav-item dropdown">
				    <a class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">
				        Account
				    </a>
				    <ul class="dropdown-menu">
				        <li><a class="dropdown-item" href="Controller?myBtn=redir&state=pending">Pending Users</a></li>
				        <li><a class="dropdown-item" href="Controller?myBtn=redir&state=accepted">Users</a></li>
				        <li><a class="dropdown-item" href="Controller?myBtn=redir&state=available">Anouncements</a></li>
				    </ul>
				</li>
	            <li class="nav-item">
	                <a class="nav-link" href="Controller?myBtn=signOut&userId=${ session.activeUser.userId }">sign out</a>
	            </li>
            </ul>
        </div>
    </nav>
</div>
	<c:if test="${ not empty requestScope.error }">
		<div class="row">
			<div class="col">
				<div class="alert alert-warning"><c:out value="${ requestScope.error }"></c:out></div>
			</div>
		</div>
	</c:if>
	<c:if test="${ not empty requestScope.message }">
		<div class="row">
			<div class="col">
				<div class="alert alert-info"><c:out value="${ requestScope.message }"></c:out></div>
			</div>
		</div>
	</c:if>
	<c:if test="${ not empty requestScope.listUsers }">
		<div class="row mt-4">
	        <div class="col">
	            <table class="table table-bordered">
	                <tr>
	                    <th>Name</th>
	                    <th>User Name</th>
	                    <th>Address</th>
	                    <th>Number</th>
	                    <th>Role</th>
	                    <th>Details</th>
	                </tr>
	                <c:forEach var="user" items="${requestScope.listUsers}">
	                    <tr>
	                        <td><c:out value="${ user.firstName } ${ user.lastName }"></c:out></td>
	                        <td><c:out value="${ user.userName }"></c:out></td>
	                        <td><c:out value="${ user.address }"></c:out></td>
	                        <td><c:out value="${ user.number }"></c:out></td>
	                        <td><c:out value="${ user.role }"></c:out></td>
	                        <td><a href="Controller?mybtn=redir&page=getUser.jsp&userId=${ user.userId }" style="text-decoration: none;">...</a></td>
	                    </tr>
	                </c:forEach>
	            </table>
	        </div>
    	</div>
	</c:if>
	<c:if test="${ not empty requestScope.listAnn }">
		<div class="container mt-4">
			<c:forEach var="ann" items="${ requestScope.listAnn }">
				<div class="row justify-content-center">
					<div class="col-md-6 mb-4">
						<div class="card shadow-sm border-start border-4 border-info">
							<div class="card-body">
								<div class="row">
									<div class="col-9">
										<h5 class="card-title text-info fw-bold">${ann.user.userName}</h5>
									</div>
									<div class="col-3">
										<strong>Delai :</strong> <span class="btn-danger">${ann.deadline}</span>
									</div>
								</div>

								<p class="card-text">
									<strong>Description :</strong> ${ann.content}
								</p>
								<p class="card-text">
									<strong>DateC :</strong> <span class="badge bg-secondary">{ann.dateC}</span>
								</p>
								<div class="row">
									<div class="col-auto offset-9">
										<a class="btn btn-outline-info" href="Controller?myBtn=deleteAnn&annCode=${ ann.annCode }" >delete</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</c:if>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>