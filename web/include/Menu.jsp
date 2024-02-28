<%-- 
    Document   : Menu
    Created on : Oct 1, 2023, 11:59:52 PM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
  <!--begin of menu-->
  
  <nav  class="navbar navbar-expand-md navbar-dark bg-success" style="background-color: #eecda3; background: -webkit-linear-gradient(to right, #eecda3, #ef629f); background: linear-gradient(to right, #eecda3, #ef629f); ">
            <div class="container " style="max-width: 100%; padding: 0;">
                <a class="navbar-brand font-weight-bold" style="font-size: 30px" href="loaddata">VieOrgFarm</a>
<!--                <h1 class="fw-bold text-primary m-0">Vie<span class="text-secondary ">Org</span>Farm</h1>-->
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
                    <ul class="navbar-nav m-auto">
                        <c:if test="${sessionScope.account.roleID == 1 || sessionScope.account.roleID == 0}" >
                        <li class="nav-item">
                            <a class="nav-link font-weight-bold " href="#">Tài Khoản</a>
                        </li>
                        </c:if>
                        <c:if test="${sessionScope.account.roleID == 1}" > 
                          <li class="nav-item">
                              <a class="nav-link font-weight-bold" href="managerproduct">Quản Lý Sản Phẩm</a>
                        </li>
                        </c:if>
                        
                        <li class="nav-item">
                            <a class="nav-link font-weight-bold" href="#">Xin Chào!</a>
                        </li>   
                         
                      
                        <c:if test="${sessionScope.account != null}"  >
                            <li class="nav-item">
                                <a class="nav-link font-weight-bold" href="logout">Đăng Xuất</a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.account == null}"  >
                        <li class="nav-item">
                            <a class="nav-link font-weight-bold" href="login">Đăng Nhập</a>
                        </li>
                            </c:if>
                    </ul>
                             
<!--                    <form action="search" method="post" class="form-inline my-2 my-lg-0">
                        <div class="input-group input-group-sm">
                            <input name="txt" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" value="${requestScope.namesearch}" placeholder="Search...">
                            <div class="input-group-append">
                                <button type="submit" class="btn btn-secondary btn-number">
                                    <i class="fa fa-search"></i>
                                </button>
                            </div>
                        </div>
                        <a class="btn btn-success btn-sm ml-3 bg-primary" href="show">
                            <i class="fa fa-shopping-cart "></i> Cart
                            <span class="badge badge-light">3</span>
                        </a>
                    </form>-->
                </div>
            </div>
        </nav>
       <section class="jumbotron text-center" style="background-image: url('images/healthy-la-gi.jpg'); background-size: cover; background-position: center; border-bottom: 3px solid #007F00  ">
        <div class="container">
            <img src="images/Logo.jpg" alt="Mô tả hình ảnh" style="border-radius: 50%; width: 150px; height: 150px;">
            <h1 class="jumbotron-heading " style="font-family: 'Arial', sans-serif; font-size: 50px; color: #007F00;">
                <span style="font-family: 'Source Sans Pro', sans-serif; font-size: 36px; color: #fff; font-weight: bold;">CHẤT LƯỢNG - SỨC KHỎE </span> 

            </h1>
            <h2 class="lead text-muted mb-0 " style="font-family: 'Source Sans Pro', sans-serif; font-size: 20px; color: #fff;">
                Sản phẩm tươi ngon từ trái cây và rau củ sạch
            </h2>

        </div>
    </section>
        <!--end of menu-->