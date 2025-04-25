<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
        <form class="was-validated" action="Controller" method="post">
            <div class="row justify-content-center mt-5">
                <div class="col-6">
                    <div class="row">
                        <div class="col shadow rounded bg-light">
                            <div class="row">
                                <div class="col mt-5">
                                    <div class="form-floating">
                                        <input type="email" name="email" id="email" class="form-control" placeholder="" required /> 
                                        <label for="email" style="font-size: 20px;">
                                            <i class="bi bi-person"></i> Enter your email
                                        </label> 
                                        <span class="invalid-feedback">required field</span>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col mt-4">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="un" name="un" placeholder="" required>
                                        <label for="un" class="form-label">User name</label>
                                        <span class="invalid-feedback">required field</span>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col mt-4">
                                    <div class="form-floating">
                                        <input type="password" name="password" id="password" class="form-control" placeholder="" required /> 
                                        <label class="form-label" for="password" style="font-size: 20px;">
                                            <i class="bi bi-lock"></i> Enter password 
                                        </label> 
                                        <span class="invalid-feedback">required field</span>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col mt-4">
                                    <div class="form-floating">
                                        <input type="password" name="password1" id="password" class="form-control" placeholder="" required /> 
                                        <label class="form-label" for="password" style="font-size: 20px;">
                                            <i class="bi bi-lock"></i> Confirm password 
                                        </label> 
                                        <span class="invalid-feedback">required field</span>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col mt-1">
                                    <c:out value="${requestScope.error}"></c:out>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col mt-4 ">
                                    <input type="submit" name="myBtn" class="btn btn-primary text-white w-100" style="font-size: 32px;font-weight: 600;" value="first sign in">
                                </div>
                            </div>        
                        </div>
                    </div>
                </div>    
            </div>
        </form>
    </div>
</body>
</html>