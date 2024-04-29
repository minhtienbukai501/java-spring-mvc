<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="Lê Minh Tiến- Dự án laptopshop" />
                <meta name="author" content="Lê Minh Tiên" />
                <title>User</title>

                <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
                <link href="/css/styles.css" rel="stylesheet" />

                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body>
                <div class="container mt-5  mb-5">

                    <div class="row ">
                        <div class="col-md-6 col-12 m-auto">
                            <div class="row">
                                <h1 style="text-align: center;">Login</h1>
                            </div>

                            <form:form modelAttribute="newLogin" action="/login" method="post">
                                <!-- Email input -->
                                <c:set var="errEmail">
                                    <form:errors path="email" cssClass="invalid-feedback" />
                                </c:set>
                                <c:set var="passwordErr">
                                    <form:errors path="password" cssClass="invalid-feedback" />
                                </c:set>
                                <div data-mdb-input-init class="form-outline mb-4 mt-4">
                                    <label class="form-label" for="form2Example1">Email address:</label>
                                    <form:input type="email" id="form2Example1"
                                        class="form-control ${not empty errEmail ? 'is-invalid' : ''}" path="email" />
                                    ${errEmail}
                                </div>

                                <!-- Password input -->
                                <div data-mdb-input-init class="form-outline mb-4">
                                    <label class="form-label" for="form2Example2">Password:</label>
                                    <form:input type="password" id="form2Example2"
                                        class="form-control ${not empty passwordErr ? 'is-invalid' : ''}"
                                        path="password" />
                                    ${passwordErr}
                                </div>

                                <!-- 2 column grid layout for inline styling -->
                                <div class="row mb-4">


                                    <div class="col">
                                        <!-- Simple link -->
                                        <a href="#!">Forgot password?</a>
                                    </div>
                                </div>

                                <!-- Submit button -->
                                <button type="submit" style="width: 100%;" data-mdb-button-init data-mdb-ripple-init
                                    class="btn btn-primary btn-block mb-4">Sign in</button>

                                <!-- Register buttons -->
                                <div class="text-center">
                                    <p>Not a member? <a href="/register">Register</a></p>

                                </div>
                            </form:form>
                        </div>
                    </div>
                </div>
            </body>

            </html>