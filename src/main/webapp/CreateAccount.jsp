<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Create Account</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.12.1/font/bootstrap-icons.min.css">
        <link href="./css/CreateAccount.css" rel="stylesheet">
    </head>
	<body>
	<nav class="navbar custom-navbar sticky-top" style="background-color: white;" data-bs-theme="light">
        <div class="container-fluid">
            <a class="navbar-brand mb-2 mb-lg-0" href="index.jsp">
                <img src="assets/logo.ico" alt="ZeroMiette Icon" style="height: 2.2rem;" class="brand-icon">ZeroMiette
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a href="index.jsp" class="nav-link active"  aria-label="Home page">
                            <i class="bi bi-house"></i>
                            <span> Home page</span>
                        </a>
                    </li>
                </ul>
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a href="authenticate.jsp" class="nav-link" style="margin-right: 20px;" aria-label="Sign In">
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
                <h3 style="color: #3b5e2b;">Create a ZeroMiette Account</h3>
            </div>
        </div>
        <div class="row">
            <div class="col mb-4 text-center">
                <span style="color: #424242;font-size: larger;">Join our community to fight food waste</span>
            </div>
        </div>       
        <div class="row justify-content-center mt-4">
            <div class="col-md-8 col-lg-6">
                <div class="card shadow-sm">
                    <div class="card-body p-4">
                        <c:if test="${not empty requestScope.error }">
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                ${ requestScope.error }
                                <button type="button" class="btn-close" aria-label="Close" style="font-size: 13px;"></button>
                            </div>
                        </c:if>
                        <c:if test="${not empty requestScope.mess }">
                        	<div class="alert alert-success">
                                <div class="col">
                                    <strong>${requestScope.mess}</strong> 
                                </div>            
                                <div class="col-auto">
                                    <button type="button" class="btn-close" aria-label="Close" style="font-size: 13px;"></button>
                                </div> 
                            </div>
                        </c:if>
                        <form action="Controller" class="was-validated" method="post" enctype="multipart/form-data">
                            <div class="row">
                                <div class="col">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="fn" name="fn" placeholder="" required min="2">
                                        <label for="fn" class="form-label">First name</label>
                                        <span class="empty-feedback">
                                        	First name is required.
                                        </span>
                                        <span class="inval-feedback">
                                        	First name must be at least 2 characters long.
                                        </span>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-floating">					
                                            <input type="text" class="form-control" id="ln" name="ln" placeholder="" required min="2"> 
                                            <label for="ln" class="form-label">Last name</label>
                                            <span class="empty-feedback">
                                        	last name is required.
	                                        </span>
	                                        <span class="inval-feedback">
	                                        	last name must be at least 2 characters long.
	                                        </span> 
                                    </div>                                    
                                </div>                                               
                            </div>
                            <div class="row">
                                <div class="col mt-4">
                                    <div class="form-floating">
                                        <input type="email" class="form-control" id="mai" placeholder="" name="mai" required>
                                        <label for="mai" class="form-label">Email</label>
                                        <span class="empty-feedback">
                                        	Email is required.
                                        </span>
                                        <span class="inval-feedback">
                                        	Please enter a valid email address(e.g. you@exemple.com).
                                        </span>
                                    </div>
                                </div>
                                <div class="col-4 mt-4">
                                    <div class="form-floating">
                                        <select name="region" id="region" class="form-select" required>
                                            <option value="Tunis">Tunis</option>
                                            <option value="Ariana">Ariana</option>
                                            <option value="Ben Arous">Ben Arous</option>
                                            <option value="Manouba">Manouba</option>
                                            <option value="Nabeul">Nabeul</option>
                                            <option value="Zaghouan">Zaghouan</option>
                                            <option value="Bizerte">Bizerte</option>
                                            <option value="Beja">Beja</option>
                                            <option value="Jendouba">Jendouba</option>
                                            <option value="Kef">Le Kef</option>
                                            <option value="Siliana">Siliana</option>
                                            <option value="Kairouan">Kairouan</option>
                                            <option value="Kasserine">Kasserine</option>
                                            <option value="Sidi_Bouzid">Sidi Bouzid</option>
                                            <option value="Sfax">Sfax</option>
                                            <option value="Mahdia">Mahdia</option>
                                            <option value="Monastir">Monastir</option>
                                            <option value="Sousse">Sousse</option>
                                            <option value="Gafsa">Gafsa</option>
                                            <option value="Tozeur">Tozeur</option>
                                            <option value="Kebili">Kebili</option>
                                            <option value="Medenine">Medenine</option>
                                            <option value="Tataouine">Tataouine</option>
                                            <option value="Gabes">Gabes</option>
                                        </select>
                                        <label for="region">Choose a region</label>
                                        <span class="inval-feedback">
                                                Region is required.
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md mt-4">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="add" name="add" placeholder="" required>
                                        <label for="add" class="form-label">Address</label>
                                        <span class="inval-feedback">
                                                Address is required.
                                        </span>
                                    </div>
                                </div>
                                <div class="col-md-auto mt-4">
                                    <div class="form-floating">
                                        <input type="tel" class="form-control" id="num" name="num" placeholder="" pattern="[2459]{1}[0-9]{7}" maxlength="8" required>
                                        <label for="num" class="form-label">Phone number</label>
                                        <span class="empty-feedback">
                                             Phone number is required.
                                        </span>
                                        <span class="inval-feedback">
                                             Please enter a valid 8-digit phone number.
                                         </span>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col mt-4">
                                    <label>Role :&nbsp;&nbsp;</label>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input"  type="radio" name="rad" value="donor" id="don" required>
                                        <label class="form-check-label" for="don">
                                            donor
                                        </label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="rad" value="reciever" id="res">
                                        <label class="form-check-label" for="res">
                                            reciever
                                        </label>
                                    </div> 
                                    <span class="inval-feedback">
                                        Role is required.
                                    </span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <label for="proof"></label>
                                    <input type="file" class="form-control" id="proof" required>
                                    <span class="invalid-feedback">Proof is required.</span>
                                    <span class="inval-feedback">
                                            Role is required.
                                    </span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col mt-4 mb-4">
                                    <textarea class="form-control" placeholder="Write something about yourself ..." name="desc"></textarea>
                                </div>
                            </div>
                            <input type="submit" class="btn btn-primary text-white w-100" style="font-size: 32px;font-weight: 600;" name="myBtn" value="sign up">
                            <div class="text-center mt-3">
                                <p>Already have an account? <a href="authenticate.jsp" style="text-decoration: none;">Sign in</a></p>
                            </div>
                        </form>
                    </div>        
                </div>        
            </div>
        </div>
    </div>
</body>
</html>