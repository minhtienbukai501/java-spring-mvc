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
                                    <li class="breadcrumb-item active"> User</li>

                                </ol>
                                <div class="container mt-5  mb-5">
                                    <div class="row">

                                        <div class="col-6">
                                            <h3>Table User</h3>
                                        </div>
                                        <div class="col-6 d-flex justify-content-end">
                                            <a class="btn btn-primary" href="/admin/user/create">Create a
                                                user</a>
                                        </div>

                                    </div>
                                    <hr class="mt-2">
                                    <div class="row">
                                        <table class="table table-bordered">
                                            <thead>
                                                <tr>
                                                    <th class="col-1" scope="col">Id</th>
                                                    <th class="col-3 " scope="col">Email</th>
                                                    <th class="col-3" scope="col">Full Name</th>
                                                    <th class="col-1" scope="col">Role</th>
                                                    <th class="col-5" scope="col">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>

                                                <c:forEach var="user" items="${users}">
                                                    <tr>

                                                        <th>${user.id}</th>
                                                        <td>${user.email}</td>
                                                        <td>${user.fullName}</td>
                                                        <td>${user.role.name}</td>
                                                        <td>
                                                            <a href="/admin/user/${user.id}"
                                                                class="btn btn-success">View</a>
                                                            <a href="/admin/user/update/${user.id}"
                                                                class="btn btn-warning">Update</a>
                                                            <a href="/admin/user/delete/${user.id}"
                                                                class="btn btn-danger">Delete</a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>



                                            </tbody>
                                        </table>
                                    </div>
                                    <div>
                                        <c:if test="${users.size() == 0}">
                                            <p style="text-align: center;color:#ccc">Not found any user!</p>
                                        </c:if>
                                    </div>
                                    <div class="row ">
                                        <nav aria-label="Page navigation example ">
                                            <ul class="pagination justify-content-center">
                                              <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                                              <li class="page-item"><a class="page-link" href="#">1</a></li>
                                              <li class="page-item"><a class="page-link" href="#">2</a></li>
                                              <li class="page-item"><a class="page-link" href="#">3</a></li>
                                              <li class="page-item"><a class="page-link" href="#">Next</a></li>
                                            </ul>
                                          </nav>
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