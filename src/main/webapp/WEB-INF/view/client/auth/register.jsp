<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8" />
                    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                    <meta name="description" content="Lê Minh Tiến- Dự án laptopshop" />
                    <meta name="author" content="Lê Minh Tiên" />
                    <title>User</title>

                    <link href="/css/styles.css" rel="stylesheet" />
                    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                        crossorigin="anonymous"></script>
                </head>

                <body>
                    <section class="vh-100" style="background-color: #eee;">
                        <div class="container h-100">
                            <div class="row d-flex justify-content-center align-items-center h-100">
                                <div class="col-lg-12 col-xl-11">
                                    <div class="card text-black" style="border-radius: 25px;">
                                        <div class="card-body p-md-5">
                                            <div class="row justify-content-center">
                                                <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">

                                                    <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Sign up</p>

                                                    <form:form class="mx-1 mx-md-4" action="/register" method="post"
                                                        modelAttribute="newRegister" enctype="multipart/form-data">
                                                        <c:set var="confirmErr">
                                                            <form:errors path="confirmPassword"
                                                                cssClass="invalid-feedback" />
                                                        </c:set>

                                                        <c:set var="firstNameErr">
                                                            <form:errors path="firstName" cssClass="invalid-feedback" />
                                                        </c:set>

                                                        <c:set var="lastNameErr">
                                                            <form:errors path="lastName" cssClass="invalid-feedback" />
                                                        </c:set>

                                                        <c:set var="emailErr">
                                                            <form:errors path="email" cssClass="invalid-feedback" />
                                                        </c:set>

                                                        <c:set var="passwordErr">
                                                            <form:errors path="password" cssClass="invalid-feedback" />
                                                        </c:set>
                                                        <div class="row g-3">
                                                            <div class="col">


                                                                <form:input type="text" id="form3Example3c"
                                                                    class="form-control ${not empty firstNameErr ? 'is-invalid' : ''}"
                                                                    placeholder="firstName " path="firstName" />
                                                                ${firstNameErr}

                                                            </div>
                                                            <div class="col">
                                                                <form:input type="text"
                                                                    class="form-control ${not empty lastNameErr ? 'is-invalid' : ''}"
                                                                    placeholder="LastName" path="lastName" />
                                                                ${lastNameErr}
                                                            </div>
                                                        </div>

                                                        <div class="row mt-4">
                                                            <div class="col">
                                                                <form:input type="email"
                                                                    class="form-control ${not empty emailErr ? 'is-invalid' : ''}"
                                                                    placeholder="Your email" path="email" />
                                                                ${emailErr}
                                                            </div>


                                                        </div>

                                                        <div class="row mt-4">
                                                            <div class="col">
                                                                <form:input type="password"
                                                                    class="form-control ${not empty passwordErr ? 'is-invalid' : ''} "
                                                                    placeholder="Password" path="password" />
                                                                ${passwordErr}

                                                            </div>

                                                            <div class="col">
                                                                <form:input type="Password"
                                                                    class="form-control ${not empty confirmErr ? 'is-invalid' : ''}"
                                                                    placeholder="Confirm Password"
                                                                    path="confirmPassword" />
                                                                ${confirmErr}

                                                            </div>
                                                        </div>


                                                        <div class="row mt-4 d-flex justify-content-center">
                                                            <a href="/login">if you have account? Go to sign in</a>
                                                        </div>


                                                        <div
                                                            class="d-flex justify-content-center mt-4 mx-4 mb-3 mb-lg-4">
                                                            <button type="submit" data-mdb-button-init
                                                                data-mdb-ripple-init
                                                                class="btn btn-primary btn-lg">Register</button>
                                                        </div>
                                                    </form:form>

                                                </div>
                                                <div
                                                    class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">

                                                    <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/draw1.webp"
                                                        class="img-fluid" alt="Sample image">

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

                </body>

                </html>