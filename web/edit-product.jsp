<%-- 
    Document   : edit-product
    Created on : Oct 19, 2023, 10:31:10 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Edit Product - Dashboard Admin Template</title>
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css?family=Roboto:400,700"
    />
    <!-- https://fonts.google.com/specimen/Roboto -->
    <link rel="stylesheet" href="css/fontawesome.min.css" />
    <!-- https://fontawesome.com/ -->
    <link rel="stylesheet" href="jquery-ui-datepicker/jquery-ui.min.css" type="text/css" />
    <!-- http://api.jqueryui.com/datepicker/ -->
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <!-- https://getbootstrap.com/ -->
    <link rel="stylesheet" href="css/templatemo-style.css">
    <!--
	Product Admin CSS Template
	https://templatemo.com/tm-524-product-admin
	-->
  </head>

  <body>
    <nav class="navbar navbar-expand-xl">
      <div class="container h-100">
        <a class="navbar-brand" href="indexAdmin.jsp">
          <h1 class="tm-site-title mb-0">Product Admin</h1>
        </a>
        <button
          class="navbar-toggler ml-auto mr-0"
          type="button"
          data-toggle="collapse"
          data-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <i class="fas fa-bars tm-nav-icon"></i>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mx-auto h-100">
            <li class="nav-item">
              <a class="nav-link" href="index.html">
                <i class="fas fa-tachometer-alt"></i> Dashboard
                <span class="sr-only">(current)</span>
              </a>
            </li>
            <li class="nav-item dropdown">
              <a
                class="nav-link dropdown-toggle"
                href="#"
                id="navbarDropdown"
                role="button"
                data-toggle="dropdown"
                aria-haspopup="true"
                aria-expanded="false"
              >
                <i class="far fa-file-alt"></i>
                <span> Reports <i class="fas fa-angle-down"></i> </span>
              </a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="#">Daily Report</a>
                <a class="dropdown-item" href="#">Weekly Report</a>
                <a class="dropdown-item" href="#">Yearly Report</a>
              </div>
            </li>
            <li class="nav-item">
              <a class="nav-link active" href="manageProduct.jsp">
                <i class="fas fa-shopping-cart"></i> Products
              </a>
            </li>

            <li class="nav-item">
              <a class="nav-link" href="accounts.html">
                <i class="far fa-user"></i> Accounts
              </a>
            </li>
            <li class="nav-item dropdown">
              <a
                class="nav-link dropdown-toggle"
                href="#"
                id="navbarDropdown"
                role="button"
                data-toggle="dropdown"
                aria-haspopup="true"
                aria-expanded="false"
              >
                <i class="fas fa-cog"></i>
                <span> Settings <i class="fas fa-angle-down"></i> </span>
              </a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="#">Profile</a>
                <a class="dropdown-item" href="#">Billing</a>
                <a class="dropdown-item" href="#">Customize</a>
              </div>
            </li>
          </ul>
          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link d-block" href="login.html">
                Admin, <b>Logout</b>
              </a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <div class="container tm-mt-big tm-mb-big">
      <div class="row">
        <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
          <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
            <div class="row">
              <div class="col-12">
                <h2 class="tm-block-title d-inline-block">Chỉnh Sửa Sản Phẩm</h2>
              </div>
            </div>
            <div class="row tm-edit-product-row">
              <div class="col-xl-6 col-lg-6 col-md-12">
                <form action="update?pid=${pd.productID}" method="post" class="tm-edit-product-form">
                   
                    <c:if test="${not empty requestScope.pd}" >
                  <div class="form-group mb-3">
                      
                    <label
                      for="name"
                      >Tên Sản Phẩm
                    </label>
                    <input
                  
                      name="name"
                      type="text"
                      value="${pd.productName}"
                      class="form-control validate"
                    />
                  </div>
                      
                      <div class="form-group mb-3">
                          <label for="price">Giá</label>
                          <div class="input-group">
                              <input name="price" type="text" value="${pd.price}" class="form-control validate" />
                              <div class="input-group-append">
                                  <span class="input-group-text">VNĐ</span>
                              </div>
                          </div>
                      </div>


                  <div class="form-group mb-3">
                    <label
                      for="description"
                      >Mô Tả</label
                    >
                    <textarea                    
                      class="form-control validate tm-small"
                      rows="5"
                      required
                    > Buồn Quá Quên Update trường mô tả :((.</textarea>
                  </div>
                  <div class="form-group mb-3">
                    <label
                      for="category"
                      >Thể Loại</label
                    >
                    <select class="custom-select tm-select-accounts" name="category" >
                      <option>Chọn Loại</option>
                      <c:choose>
                          <c:when test="${pd.categoryID == 1}" >
                              <option value="1" selected>Rau</option>
                          </c:when>
                          <c:otherwise>
                              <option value="1">Rau</option>
                          </c:otherwise>                          
                      </c:choose>
                      <option value="2" ${pd.categoryID ==2 ? 'selected' : ''} >Củ</option>         
                      <option value="3" ${pd.categoryID ==3 ? 'selected' : ''} >Nấm</option>   
                      <option value="4" ${pd.categoryID == 4 ? 'selected' : ''} >Trái Cây</option>   
                    </select>
                  </div>
                  <div class="row">
                       <div class="form-group mb-3 col-xs-12 col-sm-6">
                          <label
                            for="importdate"
                            >Ngày Nhập Hàng
                          </label>
                          <input
                        
                            name="importdate"
                            type="text"
                            value="${pd.importDate}"
                            class="form-control validate"
                            data-large-mode="true"
                            pattern="\d{4}-\d{2}-\d{2}"
                            title="Nhập theo định dạng YYYY-MM-Đ (VD: 2023-10-22)"
                            required
                          />
                        </div>
                      
                      
                      <div class="form-group mb-3 col-xs-12 col-sm-6">
                          <label
                            for="usingdate"
                            >Hạn Sử Dụng
                          </label>
                          <input
                            id="usingdate"1
                            name="usingdate"
                            type="text"
                            value="${pd.usingDate}"
                            class="form-control validate"
                            data-large-mode="true"
                            pattern="\d{4}-\d{2}-\d{2}"
                            title="Nhập theo định dạng YYYY-MM-Đ (VD: 2023-10-22)"
                            required
                          />
                        </div>
                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                          <label
                            for="stock"
                            >Tồn Kho
                          </label>
                          <input
                            
                            name="stock"
                            type="text"
                            value="${pd.quantity}"
                            class="form-control validate"
                          />
                        </div>
                  </div>
                 
                  
              </div>
              <div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">
                <div class="tm-product-img-edit mx-auto">
                    <img src="${pd.image}" alt="Product image" class="img-fluid d-block mx-auto">
                  <i
                    class="fas fa-cloud-upload-alt tm-upload-icon"
                    onclick="document.getElementById('fileInput').click();"
                  ></i>
                </div>
                <div class="custom-file mt-3 mb-3">
                  <input id="fileInput" type="file" style="display:none;" />
                  <input
                    type="button"
                    class="btn btn-primary btn-block mx-auto text-uppercase"
                    value="chọn ảnh"
                    onclick="document.getElementById('fileInput').click();"
                  />
                </div>
              </div>
              <div class="col-12">
                <button type="submit" class="btn btn-primary btn-block text-uppercase">Cập Nhật</button>
              </div>
                   </c:if>
            </form>
            </div>
          </div>
        </div>
      </div>
    </div>
    <footer class="tm-footer row tm-mt-small">
        <div class="col-12 font-weight-light">
          <p class="text-center text-white mb-0 px-4 small">
                    Do Your Best
                     <br/>
                     <a href="loaddata">Home Control</a>
        </p>
        </div>
    </footer> 

    <script src="js/jquery-3.3.1.min.js"></script>
    <!-- https://jquery.com/download/ -->
    <script src="jquery-ui-datepicker/jquery-ui.min.js"></script>
    <!-- https://jqueryui.com/download/ -->
    <script src="js/bootstrap.min.js"></script>
    <!-- https://getbootstrap.com/ -->

  </body>
</html>
