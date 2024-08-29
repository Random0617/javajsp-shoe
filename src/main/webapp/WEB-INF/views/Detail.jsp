<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<style>
.gallery-wrap .img-big-wrap img {
	height: 450px;
	width: auto;
	display: inline-block;
	cursor: zoom-in;
}

.gallery-wrap .img-small-wrap .item-gallery {
	width: 60px;
	height: 60px;
	border: 1px solid #ddd;
	margin: 7px 2px;
	display: inline-block;
	overflow: hidden;
}

.gallery-wrap .img-small-wrap {
	text-align: center;
}

.gallery-wrap .img-small-wrap img {
	max-width: 100%;
	max-height: 100%;
	object-fit: cover;
	border-radius: 4px;
	cursor: zoom-in;
}

.img-big-wrap img {
	width: 100% !important;
	height: auto !important;
}
</style>
</head>
<body>
	<jsp:include page="Menu.jsp"></jsp:include>
	<br/>
	<br/>
	<div class="container">
		<div class="row">
			<jsp:include page="Left.jsp"></jsp:include>
			<div class="col-sm-9">
				<div class="container">
					<div class="card">
						<div class="row">
							<aside class="col-sm-5 border-right">
								<article class="gallery-wrap">
									<div class="img-big-wrap">
										<div>
											<a href="#"><img src="${detail.image}"></a>
										</div>
									</div>
									<!-- slider-product.// -->
									<div class="img-small-wrap"></div>
									<!-- slider-nav.// -->
								</article>
								<!-- gallery-wrap .end// -->
							</aside>
							<aside class="col-sm-7">
								<article class="card-body p-5">
									<h3 class="title mb-3">${detail.name}</h3>

									<p class="price-detail-wrap">
										<span class="price h3 text-warning"> <span
											class="currency">US $</span><span class="num">${detail.price}</span>
										</span>
									</p>
									<!-- price-detail-wrap .// -->
									<dl class="item-property">
										<dt>Description</dt>
										<dd>
											<p>${detail.description}</p>
										</dd>
										<p>Average Rating: <span style="color: red;">${avgRating}</span></p>
									</dl>

									<hr>
									<a href="addtocart?productId=${detail.id}" class="btn btn-lg btn-primary text-uppercase">
										Buy now </a> <a href="addtocart?productId=${detail.id}"
										class="btn btn-lg btn-outline-primary text-uppercase"> <i
										class="fas fa-shopping-cart"></i> Add to cart
									</a>
								</article>
								<!-- card-body.// -->
							</aside>
							<!-- col.// -->
						</div>
						<!-- row.// -->
					</div>
					<!-- card.// -->
					<div>
						<br>
						<br>
						
						<div>
						    <h4 style="border-bottom: 2px solid #007bff; padding-bottom: 10px; color: #333;">Comments</h4>
						    <c:forEach items="${comments}" var="comment">
						        <div style="border: 1px solid #ddd; border-radius: 8px; padding: 15px; margin-bottom: 20px; background-color: #f9f9f9;">
						            <p style="font-weight: bold; color: #333;">User ${comment.userId}</p>
						            <p style="margin: 5px 0; color: #555;">${comment.comment}</p>
						            <p style="font-style: italic; color: #888; margin-top: 10px;">${comment.createdDate}</p>
						        </div>
						    </c:forEach>
						</div>
						
						
						<br>
						
						
						
						<!-- <h3 style="text-align: left; margin-bottom: 20px;">Add comment and rating here</h3> -->
						<h3 style="border-bottom: 2px solid #007bff; padding-bottom: 10px; color: #333;">Add comment and rating here</h3>
						<form action="addComment" method="post" style="padding: 20px; border: 1px solid #ddd; border-radius: 8px; background-color: #f9f9f9; max-width: 600px;">
						    <input type="hidden" name="productId" value="${detail.id}">
						    
						    <div style="margin-bottom: 15px;">
						        <label for="rating" style="display: block; margin-bottom: 5px; font-weight: bold;">Rating:</label>
						        <select name="rating" style="width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px; font-size: 16px;">
						            <option value="1">1</option>
						            <option value="2">2</option>
						            <option value="3">3</option>
						            <option value="4">4</option>
						            <option value="5">5</option>
						        </select>
						    </div>
						    
						    <div style="margin-bottom: 15px;">
						        <label for="comment" style="display: block; margin-bottom: 5px; font-weight: bold;">Comment:</label>
						        <textarea name="comment" rows="4" placeholder="Comment here ..." style="width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px; font-size: 16px;"></textarea>
						    </div>
						    
						    <button type="submit" style="width: 100%; padding: 10px; background-color: #007bff; color: white; border: none; border-radius: 4px; font-size: 16px; cursor: pointer;">Submit</button>
						</form>
						
						
					</div>

				</div>
			</div>
		</div>
	</div>
	<jsp:include page="Footer.jsp"></jsp:include>
</body>

</html>
