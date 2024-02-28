<%-- 
    Document   : home
    Created on : Oct 16, 2023, 5:04:33 PM
    Author     : ASUS
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--        <link rel="icon" href="images/logo.webp" type="image/x-icon"/>-->
        <title>VIEORGFARM</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        
        
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <style>
/* CSS để thêm hiệu ứng hover và hiển thị văn bản "BUY NOW" */
.card {
  position: relative;
  overflow: hidden;
}

.position-relative {
  position: relative;
}

.card:hover .card-img-top {
  transform: scale(1.1); /* Hiệu ứng phóng to hình ảnh khi hover */
  transition: transform 0.3s;
}

.buy-now-text {
  position: absolute;
  top: 0; /* Hiển thị ở đầu trên cùng */
  left: 50%;
  transform: translateX(-50%);
  opacity: 0;
  font-weight: bold; /* Đặm */
  background-color: rgba(0, 128, 0, 1); /* Màu nền nổi bật */
  color: white; /* Màu chữ */
  padding: 5px 10px; /* Khoảng cách xung quanh văn bản */
  transition: opacity 0.3s;
}

.card:hover .buy-now-text {
  opacity: 1;
  
  

 
}
  



</style>
    </head>
    <body style="background-color: #eecda3; background: -webkit-linear-gradient(to right, #eecda3, #90ee90); background: linear-gradient(to right, #eecda3, #90ee90); min-height: 100vh">
        <jsp:include page="include/Menu.jsp"></jsp:include>
        <div class="container">
            <div class="row">
                <div class="col">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="loaddata">Trang Chủ</a></li>
<!--                            <li class="breadcrumb-item"><a href="#">Danh Mục</a></li>-->
<!--                            <li class="breadcrumb-item active" aria-current="#">Sub-category</li>-->

                            <li class="breadcrumb-item active" aria-current="#">
                               
                            <c:set var="groupSize" value="3" /> 
                            <c:set var="currentPage" value="${mooc}" />
                            <c:set var="totalPages" value="${endP}" />

                            <c:set var="firstPageInGroup" value="${(currentPage - 1) - (currentPage - 1) % groupSize + 1}" />

                            <c:choose>
                                <c:when test="${firstPageInGroup > groupSize}">
                                    <a href="paging?index=${1}" >Đầu</a>
                                    <a href="paging?index=${firstPageInGroup - groupSize}" class="btn btn-success">Trước</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="paging?index=${1}" >Đầu</a>
                                </c:otherwise>
                            </c:choose>

                            <c:forEach begin="${firstPageInGroup}" end="${firstPageInGroup + groupSize - 1}" var="i">
                                <c:choose>
                                    <c:when test="${i <= totalPages}">
                                        <c:set var="backgroundStyle" value="${currentPage == i ? 'background-color: red;' : ''}" />
                                        <a href="paging?index=${i}"  style="${backgroundStyle}">${i}</a>
                                    </c:when>
                                    <c:otherwise>
                                        <!-- ko lam gi ca -->

                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>

                            <c:choose>
                                <c:when test="${firstPageInGroup + groupSize <= totalPages}">
                                    <a href="paging?index=${firstPageInGroup + groupSize}" class="btn btn-success">Tiếp</a>
                                </c:when>
                            </c:choose>


               

                        </li>
                            
                            
                            
                         
                            
                        </ol>
                    </nav>
                </div>
                <form action="search" method="post" class="form-inline my-2 my-lg-0">
                        <div class="input-group input-group-sm">
                            <input name="searchProducts" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" value="${requestScope.namesearch}" placeholder="Tìm kiếm...">
                            <div class="input-group-append">
                                <button type="submit" class="btn btn-secondary btn-number">
                                    <i class="fa fa-search"></i>
                                </button>
                            </div>
                        </div>
                        <a class="btn btn-success btn-sm ml-3 bg-success" href="showcart">
                            <i class="fa fa-shopping-cart ">  Giỏ hàng </i> 
                            
                            <span class="badge badge-warning ">${size}</span>
                        </a>
                    </form>
            </div>
            
        </div>
        <div class="container">
            <div class="row">
                <div class="col-sm-3">
                    <div class="card bg-light mb-3">
                        <div class="card-header bg-success text-white text-uppercase"><i class="fa fa-list"></i> Danh Mục</div>
                        <ul class="list-group category_block">
                            <c:forEach items="${listC}" var="o">
                                
                                    <li class="list-group-item text-white ${tag == o.categoryID ? "active": "" }"><a href="cateControll?cateid=${o.categoryID}">${o.categoryName}</a></li>
                            </c:forEach>

                        </ul>
                    </div>
                    <div class="card bg-light mb-3">
                        <div class="card-header bg-success text-white text-uppercase">Sản Phẩm Bán Chạy</div>
                        <div class="card-body">
                            <img class="img-fluid" src="${newP.image}" />
                            <h5 class="card-title">${newP.name}</h5>
                            <p class="card-text">${newP.title}</p>
                            <p class="bloc_left_price">${newP.price} $</p>
                        </div>
                    </div>
                        
                        <div class="sidebar__item">
                            <h4>Price</h4>
                            <div id="price-slider"></div>
                            <div class="range-slider">
                                <div class="price-input">
                                    <input type="text" id="minamount">
                                    <input type="text" id="maxamount">
                                </div>
                            </div>
                        </div>


                        
                        
                    
                        <div class="card bg-light mb-3">
                            <div class="card-header bg-success text-white text-uppercase">Sản Phẩm Mới</div>
                            <c:forEach items="${listNew}" var="pnew">
                            <div class="card-body">
                                  
                                <div class="bg-secondary bg-success  rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">New</div>
                               
                                <img class="img-fluid" src="${pnew.image}" />
                               
                                <h5 class="card-title">${pnew.productName}</h5>
                                   <p class="btn btn-danger btn-block">${pnew.price} $</p>
                                   <p class="card-text"> Số Lượng  :${pnew.quantity}</p>
                            
                            </div>
                                    </c:forEach>
                        </div>
                   
                </div>

            <div class="col-sm-9">
                <div class="row ">
                    <c:forEach items="${requestScope.listP}" var="o">
                        <div class="col-12 col-md-12 col-lg-4 ">
                            
                            <div class="card">
<!--                               <img class="card-img-top" src="${o.image}" alt="Card image cap" style="width: 208px; height: 208px;">-->
                                <div class="card">
                                    <div class="position-relative">
                                        <a href="detail?pid=${o.productID}"> <img class="card-img-top" src="${o.image}" alt="Card image cap" style="width: 208px; height: 208px;"></a>
                                        <div class="buy-now-text">Mua Ngay </div>
                                    </div>

                                </div>

                                <div class="card-body ">
                                    <h4 class="card-title show_txt "><a href="detail?pid=${o.productID}" title="Xem Chi Tiết Sản Phẩm">${o.productName}</a></h4>
                                    <p class="card-text show_txt">${o.importDate}</p>
                                    <div class="row">
                                        <div class="col">
                                            <p class="btn btn-danger btn-block">  ${o.price} $ </p>
                                        </div>
                                        <div class="col">
                                            <a href="buy?id=${o.productID}"  class="btn btn-success btn-block">Thêm Vào Giỏ Hàng</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>

        </div>
                        
                           
                        
        </div>

                            <jsp:include page="include//Footer.jsp" ></jsp:include>
    </body>
    <script>
        
        
        
    </script>
</html>

