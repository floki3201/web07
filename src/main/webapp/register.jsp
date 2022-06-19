<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
    <title>Ecommerce Website</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>

<section id="dautrang">
    <a href="index.jsp"><img src="img/logo.png" class="logo" alt=""></a>

    <div>
        <ul id="thanh-dieu-huong">
            <li><a href="index.jsp">Trang chủ</a></li>
            <li><a href="shop.jsp">Cửa hàng</a></li>
            <li><a href="about.jsp">Về chúng tôi</a></li>
            <li><a href="contact.jsp">Liên hệ</a></li>
            <li id="lg-bag"><a href="cart.jsp"><i class="far fa-shopping-bag"></i> </a>
                <sub>
                    <% if(session.getAttribute("cart-size") != null) {%>
                    <%= session.getAttribute("cart-size") %></sub></li>
            <% } else {%>
            0</sub></li>
            <% } %>
            <% if (session.getAttribute("email") == null) { %>
            <li><a href="login.jsp">Đăng nhập</a></li>
            <% }else{  %>
            <li><a href="/logout">Đăng xuất</a></li>
            <% } %>
        </ul>
    </div>
</section>

<section id="home">
    <div class="max-width">
        <div class="home-content">
            <h3>Manage your <br>Account</h3>
            <p>Đăng nhập để lưu những món hàng bạn yêu thích và
                địa chỉ giao hàng thường xuyên của bạn.</p>
            <div class="shop-button">
                <button class="but">Mua sắm ngay</button>
                <button class="but but1">Tìm hiểu thêm</button>
            </div>
        </div>
        <div class="home-reg">
            <div class="wrapper">
                <h1>Đăng ký</h1>
                <form method="post" action="/register">
                    <input type="email" name="email" placeholder="Email"><br>
                    <input type="text" name="username" placeholder="Tên"><br>
                    <input type="password" name="password" placeholder="Mật khẩu"><br>
                    <input type="password" name="re_password" placeholder="Nhập lại mật khẩu"><br>
                    <input type="submit" class="but" value="Đăng ký" >
                </form>
                    <% String error = (String) session.getAttribute("error"); %>
                    <% if (error != null) { %>
                    <div class="error">
                        <%= error %>
                    </div>
                    <% } %>
            </div>
        </div>
    </div>
</section>

<footer class="phan-doan-p1">
    <div class="cot">
        <img class="logo" src="img/logo.png" alt="">
    </div>
    <div class="cot">
        <a href="about.jsp">Về chúng tôi</a>
        <a href="contact.jsp">Liên hệ</a>
    </div>
    <div class="cot">
        <a href="login.jsp">Đăng nhập</a>
        <a href="cart.jsp">Giỏ hàng</a>
    </div>

</footer>
</body>
<script>

</script>

</html>