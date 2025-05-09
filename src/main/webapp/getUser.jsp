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
	<c:if test="${ not empty requestScope.user }">
		<div class="row mt-4">
			<div class="col">
				<div class="row justify-content-center">
					<div class="col-auto">
                		<div class="row mt-4">
                        	<div class="col-auto">
                        		<h2>Name: </h2>
			                </div>
			                <div class="col mt-2">
			                    <span><c:out value="${ requestScope.user.firstName } ${ requestScope.user.lastName }"></c:out></span>
			                </div>
			            </div>
			            <div class="row">
			                <div class="col-auto">
			                    <h2>User name: </h2>
			                </div>
			                <div class="col mt-2">
			                    <span><c:out value="${ requestScope.user.userName }"></c:out></span>
			                </div>
			            </div>
			            <c:if test="${ not empty requestScope.user.description }">
				            <div class="row">
				                <div class="col-auto">
				                    <h2>Description: </h2>
				                </div>
				                <div class="col mt-2">
				                    <p><c:out value="${ requestScope.user.description }"></c:out></p>
				                </div>
				            </div>
			            </c:if>
			            <div class="row">
			                <div class="col-auto">
			                    <h2>Email: </h2>
			                </div>
			                <div class="col mt-2">
			                    <span><c:out value="${ requestScope.user.email }"></c:out></span>
			                </div>
			            </div>
			            <div class="row">
			                <div class="col-auto">
			                    <h2>Region: </h2>
			                </div>
			                <div class="col mt-2">
			                    <span><c:out value="${ requestScope.user.region }"></c:out></span>
			                </div>
			            </div>
			            <div class="row">
			                <div class="col-auto">
			                    <h2>Address: </h2>
			                </div>
			                <div class="col mt-2">
			                    <span><c:out value="${ requestScope.user.address }"></c:out></span>
			                </div>
			            </div>
			            <div class="row">
			                <div class="col-auto">
			                    <h2>Number: </h2>
			                </div>
			                <div class="col mt-2">
			                    <span><c:out value="${ requestScope.user.number }"></c:out></span>
			                </div>
			            </div>
			            <div class="row">
			                <div class="col-auto">
			                    <h2>Role: </h2>
			                </div>
			                <div class="col mt-2">
			                    <span><c:out value="${ requestScope.user.role }"></c:out></span>
			                </div>
			            </div> 
			            <c:if test="${ not empty requestScope.user.proof}">
			                <div class="row">
			                    <div class="col-auto">
			                            <h2>Proof: </h2>   
			                    </div>
			                </div>
			                <c:choose>
				                <c:when test="${ requestScope.extention =='pdf' }">
				                    <div class="row">
				                        <div class="col">
				                            <iframe src="${ requestScope.user.proof }" width="100%" height="600px" type="application/pdf"></iframe>
				                        </div>
				                    </div>
				                </c:when>
				                <c:otherwise>
				                	<div class="row">
				                        <div class="col">
				                            <img src="${ requestScope.user.proof }" alt=""/>
				                        </div>
				                    </div>
				                </c:otherwise>
			                </c:choose>
            			</c:if>
			            <c:choose>
				            <c:when test="${ requestScope.user.state =='pending' }">
				                <div class="row mt-2 justify-content-center">
				                    <div class="col-auto">
				                        <a class="btn btn-success" href="Controller?myBtn=changeState&userId=${ requestScope.user.userId }" >Accepter</a>
				                    </div>
				                    <div class="col-auto">
				                        <a class="btn btn-danger" href="Controller?myBtn=deleteUser&userId=${ requestScope.user.userId }&state=pending" >Refuser</a>
				                    </div>
				                    <div class="col-auto">
				                        <a class="btn btn-secondary" href="Controller?myBtn=redir&state=pending" >Annuler</a>
				                    </div>
				                </div>
				            </c:when>
				            <c:otherwise>
				                <div class="row mt-2 justify-content-center">
				                    <div class="col-auto">
				                        <a class="btn btn-danger" href="Controller?myBtn=deleteUser&userId=${ requestScope.user.userId }&state=accepted" >Delete</a>
				                    </div>
				                    <div class="col-auto">
				                        <a class="btn btn-secondary" href="Controller?myBtn=redir&state=accepted">Annuler</a>
				                    </div>
				                </div>
				        	</c:otherwise>
					 	</c:choose>
   					 </div>
   				</div>        
	        </div>
    	</div>
	</c:if>
</body>
</html>