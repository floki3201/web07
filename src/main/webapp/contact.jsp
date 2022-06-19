<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
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
                <li><a href="contact.jsp" class="active">Liên hệ</a></li>
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
    <section id="chitiet-lienlac" class="phan-doan-p1">
        <div class="chi-tiet">
            <span>LIÊN LẠC VỚI CHÚNG TÔI</span>
            <h2>Ghé thăm chúng tôi</h2>
            <h3>Văn phòng </h3>
            <div>
                <li>
                    <i class="fal fa-map"></i>
                    <p>Học viện Công nghệ Bưu Chính Viễn Thông </p>
                </li>
                <li>
                    <i class="far fa-envelope"></i>
                    <p>youngbach.315@gmail.com </p>
                </li>
                <li>
                    <i class="fas fa-phone-alt"></i>
                    <p>0986853388</p>
                </li>
            </div>
        </div>

        <div class="map">
            <iframe src="https://goo.gl/maps/rCUcicT6aZzCpiMJA" width="600" height="450" style="border: 0;"
                allowfullscreen="" loading="lazy"></iframe>
        </div>
    </section>
    <section id="form-chi-tiet">
        <form method="post" action="/contact">
            <span></span>
            <h2>Chúng tôi rất mong những ý kiến từ bạn</h2>
            <input type="text" name ="emailName"placeholder="Tên của bạn">
            <input type="text" name ="email" placeholder="E-mail">
<%--            <input type="text" placeholder="Chủ đề">--%>
<%--            <textarea name="" id="" cols="30" rows="10" placeholder="Nội dung"></textarea>--%>
            <button class="btn-mail">Xác nhận</button>
        </form>
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

</html>