<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="row">
    <nav class="navbar bg-primary navbar-expand" data-bs-theme="dark">
        <div class="container-fluid">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Acceuil</a>
                </li>
            </ul>
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
				<li class="nav-item dropdown">
				    <a class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">
				        Account
				    </a>
				    <ul class="dropdown-menu">
				        <li><a class="dropdown-item" href="pendingUsers.jsp">Pending Users</a></li>
				        <li><a class="dropdown-item" href="getAllUsers.jsp">Users</a></li>
				        <li><a class="dropdown-item" href="getAllAnnouncements.jsp">Anouncements</a></li>
				    </ul>
				</li>
	            <li class="nav-item">
	                <a class="nav-link" href="Controller?myBtn=signOut&userId=${ session.activeUser.userId }">sign out</a>
	            </li>
            </ul>
        </div>
    </nav>
</div>

</body>
</html>