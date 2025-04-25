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
                <li class="nav-item">
                    <a class="nav-link" href="/User/Authenticate/SignIn">sign in</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/User/CreateAccount/SignUp">sign up</a>
                </li>
            </ul>
        </div>
    </nav>
</div>
<router-outlet></router-outlet> 
</body>
</html>