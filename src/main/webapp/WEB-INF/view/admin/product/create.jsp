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
                                    <li class="breadcrumb-item active"><a href="/admin/product"> product</a></li>
                                    <li class="breadcrumb-item active">create</li>
                                </ol>
                                <div class="container mt-5  mb-5">
                                    <div class="row">
                                        <div class="col-md-6 col-12 mx-auto">
                                            <h3>Create a product</h3>
                                            <hr />
                                            <form:form action="/admin/product/create" method="post"
                                                modelAttribute="newProduct" enctype="multipart/form-data">
                                                <div class="row g-3">
                                                    <div class="col">
                                                        <label class="form-label">Name:</label>
                                                        <form:input type="text" class="form-control" path="name" />
                                                    </div>
                                                    <div class="col">
                                                        <label class="form-label">Price:</label>
                                                        <form:input type="text" class="form-control " value="0.0"
                                                            path="price" />
                                                    </div>
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">Decription:</label>
                                                    <form:input type="text" class="form-control" path="detailDesc" />

                                                </div>

                                                <div class="row g-3">
                                                    <div class="col">
                                                        <label class="form-label">Short decription:</label>
                                                        <form:input type="text" class="form-control" path="shortDesc" />
                                                    </div>
                                                    <div class="col">
                                                        <label class="form-label">Quantity:</label>
                                                        <form:input type="text" class="form-control" path="quantity" />
                                                    </div>
                                                </div>

                                                <div class="row g-3">
                                                    <div class="col">
                                                        <label class="form-label">Factory:</label>
                                                        <form:select class="form-select" path="factory">
                                                            <option value=" Macbook">Macbook</option>
                                                            <option value="MSI">MSI</option>
                                                        </form:select>
                                                    </div>
                                                    <div class="col">
                                                        <label class="form-label">Target:</label>
                                                        <form:select class="form-select" path="target">
                                                            <option value="Gamming">Gamming</option>
                                                            <option value="Văn Phòng">Văn Phòng</option>
                                                        </form:select>
                                                    </div>
                                                </div>

                                                <div class="row g-3">
                                                    <label for="formFile" class="form-label">Avatar Image:</label>
                                                    <input class="form-control" type="file" id="avatarFile"
                                                        accept=".png, .jpg, .jpeg" name="" />
                                                </div>
                                                <div class="row g-3 mt-2">
                                                    <img style="max-height: 250px; display: none;" alt="avatar proview"
                                                        id="avatarPreview">
                                                </div>
                                                <button type="submit" class="btn btn-primary mt-4 mb-10">Create</button>
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