<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Document</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <!-- Latest compiled JavaScript -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

            </head>

            <body>
                <div class="container mt-5">
                    <div class="row">

                        <div class="col-6">
                            <h3>Table User</h3>
                        </div>
                        <div class="col-6 d-flex justify-content-end">
                            <a class="btn btn-primary" href="/admin/user/create">Create a user</a>
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
                                    <th class="col-5" scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="user" items="${users}">
                                    <tr>
                                        <th>${user.id}</th>
                                        <td>${user.email}</td>
                                        <td>${user.fullName}</td>
                                        <td>
                                            <a href="/admin/user/${user.id}" class="btn btn-success">View</a>
                                            <a href="/admin/user/update/${user.id}" class="btn btn-warning">Update</a>
                                            <a href="/admin/user/delete/${user.id}" class="btn btn-danger">Delete</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </body>

            </html>