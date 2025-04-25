<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>