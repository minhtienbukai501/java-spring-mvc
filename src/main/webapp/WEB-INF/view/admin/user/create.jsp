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
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                    <script>
                        $(document).ready(() => {
                            const avatarFile = $("#avatarFile");
                            avatarFile.change(function (e) {
                                const imgURL = URL.createObjectURL(e.target.files[0]);
                                $("#avatarPreview").attr("src", imgURL);
                                $("#avatarPreview").css({ "display": "block" });
                            });
                        });
                    </script>

                </head>

                <body class="sb-nav-fixed">
                    <jsp:include page="../layout/header.jsp" />
                    <div id="layoutSidenav">
                        <jsp:include page="../layout/sidebar.jsp" />
                        <div id="layoutSidenav_content">
                            <main>
                                <div class="container-fluid px-4">
                                    <h1 class="mt-4">Dashboard</h1>
                                    <ol class="breadcrumb mb-4">
                                        <li class="breadcrumb-item active"><a href="/admin">Dashboard</a></li>
                                        <li class="breadcrumb-item active"><a href="/admin/user"> User</a></li>
                                        <li class="breadcrumb-item active">create</li>
                                    </ol>
                                    <div class="container mt-5  mb-5">
                                        <div class="row">
                                            <div class="col-md-6 col-12 mx-auto">
                                                <h3>Create a user</h3>
                                                <hr />
                                                <form:form action="/admin/user/create" method="post"
                                                    modelAttribute="newUser" enctype="multipart/form-data">
                                                    <div class="row g-3">
                                                        <div class="col">
                                                            <c:set var="emailErr">
                                                                <form:errors path="email" cssClass="invalid-feedback" />
                                                            </c:set>
                                                            <label class="form-label">Email:</label>
                                                            <form:input type="email"
                                                                class="form-control ${not empty emailErr ? 'is-invalid' : ''}"
                                                                path="email" />

                                                            ${emailErr}
                                                        </div>
                                                        <div class="col">
                                                            <c:set var="nameHasBindError">
                                                                <form:errors path="passWord"
                                                                    cssClass="invalid-feedback" />
                                                            </c:set>
                                                            <label class="form-label">Password:</label>
                                                            <form:input type="passWord"
                                                                class="form-control ${not empty nameHasBindError ? 'is-invalid' : ''}"
                                                                path="passWord" />
                                                            ${nameHasBindError}
                                                        </div>
                                                    </div>
                                                    <div class="row g-3">
                                                        <div class="col">
                                                            <c:set var="phoneErr">
                                                                <form:errors path="phone" cssClass="invalid-feedback" />
                                                            </c:set>
                                                            <label class="form-label">Phone number:</label>
                                                            <form:input type="text"
                                                                class="form-control ${not empty phoneErr ? 'is-invalid' : ''} "
                                                                path="phone" />
                                                            ${phoneErr}
                                                        </div>
                                                        <div class="col">
                                                            <c:set var="fullNameErr">
                                                                <form:errors path="fullName"
                                                                    cssClass="invalid-feedback" />
                                                            </c:set>
                                                            <label class="form-label">Full Name:</label>
                                                            <form:input type="text"
                                                                class="form-control ${not empty fullNameErr ? 'is-invalid' : ''} "
                                                                path="fullName" />
                                                            ${fullNameErr}
                                                        </div>
                                                    </div>


                                                    <div class="mb-3">
                                                        <c:set var="addressErr">
                                                            <form:errors path="address" cssClass="invalid-feedback" />
                                                        </c:set>
                                                        <label class="form-label">Address:</label>
                                                        <form:input type="text"
                                                            class="form-control ${not empty addressErr ? 'is-invalid' : ''}"
                                                            path="address" />
                                                        ${addressErr}
                                                    </div>

                                                    <div class="row g-3">
                                                        <div class="col">
                                                            <label class="form-label">Role:</label>
                                                            <form:select class="form-select" path="role.name">
                                                                <form:option value="Admin">ADMIN</form:option>
                                                                <form:option value="USER">USER</form:option>
                                                            </form:select>
                                                        </div>
                                                        <div class="col">

                                                            <label for="formFile" class="form-label">Avatar
                                                                Image:</label>
                                                            <input class="form-control" type="file" id="avatarFile"
                                                                accept=".png, .jpg, .jpeg" name="nameFile" />
                                                        </div>
                                                    </div>


                                                    <img style="max-height: 250px; display: none;" alt="avatar proview"
                                                        id="avatarPreview">

                                                    <button type="submit"
                                                        class="btn btn-primary mt-4 mb-10">Create</button>
                                                </form:form>
                                            </div>

                                        </div>

                                    </div>
                                </div>
                            </main>
                            <jsp:include page="../layout/footer.jsp" />
                        </div>
                    </div>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                        crossorigin="anonymous"></script>
                    <script src="/js/scripts.js"></script>

                </body>

                </html>