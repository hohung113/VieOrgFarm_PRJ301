<%-- 
    Document   : Detail
    Created on : Dec 29, 2020, 5:43:04 PM
    Author     : trinh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">

         <link href="css/style.css" rel="stylesheet" type="text/css"/>
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
            .img-big-wrap img{
                width: 100% !important;
                height: auto !important;
            }

            .zoom-on-hover {
                transition: transform 0.3s; /* Thời gian hoàn thành hiệu ứng */
            }

            .zoom-on-hover:hover {
                transform: scale(1.2); /* Phóng to hình ảnh lên 1.1 lần khi di chuột qua */
            }


            
        </style>
        
        
        
    </head>
    <body>
       <jsp:include page="include/Menu.jsp"></jsp:include>
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card bg-light mb-3">
                            <div class="card-header bg-success  text-white text-uppercase  "><i class="fa fa-list"></i> Danh Mục</div>
                            <ul class="list-group category_block" style="display: flex; flex-direction: row;">
                            <c:forEach items="${listC}" var="o">
<!--                                <li class="list-group-item text-white" style="flex: 1;"><a href="categoryControll?ccid=${o.categoryID}">${o.categoryName}</a></li>-->
                                <li style="flex: 1; " class="list-group-item text-white ${tag == o.categoryID ? "active": "" }"><a href="cateControll?cateid=${o.categoryID}">${o.categoryName}</a></li>
                                </c:forEach>
                        </ul>
                    </div>
                </div>

                <div class="col-sm-12">
                    <div class="container">
                        <div class="card">
                            <div class="row">
                                <aside class="col-sm-5 border-right">
                                    <article class="gallery-wrap">
                                        <div class="img-big-wrap">
                                        <c:set var="o" value="${detailP}" />
                                        <div class="product-image">
                                            <a href="#">
                                                <img src="${o.image}" class="zoom-on-hover">
                                            </a>
                                        </div>
                                    </div>
                                </article>
                            </aside>



                                <aside class="col-sm-7">
                                    <article class="card-body p-5">
                                        <h3 class="title mb-3">${o.productName}</h3>

                                        <p class="price-detail-wrap"> 
                                            <span class="price h3 text-warning"> 
                                                <span class="currency">US $</span><span class="num">${o.price}</span>
                                            </span> 
                                            <!--<span>/per kg</span>--> 
                                        </p> <!-- price-detail-wrap .// -->
                                        <dl class="item-property">
                                            <dt>Mô Tả</dt>
                                            <dd><p>${dt.description} </p></dd>
                                        </dl>
                                        <dl class="param param-feature">
                                            <dt>Mã Sản Phẩm</dt>
                                            <dd>${o.productID}</dd>
                                        </dl>   
                                        <dl class="param param-feature">
                                            <dt>Số Lượng Còn Lại</dt>
                                            <dd>${o.quantity}</dd>
                                        </dl>   
<!--                                        <dl class="param param-feature">
                                            <dt>Delivery</dt>
                                            <dd>Russia, USA, and Europe</dd>
                                        </dl>   -->

                                        <hr>
                                        <div class="row">
                                            <div class="col-sm-5">
                                                <dl class="param param-inline">
                                                    <dt>Số lượng: </dt>
                                                    <dd>
                                                        <select class="form-control form-control-sm" style="width:70px;">
                                                            <option> 1 </option>
                                                            <option> 2 </option>
                                                            <option> 3 </option>
                                                        </select>
                                                    </dd>
                                                </dl>  <!-- item-property .// -->
                                            </div> <!-- col.// -->
                                            
                                        </div> <!-- row.// -->
                                        <hr>
                                       

                                        <a href="#" class="btn btn-lg btn-success text-uppercase"> Mua ngay </a>
                                        <a href="#" class="btn btn-lg btn-outline-primary text-uppercase"> <i class="fas fa-shopping-cart"></i>Thêm vào giỏ hàng </a>
                                    </article> <!-- card-body.// -->
                                </aside> <!-- col.// -->
                            </div> <!-- row.// -->
                        </div> <!-- card.// -->


                    </div>
                </div>
            </div>
        </div>
        <!-- Footer -->
        <jsp:include page="include//Footer.jsp" ></jsp:include>
    </body>
 
</html>
