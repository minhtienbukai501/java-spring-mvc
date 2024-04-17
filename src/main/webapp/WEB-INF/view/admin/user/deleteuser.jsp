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

                        <h3>Delete a user</h3>
                        <hr>

                        <div class="alert alert-danger">
                            Are you sure delete this user ?
                        </div>
                        <form:form method="post" action="/admin/user/delete" modelAttribute="newUser">
                            <div class="mb-3" style="display:none;">
                                <label class="form-label"></label>
                                <form:input type="text" class="form-control" path="id" />
                            </div>
                            <button type="submit" class="btn btn-danger">Confirm</button>
                        </form:form>
                    </div>

                </div>

            </body>

            </html>