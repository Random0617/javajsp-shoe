<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <jsp:include page="Menu.jsp"></jsp:include>
    <div class="container">
        <div class="row">
            <div class="col">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="home">Home</a></li>
                        <li class="breadcrumb-item"><a href="#">Category</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Sub-category</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <jsp:include page="Left.jsp"></jsp:include>
            <div class="col-sm-9">
                <div id="content" class="row">
                    <c:forEach items="${listP}" var="o">
                        <div class="product col-12 col-md-6 col-lg-4">
                            <div class="card">
                                <img class="card-img-top" src="${o.image}" alt="Card image cap">
                                <div class="card-body">
                                    <h4 class="card-title show_txt">
                                        <a href="detail?pid=${o.id}" title="View Product">${o.name}</a>
                                    </h4>
                                    <p class="card-text show_txt">${o.title}</p>
                                    <%-- <p class="card-text">Average Rating: <span style="color: red;">${o.avgRating}</span></p> --%>
                                    <p class="card-text">
                                        Average Rating: <span style="color: red;">
                                        <c:out value="${avgRatings[o.id]}"/>
                                        </span>
                                    </p>
                                    <div class="row">
                                        <div class="col">
                                            <p class="btn btn-danger btn-block">${o.price}$</p>
                                        </div>
                                        <div class="col">
                                            <form action="addtocart" method="post">
                                                <input type="hidden" name="productId" value="${o.id}">
                                                <button type="submit" class="btn btn-success btn-block">Add to cart</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <nav aria-label="Page navigation" class = "mt-4">
                    <ul class="pagination justify-content-center">
                        <c:forEach begin="1" end="${totalPages}" var="i">
                            <li class="page-item mx-1 <c:if test='${i == currentPage}'>active</c:if>'">
                                <a class="page-link" href="home?page=${i}">${i}</a>
                            </li>
                        </c:forEach>
                    </ul>
                </nav>
            </div>
        </div>
    </div>

    <jsp:include page="Footer.jsp"></jsp:include>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
                        function loadMore() {
                            var amount = document.getElementsByClassName("product").length;
                            $.ajax({
                                url: "/Project_banhang/load",
                                type: "get", //send it through get method
                                data: {
                                    exits: amount
                                },
                                success: function (data) {
                                    var row = document.getElementById("content");
                                    row.innerHTML += data;
                                },
                                error: function (xhr) {
                                    //Do Something to handle error
                                }
                            });
                        }
                        function searchByName(param){
                            var txtSearch = param.value;
                            $.ajax({
                                url: "/Project_banhang/searchAjax",
                                type: "get", //send it through get method
                                data: {
                                    txt: txtSearch
                                },
                                success: function (data) {
                                    var row = document.getElementById("content");
                                    row.innerHTML = data;
                                },
                                error: function (xhr) {
                                    //Do Something to handle error
                                }
                            });
                        }
        </script>
</body>
</html>