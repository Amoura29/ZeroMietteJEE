<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Authenticate</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.12.1/font/bootstrap-icons.min.css">
	<link href="./css/authenticate.css" rel="stylesheet">
</head>
<body>
	<nav class="navbar custom-navbar sticky-top" style="background-color: white;" data-bs-theme="light">
        <div class="container-fluid">
            <a class="navbar-brand mb-2 mb-lg-0" href="index.jsp">
                <img src="assets/logo.ico" alt="ZeroMiette Icon" class="brand-icon">ZeroMiette
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a href="index.jsp" class="nav-link" aria-label="Home page">
                            <i class="bi bi-house"></i>
                            <span> Home page</span>
                        </a>
                    </li>
                </ul>
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a href="authenticate.jsp" class="nav-link active" style="margin-right: 20px;" aria-label="Sign In">
                            <i class="bi bi-box-arrow-in-right"></i>
                            <span> Sign In</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="CreateAccount.jsp" class="nav-link" aria-label="Sign Up">
                            <i class="bi bi-person-plus"></i>
                            <span>Sign Up</span>
                        </a>
                    </li>
                </ul>
          </div>
        </div>
    </nav>
	<div class="container-fluid py-5">
        <div class="row justify-content-center mb-2">
            <div class="col-auto">
                <img src="assets/logo.ico" alt="ZeroMiette Icon" style="height: 4.2rem;" class="mb-2">
            </div>
        </div>
        <div class="row">
            <div class="col text-center">
                <h3 style="color: #3b5e2b;">Welcome back to ZeroMiette</h3>
            </div>
        </div>
        <div class="row">
            <div class="col mb-4 text-center">
                <span style="color: #424242;font-size: larger;">Sign in to you account</span>
            </div>
        </div>
        <div class="row justify-content-center mt-4">
            <div class="col-8 col-lg-5">
                <div class="card shadow-sm">
                    <div class="card-body p-4">

                        <c:if test="${not empty requestScope.error}" >
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                              ${requestScope.error}
                              <button type="button" class="btn-close" aria-label="Close" style="font-size: 13px;"></button>
                            </div>
                        </c:if>

                        <form action="./Controller" method="post" class="was-validated"  >
                            <div class="mb-3">
                                <div class="form-floating">
                                    <input type="email" name="email" id="email" class="form-control" placeholder="" required /> 
                                    <label for="email" style="font-size: 20px;">
                                        <i class="bi bi-person"></i> Enter your email
                                    </label> 
                                    <span class="empty-feedback">
                                            Email is required.
                                    </span>
                                    <span class="inval-feedback">
                                            Please enter a valid email address.
                                    </span>
                                </div>
                            </div>    
                            <div class="mb-3"> 
                                <div class="form-floating">
                                    <input type="password" name="password" id="password" class="form-control" min="6" placeholder="" required /> 
                                    <label class="form-label" for="password" style="font-size: 20px;">
                                        <i class="bi bi-lock"></i> Enter your password 
                                    </label> 
                                    <span class="empty-feedback">
                                            Password is required.
                                    </span>
                                    <span class="inval-feedback">
                                    	Password must be at least 6 characters long.
                                    </span>
                                </div>
                            </div>

                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <div class="form-check">
                                  <input type="checkbox" id="rememberMe" class="form-check-input" name="rememberMe">
                                  <label for="rememberMe" class="form-check-label">Remember Me</label>
                                </div>
                                <a href="forgot-password.jsp" style="text-decoration: none;">Forgot Password?</a>
                            </div>

                            <input type="submit" class="btn btn-primary text-white w-100" style="font-size: 32px;font-weight: 600;" value="sign in" name="myBtn">

                            <div class="text-center mt-3">
                                <p>Don't have an account? <a href="CreateAccount.jsp" style="text-decoration: none;">Sign Up</a></p>
                            </div>
                        </form>     
                    </div>
                </div>
            </div>    
        </div>   
    </div>
</body>
</html>