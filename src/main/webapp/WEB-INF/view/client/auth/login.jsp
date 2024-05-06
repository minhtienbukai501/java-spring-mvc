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

                            <form:form action="/login" method="post">
                                <!-- Email input -->
                                <c:if test="${param.error != null}">
                                    <div class="my-2" style="color: red;">Invalid email or password.</div>
                                </c:if>

                                <c:if test="${param.logout != null}">
                                    <div class="my-2" style="color: rgb(0, 255, 55);">Logout suscess</div>
                                </c:if>
                                <div data-mdb-input-init class="form-outline mb-4 mt-4">
                                    <label class="form-label" for="username">Email address:</label>
                                    <input type="email" id="username" name="username" class="form-control" />
                                </div>

                                <!-- Password input -->
                                <div data-mdb-input-init class="form-outline mb-4">
                                    <label class="form-label" for="password">Password:</label>
                                    <input type="password" id="password" name="password" class="form-control " />

                                </div>

                                <div>
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
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