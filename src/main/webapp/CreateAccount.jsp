<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Create Account</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
    	<div class="container-fluid py-5">
        <div class="row justify-content-center mb-2">
            <div class="col-auto">
                <img src="assets/logo.ico" alt="ZeroMiette Icon" class="brand-icon mb-2">
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
                        @if (error) {
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                {{ error }}
                                <button type="button" class="btn-close" aria-label="Close" style="font-size: 13px;"></button>
                            </div>
                        }
                        <form action="Controller" class="was-validated" method="post" enctype="multipart/form-data">
                            <div class="row">
                                <div class="col">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="fn" name="fn" placeholder="" required minlength="2">
                                        <label for="fn" class="form-label">First name</label>
                                        <span class="invalid-feedback">
                                            @if (firstName?.errors?.['required']) {
                                                Last name is required.
                                            } @else if (firstName?.errors?.['minlength']) {
                                                Last name must be at least 2 characters long.
                                            }
                                        </span>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-floating">					
                                            <input type="text" class="form-control" id="ln" name="ln" placeholder="" required minlength="2"> 
                                            <label for="ln" class="form-label">Last name</label>
                                            <span class="invalid-feedback">
                                                @if (lastName?.errors?.['required']) {
                                                    First name is required.
                                                } @else if (lastName?.errors?.['minlength']) {
                                                    First name must be at least 2 characters long.
                                                }
                                            </span>
                                    </div>                                    
                                </div>                                               
                            </div>
                            <div class="row">
                                <div class="col mt-4">
                                    <div class="form-floating">
                                        <input type="email" class="form-control" id="mai" placeholder="" name="mai" required>
                                        <label for="mai" class="form-label">Email</label>
                                        <span class="invalid-feedback">
                                            @if (email?.errors?.['required']) {
                                                Email is required.
                                            } @else if (email?.errors?.['email']) {
                                                Please enter a valid email address.
                                            }
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
                                        <span class="invalid-feedback">
                                            @if (region?.errors?.['required']) {
                                                Region is required.
                                            }
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md mt-4">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="add" name="add" placeholder="" required>
                                        <label for="add" class="form-label">Address</label>
                                        <span class="invalid-feedback">
                                            @if (address?.errors?.['required']) {
                                                Address is required.
                                            }
                                        </span>
                                    </div>
                                </div>
                                <div class="col-md-auto mt-4">
                                    <div class="form-floating">
                                        <input type="tel" class="form-control" id="num" name="num" placeholder="" pattern="[2459]{1}[0-9]{7}" maxlength="8" required>
                                        <label for="num" class="form-label">Phone number</label>
                                        <span class="invalid-feedback">
                                            @if (number?.errors?.['required']) {
                                                <span>Phone number is required.</span>
                                            } @else if (number?.errors?.['pattern']) {
                                                <span>Please enter a valid 8-digit phone number.</span>
                                            }
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col mt-4">
                                    <label for="">Role :&nbsp;&nbsp;</label>
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
                                    <span class="invalid-feedback">
                                        @if (role?.errors?.['required']) {
                                            Role is required.
                                        }
                                    </span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <label for="proof"></label>
                                    <input type="file" class="form-control" id="proof" required>
                                    <span class="invalid-feedback">Proof is required.</span>
                                    <span class="invalid-feedback">
                                        @if (proof?.errors?.['required']) {
                                            Role is required.
                                        }
                                    </span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col mt-4 mb-4">
                                    <textarea class="form-control" placeholder="Write something about yourself ..." name="desc"></textarea>
                                </div>
                            </div>
                            <input type="submit" class="btn btn-primary w-100" style="font-size: 32px;font-weight: 600;" value="sign up">
                            <div class="text-center mt-3">
                                <p>Already have an account? <a href="authenticate.jsp" style="text-decoration: none;">Sign in</a></p>
                            </div>
                        </form>
                    </div>        
                </div>        
            </div>
        </div>
    </div>
}@else if (mess=="Would you please wait till your account creation get accepted by the admin") {
<div class="row d-flex justify-content-center align-items-center vh-100">
    <div class="col-5">
        <div class="alert alert-success">
            <strong>{{mess}}</strong>
        </div>
    </div>
</div>
}@else {
    <div class="row d-flex justify-content-center align-items-center vh-100">
        <div class="col-5">
            <div class="alert alert-danger">
                <strong>{{mess}}</strong> would you like to try again??&nbsp;&nbsp;
                <a class="btn btn-success"  href="CreateAccount.jsp">&nbsp;Yes&nbsp;</a>&nbsp;&nbsp;&nbsp;
                <a class="btn btn-secondary" href="index.jsp">&nbsp;No&nbsp;</a>
            </div>
        </div>
    </div>
        
                            <div class="row">
                                <div class="col mt-5">
                                    <div class="form-floating">					
                                        <input type="text" class="form-control" id="ln" name="ln" placeholder="" required> 
                                        <label for="ln" class="form-label">Last name</label>
                                        <span class="invalid-feedback">required field</span>
                                    </div>
                                </div>
                                <div class="col mt-5">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="fn" name="fn" placeholder="" required>
                                        <label for="fn" class="form-label">First name</label>
                                        <span class="invalid-feedback">required field</span>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col mt-4">
                                    <div class="form-floating">
                                        <input type="email" class="form-control" id="mai" placeholder="" name="mai" required>
                                        <label for="mai" class="form-label">Email</label>
                                        <span class="invalid-feedback">required field</span>
                                    </div>
                                </div>
                                <div class="col-md-4 mt-4">
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
                                            <option value="Kef">Kef</option>
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
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col mt-4">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="add" name="add" placeholder="" required>
                                        <label for="add" class="form-label">Address</label>
                                        <span class="invalid-feedback">required field</span>
                                    </div>
                                </div>
                                <div class="col-auto mt-4">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="num" name="num" placeholder="" pattern="[1-9]{1}[0-9]{7}" maxlength="8" required>
                                        <label for="num" class="form-label">Phone number</label>
                                        <span class="invalid-feedback">required field</span>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col mt-4">
                                    <label for="">Role :</label>
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
                                </div>
                            </div>
                            <div class="row">
                                <div class="col mt-2">
                                    <label for="proof"></label>
                                    <input type="file" class="form-control" name="proof" id="proof" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col mt-4">
                                    <textarea class="form-control" placeholder="Write something about you ..." name="desc"></textarea>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col mt-4 ">
                                    <input type="submit" name="myBtn" class="btn btn-primary w-100" style="font-size:  32px;font-weight: 600;" value="signUp">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>