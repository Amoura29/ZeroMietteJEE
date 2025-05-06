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
        <form action="Controller" class="was-validated" method="post" enctype="multipart/form-data">
            <div class="row justify-content-center mt-5">
                <div class="col-auto">
                    <div class="row">
                        <div class="col shadow rounded bg-light">
                            <div class="row">
                                <div class="col p-3 bg-primary text-white">
                                    <h1 class="text-center">Create Account</h1>
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