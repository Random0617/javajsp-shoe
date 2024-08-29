<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Checkout</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="Menu.jsp"></jsp:include>
	<br/>
    <div class="container">
        <h2 class="my-4 text-center">Checkout</h2>
        <c:choose>
            <c:when test="${not empty sessionScope.cart}">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Product Name</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${sessionScope.cart.items}" var="item">
                            <tr>
                                <td>${item.product.name}</td>
                                <td>${item.quantity}</td>
                                <td>${item.product.price}</td>
                                <td>${item.quantity * item.product.price}</td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td colspan="3" class="text-right">Total Price</td>
                            <td>${sessionScope.cart.totalPrice}</td>
                        </tr>
                    </tbody>
                </table>
                
                <form action="confirmPurchase" method="post">
                	<input type="hidden" name="totalAmount" value="${sessionScope.cart.totalPrice}">
                    <div class="form-group">
                        <label for="name">Name:</label>
                        <input type="text" class="form-control" id="name" name="name" required>
                    </div>
                    <!-- <div class="form-group">
                        <label for="email">Email:</label>
                        <input type="email" class="form-control" id="email" name="email" required>
                    </div> -->
                    <div class="form-group">
                        <label for="couponName">Coupon Name:</label>
                        <input type="text" class="form-control" id="couponName" name="couponName">
                    </div>
                    <div class="form-group">
                        <label for="phone">Phone:</label>
                        <input type="text" class="form-control" id="phone" name="phone" required>
                    </div>
                    <button type="submit" class="btn btn-success">Confirm Purchase</button>
                    <a href="home" class="btn btn-secondary">Cancel</a>
                </form>
                
               <!--  <form action="checkout" method="post">
                    <button type="submit" class="btn btn-success">Confirm Purchase</button>
                </form> -->
            </c:when>
            <c:otherwise>
                <div class="alert alert-warning" role="alert">
                    Your cart is empty! Return to <a href="home"> Homepage </a> to select products!
                </div>
            </c:otherwise>
        </c:choose>
    </div>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
