<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.12.1/font/bootstrap-icons.min.css">
    <link href="./css/administrator.css" rel="stylesheet">
</head>
<body>
<div class="sidebar">
    <div class="sidebar-content">
        <div class="sidebar-header">
            <span><img src="assets/logo.png" style="height: 110px;" class="img-fluid" alt="ZeroMiette Logo"></span>
        </div>
        <ul class="nav-menu">
            <li class="nav-item">
                <a href="Controller?myBtn=redir&page=adminDash.jsp&userId=${sessionScope.activeUser.userId }&role=${sessionScope.activeUser.role}" class="nav-link" aria-label="Home page">
                    <i class="bi bi-house"></i>
                    <span>Home page</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="Controller?myBtn=redir&page=adminProfile.jsp&userId=${sessionScope.activeUser.userId}&role=${sessionScope.activeUser.role}" class="nav-link active"  aria-label="Account">
                    <i class="bi bi-person-gear"></i>
                    <span>Profile</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="Controller?myBtn=redir&state=pending&page=getUsers.jsp&role=${sessionScope.activeUser.role}" class="nav-link pending-users" aria-label="Pending Users">
                    <span class="icon-wrapper">
                        <i class="bi bi-people-fill"></i>                    
                        <i class="bi bi-circle-fill circle-badge"></i>
                        <i class="bi bi-clock-fill clock-badge"></i>
                    </span>
                    <span>&nbsp;&nbsp;Pending Users</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="Controller?myBtn=redir&state=accepted&page=getList.jsp&role=${sessionScope.activeUser.role}" class="nav-link" aria-label="Users">
                    <i class="bi bi-people-fill"></i>
                    <span>Users</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="Controller?myBtn=redir&state=available&page=getList.jsp&role=${sessionScope.activeUser.role}" class="nav-link" aria-label="Announcements">
                    <i class="bi bi-postcard-heart"></i>
                    <span>Announcements</span>
                </a>
            </li>    
        </ul>
        <ul class="nav-menu bottom-menu">
            <li class="nav-item">
                <a href="Controller?myBtn=signOut&userId=${ session.activeUser.userId }" class="nav-link"  aria-label="Sign Out">
                    <i class="bi bi-box-arrow-right"></i>
                    <span>Sign Out</span>
                </a>
            </li>
        </ul>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>