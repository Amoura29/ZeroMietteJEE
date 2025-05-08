<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ZeroMiette - Receiver Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            display: flex;
            min-height: 100vh;
            background-color: white;
        }

        .sidebar {
            background-color: #265442; /* Couleur de la sidebar */
            width: 240px;
            padding: 20px 0;
            position: fixed;
            top: 0;
            left: 0;
            height: 100vh; /* Assure que la sidebar couvre toute la hauteur */
            transition: all 0.3s ease;
        }

        .sidebar-header {
            padding: 20px;
            text-align: center;
            color: rgb(220, 216, 206);
            font-weight: bold;
            font-size: 24px;
            margin-bottom: 20px;
        }

        .sidebar-menu {
            list-style-type: none;
        }

        .sidebar-item {
            position: relative;
            margin: 5px 0;
        }

        .sidebar-link {
            display: flex;
            align-items: center;
            padding: 15px 20px;
            color: white;
            text-decoration: none;
            transition: all 0.3s ease;
            font-weight: 500;
            font-size: 13px;
        }

        .sidebar-link i {
            margin-right: 8px;
            font-size: 18px;
        }

        .sidebar-link:hover {
            background-color: #4f8c6f; /* Changer couleur au survol */
        }

        .sidebar-link.active {
            background-color: #f0f2f5;
            color: #265442;
            border-top-left-radius: 30px;
            border-bottom-left-radius: 30px;
        }

        .sidebar-link.active::before {
            content: "";
            position: absolute;
            right: 0;
            top: -20px;
            height: 20px;
            width: 20px;
            background-color: transparent;
            border-bottom-right-radius: 20px;
            box-shadow: 7px 7px 0 7px #f0f2f5;
        }

        .sidebar-link.active::after {
            content: "";
            position: absolute;
            right: 0;
            bottom: -20px;
            height: 20px;
            width: 20px;
            background-color: transparent;
            border-top-right-radius: 20px;
            box-shadow: 7px -7px 0 7px #f0f2f5;
        }

        .content {
            margin-left: 240px; /* Pour laisser place à la sidebar */
            flex: 1;
            padding: 20px;
            background-color:white ;
        }

        .page {
            display: none;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        }

        .page.active {
            display: block;
        }

        .card {
            margin-bottom: 20px;
        }

        .card-header {
            background-color: #1f4d36;
            color: white;
        }

        .btn-danger, .btn-warning {
            font-size: 14px;
        }

        @media (max-width: 768px) {
            .sidebar {
                width: 70px;
            }

            .sidebar-link span {
                display: none;
            }

            .sidebar-link i {
                margin-right: 0;
            }
        }
    </style>
</head>
<body>
    <form action="Controller" method="post">
        <div class="sidebar">
            <div class="text-center">
                <img src="images/logo.png" alt="Logo" style="width: 100px; height: auto;">
            </div>
            <div class="sidebar-header">
                <span>ZeroMiette</span>
            </div>
            <ul class="sidebar-menu">
                <li class="sidebar-item">
                    <a href="Controller?myBtn=Announcements" class="sidebar-link" data-page="Announcements">
                        <i class="fas fa-home"></i>
                        <span>Announcements</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="Controller?myBtn=requests" class="sidebar-link" data-page="Requests">
                        <i class="fas fa-list"></i>
                        <span>My Requests</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="Controller?myBtn=account" class="sidebar-link" data-page="myProfileSettings">
                        <i class="fa-solid fa-user"></i>
                        <span>Account</span>
                    </a>
                </li>
                <li class="sidebar-item bottom-menu">
                    <a href="Controller?myBtn=signOut" class="sidebar-link" data-page="myProfileSettings">
                        <i class="fa-solid fa-sign-out-alt"></i>
                        <span>Sign Out</span>
                    </a>
                </li>
            </ul>
        </div>

       <div class="content">
            <%-- MESSAGES D’ERREUR --%>
            <c:if test="${not empty requestScope.error}">
                <div class="alert alert-danger">${requestScope.error}</div>
            </c:if>

            <%-- SECTION: My Requests --%>
            <div id="myRequests" class="page active">
                <c:if test="${not empty requestScope.reqs}">
                    <h3 class="mb-3 text-primary">My Requests</h3>
                    <div class="row">
                        <c:forEach var="req" items="${requestScope.reqs}">
                            <div class="col-md-6">
                                <div class="card">
                                    <div class="card-header">
                                        Annonce: ${req.announcement.title}
                                    </div>
                                    <div class="card-body">
                                        <p class="card-text">
                                            <strong>Donor:</strong> ${req.announcement.user.userName}<br>
                                            <strong>Description:</strong> ${req.description}<br>
                                            <strong>Quantity:</strong> ${req.quantity}<br>
                                            <strong>Date:</strong> ${req.dateC}
                                        </p>
                                        <div class="d-flex gap-2">
                                            <form action="Controller" method="post">
                                                <input type="hidden" name="reqId" value="${req.reqId}">
                                                <button type="submit" name="action" value="updateRequest" class="btn btn-warning">Modify</button>
                                            </form>
                                            <form action="Controller" method="post">
                                                <input type="hidden" name="reqId" value="${req.reqId}">
                                                <button type="submit" name="action" value="deleteRequest" class="btn btn-danger">Delete</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>
            </div>

            <%-- SECTION: Available Announcements --%>
            <div id="Announcements" class="page active">
                <!-- Vérification de la présence des annonces -->
                <c:if test="${not empty requestScope.ann}">
                    <h3 class="mb-3 text-success">Available Announcements</h3>
                    <div class="row">
                        <c:forEach var="ann" items="${requestScope.ann}">
                            <div class="col-md-6">
                                <div class="card">
                                    <img src="https://media.istockphoto.com/id/1144823591/photo/spaghetti-in-a-dish-on-a-white-background.jpg?s=612x612&w=0&k=20&c=SeEWmJfPQlX1zVUHPKjL-cgYeMs9cZ97-kdZMm7feA4="  class="card-img-top" alt="Image">
                                    <div class="card-body">
                                        <h5 class="card-title">${ann.title}</h5>
                                        <p class="card-text">
                                            <strong>Category:</strong> ${ann.category} <br>
                                            <strong>Description:</strong> ${ann.content}<br>
                                            <strong>Location:</strong> ${ann.location}
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>
               
            </div>
        </div>
    </form>
</body>
</html>