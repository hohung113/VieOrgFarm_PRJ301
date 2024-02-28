<%-- 
    Document   : shoppingcart
    Created on : Oct 23, 2023, 10:08:53 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Giỏ Hàng Của Bạn</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

        
        <style>

                    body {
          background: #eecda3;
          background: -webkit-linear-gradient(to right, #eecda3, #ef629f);
          background: linear-gradient(to right, #eecda3, #ef629f);
          min-height: 100vh;
        }


        </style>

    </head>

    <body>
    
        
        <div class="px-4 px-lg-0">
  <!-- For demo purpose -->
  <div class="container text-white py-5 text-center">
    <h1 class="display-4">Giỏ Hàng Thanh Toán</h1>
    <p class="lead mb-0">Mua Ngay Liền Tay </p>
    <p class="lead">Sản Phẩm Của <a href="loaddata" class="text-white font-italic">
            <u>VieOrgFarm</u></a>
    </p>
  </div>
  <!-- End -->

  <div class="pb-5">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 p-5 bg-white rounded shadow-sm mb-5">

          <!-- Shopping cart table -->
          <div class="table-responsive">
            <table class="table">
              <thead>
                <tr>
                
                  <th scope="col" class="border-0 bg-light">
                    <div class="p-2 px-3 text-uppercase">Sản Phẩm</div>
                  </th>
                  <th scope="col" class="border-0 bg-light">
                    <div class="py-2 text-uppercase">Giá</div>
                  </th>
                  <th scope="col" class="border-0 bg-light">
                    <div class="py-2 text-uppercase">Số Lượng</div>
                  </th>
                      <th scope="col" class="border-0 bg-light">
                    <div class="p-2 px-3 text-uppercase">STT</div>
                  </th>
                                    </th>
                      <th scope="col" class="border-0 bg-light">
                    <div class="p-2 px-3 text-uppercase">Thành Tiền</div>
                  </th>
                  <th scope="col" class="border-0 bg-light">
                      <div class="py-2 text-uppercase">Xóa
                      </div>
                  </th>
                </tr>
              </thead>
              <tbody>
                   <c:set value="${cart}" var="o"/>
                <c:set value="o" var="tt"/>
                <c:forEach items="${o.items}" var="i">
                      <c:set var="tt" value="${tt+1}"/>
                <tr>
                   
                  <th scope="row" class="border-0">
                    <div class="p-2">
                      <img src="${i.product.image}" alt="" width="70" class="img-fluid rounded shadow-sm">
                      <div class="ml-3 d-inline-block align-middle">
                        <h5 class="mb-0"> <a href="#" class="text-dark d-inline-block align-middle">${i.product.productName}</a></h5><span class="text-muted font-weight-normal font-italic d-block">Category:${i.product.categoryID} </span>
                      </div>
                    </div>
                  </th>
                          <td class="border-0 align-middle"><strong>
                                 $<fmt:formatNumber pattern="##.#" value="${i.price}"/>
                                  
                      </strong></td>
                  <td class="border-0 align-middle"><strong>

                          <button> <a href="process?num=-1&id=${i.product.productID}">-</a></button>

                          ${i.quantity}
                          <button> <a href="process?num=1&id=${i.product.productID}">+</a></button>

                      </strong></td>
                    <td class="border-0 align-middle"><strong>${tt}</strong></td>
                            <td class="border-0 align-middle"><strong>
                                  $<fmt:formatNumber pattern="##.#" value="${(i.price)*i.quantity}"/>

                        </strong></td>
                  <td class="border-0 align-middle"><a href="process" class="text-dark"><i class="fa fa-trash"></i></a></td>
                </tr>
                </c:forEach>
                  
              </tbody>
            </table>
          </div>
          <!-- End -->
        </div>
      </div>

      <div class="row py-5 p-4 bg-white rounded shadow-sm">
        <div class="col-lg-6">
          <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Coupon code</div>
          <div class="p-4">
            <p class="font-italic mb-4">If you have a coupon code, please enter it in the box below</p>
            <div class="input-group mb-4 border rounded-pill p-2">
              <input type="text" placeholder="Apply coupon" aria-describedby="button-addon3" class="form-control border-0">
              <div class="input-group-append border-0">
                <button id="button-addon3" type="button" class="btn btn-dark px-4 rounded-pill"><i class="fa fa-gift mr-2"></i> Mã Giảm Giá</button>
              </div>
            </div>
          </div>
          <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Ghi Chú</div>
          <div class="p-4">
            <p class="font-italic mb-4">Nếu bạn có một số thông tin cho người bán, bạn có thể để lại chúng ở ô bên dưới</p>
            <textarea name="" cols="30" rows="2" class="form-control"></textarea>
          </div>
        </div>
        <div class="col-lg-6">
          <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Thông Tin Đơn Hàng </div>
          <div class="p-4">
            <p class="font-italic mb-4">Shipping and additional costs are calculated based on values you have entered.</p>
            <ul class="list-unstyled mb-4">
              <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Tổng Giá Trị Đơn Hàng </strong><strong>$390.00</strong></li>
              <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Phí Vận Chuyển</strong><strong>$10.00</strong></li>
              <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Thuế</strong><strong>$0.00</strong></li>
              <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Tổng Cộng</strong>
                <h5 class="font-weight-bold">$  ${o.getToltalMoney()}</h5>
              </li>
            </ul><a href="shop" class="btn btn-dark rounded-pill py-2 btn-block">Tiến Hành Thanh Toán</a>
          </div>
        </div>
      </div>

    </div>
  </div>
</div>
        
        
        
        
        
        
        
        
        
        
    </body>
</html>
