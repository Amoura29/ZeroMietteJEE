<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ZeroMiette - Receive Dashboard</title>
    <style>
        * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  }
  
  h1, h2, h3 {
    color: #3b5e2b;
  }
  
  
  .sidebar {
    background-color: #265442;
    width: 240px;
    padding: 20px 0;
    transition: all 0.3s ease;
    position: fixed;
    top: 0;
    left: 0;
    height: 100%;
    z-index: 1000;
  }
  
  .sidebar-content {
    display: flex;
    flex-direction: column;
    height: 100%;
  }
  
  .sidebar-header {
    text-align: center;
    margin-bottom: 20px;
  }
  
  .nav-menu {
    list-style-type: none;
  }
  
  .nav-menu:not(.bottom-menu) {
    flex-grow: 0;
  }
  
  .bottom-menu {
    margin-top: auto; /* Pushes the auth menu to the bottom */
    list-style-type: none;
  }
  
  .nav-item {
    position: relative;
    margin: 5px 0;
  }
  
  .nav-link {
    display: flex;
    align-items: center;
    padding: 15px 25px;
    color: white;
    text-decoration: none;
    transition: all 0.3s ease;
    font-weight: 500;
    font-size: 13px;
  }
  
  .nav-link i.bi {
    margin-right: 10px;
    font-size: 20px;
    width: 20px;
    height: 20px;
    vertical-align: middle;
    line-height: 1;
  }
  
  .nav-link.active {
    background-color: white;
    color: #265442;
    border-top-left-radius: 30px;
    border-bottom-left-radius: 30px;
  }
  
  .nav-link.active::before {
    content: "";
    position: absolute;
    right: 0;
    top: -20px;
    height: 20px;
    width: 20px;
    background-color: transparent;
    border-bottom-right-radius: 20px;
    box-shadow: 7px 7px 0 7px white;
  }
  
  .nav-link.active::after {
    content: "";
    position: absolute;
    right: 0;
    bottom: -20px;
    height: 20px;
    width: 20px;
    background-color: transparent;
    border-top-right-radius: 20px;
    box-shadow: 7px -7px 0 7px white;
  }
  
  .content {
    flex: 1;
    margin-left: 240px;
    background-color: white;
  }
  
  
  .pending-users .icon-wrapper {
    position: relative;
    display: inline-block;
    top: -4px;
    width: 20px;
    height: 20px;
  }
  
  .pending-users .bi-people-fill {
    font-size: 20px;
  }
  
  .pending-users .clock-badge {
    position: absolute;
    bottom: -15px;
    font-size: 10px !important;
    right: -23px;
    border-radius: 50%;
    color: #2E7D32;
    line-height: 1;
  }
  
  .pending-users .circle-badge {
    position: absolute;
    bottom: -15px;
    right: -23px;
    font-size: 10px !important;
    border-radius: 50%;
    color: white;
    line-height: 1;
  }
  
  .nav-link.active .clock-badge{
    color: white !important;
  }
  
  .nav-link.active .circle-badge{
    color: #2E7D32 !important;
  }
  .card {
  
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    margin-bottom: 20px;
    border: 2px solid #1f4d36; 
 }
  
 
 .card-img-top {
    width: 100%;
    height: auto;
    border-radius: 8px 8px 0 0; 
}
  
 
.card-body {
    background-color: #f8f9f6; 
    padding: 20px;
    border-radius: 0 0 8px 8px;
}
  
  
.card-title {
    font-size: 20px;
    font-weight: bold;
    color: #1f4d36; 
    margin-bottom: 10px;
} 
 
.btn-danger {
    background-color: #dc3545;
    border-color: #dc3545;
    color: #fff;
}

.btn-danger:hover {
    background-color: #c82333;
    border-color: #bd2130;
}

.card-text strong {
    color: #1f4d36; 
}
  
.card-text {
    font-size: 14px;
    color: #555; 
}
  
  
.btn-outline-danger {
    border-color: #721c24;
    color: #721c24;
    padding: 8px 12px;
    font-size: 14px;
    border-radius: 5px;
}
  
.btn-outline-danger:hover {
    background-color: #721c24;
    color: white;
}
  
.row.mb-3 {
    margin-bottom: 15px;
} 
  @media (max-width: 768px) {
  
    .sidebar {
      width: 90px;
    }
    
    .nav-link span {
      display: none;
    }
    
    .nav-link i.bi {
      margin-right: 0;
      font-size: 24px;
    }
  
    .content {
      margin-left: 90px;
    }
  
    .pending-users .clock-badge {
        position: absolute;
        bottom: -15px;
        right: -19px;
        font-size: 12px !important;
    }
  
    .pending-users .circle-badge {
        position: absolute;
        bottom: -15px;
        font-size: 12px !important;
        right: -19px;
      }
  
    .nav-menu.hidden {
      display: none;
    }
  
    .nav-menu.block {
      display: block;
    }
  
    .bottom-menu {
      margin-top: auto;
    }
    .card-body {
        padding: 15px;
    }
  
    .btn {
        font-size: 12px;
        padding: 6px 10px;
    }
  }
   
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>
    <form action="Controller"   method="post">
    <div class="sidebar">
    <div class="sidebar-content">
        <div class="sidebar-header">
            <span><img src="C:/Users/ASUS/OneDrive/Bureau/logo.png" style="height: 110px;" class="img-fluid" alt="ZeroMiette Logo"></span>
        </div>
        <ul class="nav-menu">
            <li class="nav-item">
                <a href="Controller?myBtn=Announcements" class="nav-link" >
                    <i class="bi bi-house"></i>
                    <span>Home page</span>
                </a>
            </li>
            <li class="nav-item">
                    <a href="Controller?myBtn=requests" class="nav-link pending-users">
                        <span class="icon-wrapper">
                            <i class="bi bi-file-fill"></i>                    
                            <i class="bi bi-circle-fill circle-badge"></i>
                            <i class="bi bi-clock-fill clock-badge"></i>
                        </span>
                        <span>&nbsp;&nbsp;My requests</span>
                    </a>
                </li>
            
              <li class="nav-item">
                    <a href="Controller?myBtn=account" class="nav-link">
                        <i class="bi bi-person-gear"></i>
                        <span>Account</span>
                    </a>
                </li>   
        </ul>
        <ul class="nav-menu bottom-menu">
            <li class="nav-item">
                <a href="Controller?myBtn=signOut" class="nav-link">
                    <i class="bi bi-box-arrow-right"></i>
                    <span>Sign Out</span>
                </a>
            </li>
        </ul>
    </div>
    </div>
    <div class="content">
      	<c:if test="${not empty requestScope.error}">
	        <div class="row">
	            <div class="col-auto mt-2">
	                <span class="text-danger">
					   <c:out value="${requestScope.error}"></c:out>
					</span>
	            </div>
	        </div>
        </c:if>
        <c:if test="${not empty requestScope.ann}">
    <div class="container">
        <div class="row justify-content-center mb-4">
            <c:forEach var="ann" items="${requestScope.ann}">
                <div class="col-md-6">
                    <div class="card" style="width: 50%; max-width: 500px;">
                        <img src="https://media.istockphoto.com/id/1144823591/photo/spaghetti-in-a-dish-on-a-white-background.jpg?s=612x612&w=0&k=20&c=SeEWmJfPQlX1zVUHPKjL-cgYeMs9cZ97-kdZMm7feA4=" 
                             class="card-img-top" 
                             alt="Image de l'annonce" 
                             style="height: 200px; object-fit: cover;">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-7">
                                    <h5 class="card-title" style="color: #380303;">
                                        <c:out value="${ann.title}"/>
                                    </h5>
                                </div>
                                <div class="col-5 text-end">
                                    <strong style="color: #1f4d36;">Délai :</strong>
                                    <span style="color: #570505;">
                                        <c:out value="${ann.deadline}"/>
                                    </span>
                                </div>
                            </div>
                            <div class="row"><div class="col"><strong style="color: #1f4d36;">Catégorie :</strong> <c:out value="${ann.category}"/></div></div>
                            <div class="row"><div class="col"><strong style="color: #1f4d36;">Description :</strong> <c:out value="${ann.content}"/></div></div>
                            <div class="row"><div class="col"><strong style="color: #1f4d36;">Quantité :</strong> <c:out value="${ann.quantity}"/></div></div>
                            <div class="row"><div class="col"><strong style="color: #1f4d36;">Date de création :</strong> <c:out value="${ann.dateC}"/></div></div>
                            <div class="row"><div class="col-6"> </div><a href="Controller?myBtn=addrequest&annCode=${ann.annCode}" class="nav-link" >Send request</div>
                            
                            
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</c:if>
        <c:if test="${not empty requestScope.error}">
	        <div class="row">
	            <div class="col-auto mt-2">
	                <span class="text-danger">
					   <c:out value="${requestScope.error}"></c:out>
					</span>
	            </div>
	        </div>
        </c:if>
        
     
        <c:if test="${not empty requestScope.reqs}">        	
	    	<div class="row justify-content-center">
			  <c:forEach var="req" items="${requestScope.reqs}">
			    <div class="col-md-5 mx-2 mb-4">
			      <div class="card shadow-sm">
			        <div class="card-body">
			          
			          <h5 class="card-title text-primary">
			            <strong>Annonce : </strong> <c:out value="${req.announcement.title}" />
			          </h5>
			          <h6 class="card-subtitle mb-2 text-muted">
			            <strong>Donateur : </strong> <c:out value="${req.announcement.user.userName}" />
			          </h6>
			          <p class="card-text">
			            <strong>Description :</strong> <c:out value="${req.description}" /><br/>
			            <strong>Quantité :</strong> <c:out value="${req.quantity}" /><br/>
			            <strong>Date de création :</strong> <c:out value="${req.dateC}" />
			          </p>
			          <div class="row">
			          
			            <form action="Controller" method="post" class="me-2">
			            
			              <button type="submit" name="action" value="updateRequest" class="btn btn-warning btn-sm">Modifier</button>
			            </form>
			            <form action="Controller" method="post">
			              <button type="submit" name="action" value="deleteRequest" class="btn btn-danger btn-sm">Supprimer</button>
			            </form>
			          
			          </div>
			          
			        </div>
			      </div>
			    </div>
			  </c:forEach>
			</div>
        	
        </c:if>
      
     
    </div>
    
    
    
    </form>

 </body>
</html>  
