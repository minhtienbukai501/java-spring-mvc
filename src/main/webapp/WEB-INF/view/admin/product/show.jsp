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
                                    <li class="breadcrumb-item active">Product</li>

                                </ol>
                                <div class="container mt-5  mb-5">
                                    <div class="row">

                                        <div class="col-6">
                                            <h3>Table Product</h3>
                                        </div>
                                        <div class="col-6 d-flex justify-content-end">
                                            <a class="btn btn-primary" href="/admin/product/create">Create a
                                                product</a>
                                        </div>

                                    </div>
                                    <hr class="mt-2">
                                    <div class="row">
                                        <table class="table table-bordered">
                                            <thead>
                                                <tr>
                                                    <th class="col-1" scope="col">Id</th>
                                                    <th class="col-3 " scope="col">Name</th>
                                                    <th class="col-3" scope="col">Price</th>
                                                    <th class="col-1" scope="col">Factory</th>
                                                    <th class="col-5" scope="col">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="product" items="${listProduct}">
                                                    <tr>

                                                        <th>${product.id}</th>
                                                        <td>${product.name}</td>
                                                        <td>${String.format("%.0f", product.price)}</td>
                                                        <td>${product.factory}</td>
                                                        <td>
                                                            <a href="/admin/product/${product.id}"
                                                                class="btn btn-success">View</a>
                                                            <a href="/admin/product/update/${product.id}"
                                                                class="btn btn-warning">Update</a>
                                                            <a href="/admin/product/delete/${product.id}"
                                                                class="btn btn-danger">Delete</a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>




                                            </tbody>
                                        </table>
                                    </div>
                                    <div>
                                        <c:if test="${listProduct.size() == 0}">
                                            <p style="text-align: center;color:#ccc">Không có người dùng nào</p>
                                        </c:if>
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