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

                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
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
                                    <li class="breadcrumb-item active">update</li>
                                </ol>
                                <div class="container mt-3  mb-5">
                                    <div class="row">
                                        <div class="col-md-6 col-12 mx-auto">
                                            <h3>Update a user</h3>
                                            <hr>
                                            <form:form id="form-update" action="/admin/user/update" method="post"
                                                enctype="multipart/form-data" modelAttribute="updateUser">
                                                <div class="mb-3" style="display: none;">
                                                    <label class="form-label">Id:</label>
                                                    <form:input type="text" class="form-control" path="id" />
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">Email:</label>
                                                    <form:input readonly="true" type="email" class="form-control"
                                                        path="email" />
                                                </div>

                                                <div class="mb-3">
                                                    <label class="form-label">Phone number:</label>
                                                    <form:input type="text" class="form-control" path="phone" />
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">Full Name:</label>
                                                    <form:input type="text" class="form-control" path="fullName" />
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">Address:</label>
                                                    <form:input type="text" class="form-control" path="address" />
                                                </div>
                                                <div class="mb-3">
                                                    <div class="col">
                                                        <label class="form-label">Role:</label>
                                                        <form:select class="form-select" path="role.name">
                                                            <form:option value="Admin">ADMIN</form:option>
                                                            <form:option value="USER">USER</form:option>
                                                        </form:select>
                                                    </div>
                                                    <div class="col">
                                                        <label for="formFile" class="form-label">Avatar Image:</label>
                                                        <input class="form-control" type="file" id="avatarFile"
                                                            accept=".png, .jpg, .jpeg" name="nameFileUpdate" />
                                                    </div>
                                                </div>
                                                <div>
                                                    <img style="max-height: 250px; display: none;" alt="avatar proview"
                                                        id="avatarPreview">
                                                </div>


                                                <div class="mt-2">
                                                    <a href="/admin/user" type="button" class="btn btn-success">Back</a>
                                                    <button style="margin-left: 8px;" type="submit"
                                                        class="btn btn-warning">Update</button>

                                                </div>
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