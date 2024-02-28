<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
        <title>Login Form</title>
<style>
        /* CSS cho biểu mẫu đăng nhập */
        #logreg-forms {
            width: 100%;
            max-width: 450px;
            padding: 15px;
            margin: 0 auto;
            border: 5px solid #28a745; /* Độ dày và màu viền khung */
            border-radius: 5px; /* Bo tròn góc khung */
            position: absolute;
            top: 40%;
            left: 50%;
            transform: translate(-50%, -50%);
        }


        .form-signin {
            padding: 15px;
            text-align: center;
        }

        /* CSS cho nền của trang */
        body {
            background-image: url('images/healthy-la-gi.jpg'); /* Đường dẫn đến ảnh nền */
            background-size: cover; /* Tùy chỉnh kích thước ảnh nền */
            background-repeat: no-repeat; /* Không lặp lại ảnh nền */
        }
        /* CSS cho nút "Đăng Ký Tài Khoản" */
        #btn-signup {
            background-color: #28a745; /* Màu nền mặc định */
            color: #fff; /* Màu chữ mặc định */
            transition: background-color 0.3s, color 0.3s; /* Hiệu ứng hover */
        }

        #btn-signup:hover {
            background-color: #dc3545; /* Màu nền khi hover (đỏ) */
            color: #fff; /* Màu chữ khi hover */
        }

    </style>

        
    </head>
    <body>
        <div id="logreg-forms" style="background-color: #eecda3; background: -webkit-linear-gradient(to right, #eecda3, #90ee90); background: linear-gradient(to right, #eecda3, #90ee90); ">
            <form class="form-signin" action="login" method="post">
                <h1 class="h3 mb-3 font-weight-normal" style="text-align: center; color: #28a745; font-size: 40px; font-weight: bolder;">Chào Bạn</h1>

               

                <c:if test="${requestScope.account == null && requestScope.userN !=null}">
                    <p class="text-danger">
                        ${ms}
                    </p>
                </c:if>

                <c:if test="${requestScope.account == null}">
                    <p class="text-danger">
                        ${messWarning}
                    </p>
                </c:if>

                <input name="user" value="${username}" type="text" id="inputEmail" class="form-control" placeholder="Tên đăng nhập" required="" autofocus="">
                <br/>
                <input name="pass" value="${password}" type="password" id="inputPassword" class="form-control" placeholder="Mật khẩu" required="">

                <div class="form-group form-check">
                    <c:if test="${username != null && password != null}">
                        <input checked="checked" name="remember" value="1" type="checkbox" class="form-check-input" id="exampleCheck1">
                    </c:if>
                        <c:if test="${username == null || password == null}">
                            <input name="remember" value="1" type="checkbox" class="form-check-input" id="exampleCheck1">
                        </c:if>
                            <label class="form-check-label" for="exampleCheck1">Ghi nhớ</label>
                    </div>

                    <button class="btn btn-success btn-block" type="submit" ><i class="fas fa-sign-in-alt"></i> Đăng Nhập</button>
                    <hr>    
                <button class="btn btn-block btn-block" type="button" id="btn-signup"><i class="fas fa-user-plus"></i> Đăng Ký Tài Khoản</button>
            </form>

            <form action="signup" method="post" class="form-signup">
                <h1 class="h3 mb-3 font-weight-normal   " style="text-align: center"> Đăng Ký</h1>
                <input name="user" type="text" id="user-name" class="form-control" placeholder="User name" required="" autofocus="">
                <input name="pass" type="password" id="user-pass" class="form-control" placeholder="Password" required autofocus="">
                <input name="repass" type="password" id="user-repeatpass" class="form-control" placeholder="Repeat Password" required autofocus="">

                <button id="btn-signup"  class="btn btn-success btn-block" type="submit"><i class="fas fa-user-plus"></i> Xác Nhận</button>
                <a href="#" id="cancel_signup"><i class="fas fa-angle-left"></i> Đăng Nhập</a>
            </form>
            <br>

        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script>
            function toggleResetPswd(e) {
                e.preventDefault();
                $('#logreg-forms .form-signin').toggle() // display:block or none
                $('#logreg-forms .form-reset').toggle() // display:block or none
            }

            function toggleSignUp(e) {
                e.preventDefault();
                $('#logreg-forms .form-signin').toggle(); // display:block or none
                $('#logreg-forms .form-signup').toggle(); // display:block or none
            }

            $(() => {
                // Login Register Form
                $('#logreg-forms #forgot_pswd').click(toggleResetPswd);
                $('#logreg-forms #cancel_reset').click(toggleResetPswd);
                $('#logreg-forms #btn-signup').click(toggleSignUp);
                $('#logreg-forms #cancel_signup').click(toggleSignUp);
            })
        </script>
    </body>
</html>