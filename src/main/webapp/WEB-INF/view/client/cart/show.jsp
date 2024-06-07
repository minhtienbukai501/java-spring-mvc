<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8">
                    <title>cart detail</title>
                    <meta content="width=device-width, initial-scale=1.0" name="viewport">
                    <meta content="" name="keywords">
                    <meta content="" name="description">

                    <!-- Google Web Fonts -->
                    <link rel="preconnect" href="https://fonts.googleapis.com">
                    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                    <link
                        href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                        rel="stylesheet">

                    <!-- Icon Font Stylesheet -->
                    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                        rel="stylesheet">

                    <!-- Libraries Stylesheet -->
                    <link href="client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                    <link href="client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


                    <!-- Customized Bootstrap Stylesheet -->
                    <link href="client/css/bootstrap.min.css" rel="stylesheet">

                    <!-- Template Stylesheet -->
                    <link href="client/css/style.css" rel="stylesheet">

                </head>

                <body>

                    <!-- Spinner Start -->
                    <div id="spinner"
                        class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
                        <div class="spinner-grow text-primary" role="status"></div>
                    </div>
                    <!-- Spinner End -->

                    <jsp:include page="../layout/header.jsp" />





                    <!-- Single Page Header start -->
                    <div class="container-fluid page-header py-5">
                        <h1 class="text-center text-white display-6">Cart</h1>
                        
                    </div>
                    <!-- Single Page Header End -->


                    <!-- Cart Page Start -->
                    <div class="container-fluid py-5">
                        
                            <ol class="breadcrumb justify-content-center mb-0">
                                <li class="breadcrumb-item"><a href="/">Home</a></li>
                                <li class="breadcrumb-item active">Cart</li>
                            </ol>
                    
                        <div class="container py-5">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">Products</th>
                                            <th scope="col">Name</th>
                                            <th scope="col">Price</th>
                                            <th scope="col">Quantity</th>
                                            <th scope="col">Total</th>
                                            <th scope="col">Handle</th>
                                        </tr>
                                    </thead>

                                    <tbody>


                                        <c:if test="${listCart.size() != 0}">
                                            <c:forEach items="${listCart}" var="cart">


                                                <tr>
                                                    <th scope="row">
                                                        <div class="mb-0 mt-4">
                                                            <img src="images/product/${cart.product.image}"
                                                                class="img-fluid me-5 rounded-circle"
                                                                style="width: 80px; height: 80px;" alt="">
                                                        </div>
                                                    </th>
                                                    <td>
                                                        <div class="mb-0 mt-4">
                                                            <a href="/product/${cart.product.id}">${cart.product.name}

                                                        </div>
                                                    </td>
                                                    <td>
                                                        <p class="mb-0 mt-4">
                                                            <fmt:formatNumber type="number"
                                                                value="${cart.product.price}" />
                                                            vnd
                                                        </p>
                                                    </td>
                                                    <td>
                                                        <div class="input-group quantity mt-4" style="width: 100px;">
                                                            <div class="input-group-btn">
                                                                <button
                                                                    class="btn btn-sm btn-minus rounded-circle bg-light border">
                                                                    <i class="fa fa-minus"></i>
                                                                </button>
                                                            </div>
                                                            <input type="text"
                                                                class="form-control form-control-sm text-center border-0"
                                                                value="${cart.quantity}" data-cart-detail-id=${cart.id}
                                                                data-cart-detail-price=${cart.price}>
                                                            <div class="input-group-btn">
                                                                <button
                                                                    class="btn btn-sm btn-plus rounded-circle bg-light border">
                                                                    <i class="fa fa-plus"></i>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <p class="mb-0 mt-4" data-cart-detail-id=${cart.id}>
                                                            <fmt:formatNumber type="number"
                                                                value="${cart.product.price * cart.quantity}" />
                                                            vnd
                                                        </p>
                                                    </td>
                                                    <td>
                                                        <form action="/cart/${cart.id}" method="post">
                                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                            <button type="submit" class="btn btn-md rounded-circle bg-light border mt-4">
                                                                <i class="fa fa-times text-danger"></i>
                                                            </button>
                                                        </form>
                                                    </td>

                                                </tr>
                                            </c:forEach>
                                        </c:if>
                                    </tbody>
                                </table>
                                <c:if test="${listCart.size() == 0}">
                                    <div style="align-items: center;text-align: center;">
                                        <span>Bạn chưa có mặt hàng nào
                                            trong
                                            giỏ hàng</span>
                                    </div>

                                </c:if>
                            </div>

                            <c:if test="${listCart.size() != 0}">
                                <div class="mt-5">
                                    <input type="text" class="border-0 border-bottom rounded me-5 py-3 mb-4"
                                        placeholder="Coupon Code">
                                    <button class="btn border-secondary rounded-pill px-4 py-3 text-primary"
                                        type="button">Apply Coupon</button>
                                </div>
                                <div class="row g-4 justify-content-start ">

                                    <div class="col-sm-8 col-md-7 col-lg-6 col-xl-4">
                                        <div class="bg-light rounded">
                                            <div class="p-4">
                                                <h1 class="display-6 mb-4">Cart <span class="fw-normal">Total</span>
                                                </h1>
                                                <div class="d-flex justify-content-between mb-4">
                                                    <h5   class="mb-0 me-4" data-cart-total-price="${totalPrice}">
                                                        Subtotal:

                                                    </h5>
                                                    <p class="mb-0" data-cart-total-price=${totalPrice}>
                                                        <fmt:formatNumber type="number" value="${totalPrice}" /> VND
                                                    </p>
                                                </div>
                                                <div class="d-flex justify-content-between">
                                                    <h5 class="mb-0 me-4">Shipping</h5>
                                                    <div class="">
                                                        <p class="mb-0">Ship: </p>
                                                        <p class="mb-0">VAT: 1%</p>
                                                    </div>
                                                </div>
                                                <p class="mb-0 text-end"></p>
                                            </div>
                                            <div
                                                class="py-4 mb-4 border-top border-bottom d-flex justify-content-between">
                                                <h5 class="mb-0 ps-4 me-4">Total</h5>
                                                <p class="mb-0 pe-4" data-cart-total-price=${totalPrice}> 
                                                    <fmt:formatNumber type="number" 
                                                        value="${totalPrice + totalPrice * 0.01}" /> VND
                                                </p>
                                            </div>
                                            <button
                                                class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4 ms-4"
                                                type="button">Proceed Checkout
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </c:if>

                        </div>
                    </div>
                    <!-- Cart Page End -->





                    <jsp:include page="../layout/footer.jsp" />





                    <!-- Back to Top -->
                    <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
                            class="fa fa-arrow-up"></i></a>


                    <!-- JavaScript Libraries -->
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="client/lib/easing/easing.min.js"></script>
                    <script src="client/lib/waypoints/waypoints.min.js"></script>
                    <script src="client/lib/lightbox/js/lightbox.min.js"></script>
                    <script src="client/lib/owlcarousel/owl.carousel.min.js"></script>

                    <!-- Template Javascript -->
                    <script src="client/js/main.js"></script>
                </body>

                </html>