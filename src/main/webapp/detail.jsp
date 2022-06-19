<%@ page import="model.Product" %>
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

    <% Product product = new Product();
        product = (Product) request.getAttribute("product");
        int productId = product.getId();
    %>
    <section id="dautrang">
        <a href="index.jsp"><img src="img/logo.png" class="logo" alt=""></a>

        <div>
            <ul id="thanh-dieu-huong">
                <li><a href="index.jsp">Trang chủ</a></li>
                <li><a href="shop.jsp" class="active">Cửa hàng</a></li>
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
    <section id="chitiet-sanpham" class="phan-doan-p1">
        <div class="anh-san-pham">
            <img src="<%= product.getImage() %>" width="100%" id="MainImg" alt="">
        </div>
        <div class="anh-chi-tiet">
            <h4><%= product.getCategory() %> </h4>
            <h4><%= product.getName() %></h4>
            <h2>$<%= product.getPrice() %></h2>
            <br>
            <a href="/add-to-cart?productId=<%= productId %>">
                <button class="normal">Thêm vào giỏ hàng</button>
            </a>
            <h4>Mô tả sản phẩm</h4>
            <span><%= product.getDescription() %></span>
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
    <script>

    </script>
</body>
</html>