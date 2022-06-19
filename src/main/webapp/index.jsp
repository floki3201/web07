<%@ page import="dao.ProductDAO" %>
<%@ page import="model.Product" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<%
    ProductDAO productDAO = new ProductDAO();
    List<Product> products = productDAO.getAllProducts();
%>


<section id="dautrang">
    <a href="index.jsp"><img src="img/logo.png" class="logo" alt=""></a>

    <div>
        <ul id="thanh-dieu-huong">
            <li><a class="active" href="index.jsp">Trang chủ</a></li>
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

<section id="banner">
    <h2>TEAM 7</h2>

    <% if (session.getAttribute("email") == null) { %>
    <h1>Bán hàng công nghệ</h1>
    <% } else {  %>
    <h1>Xin chào
        <% String name = (String) session.getAttribute("userName");
            out.print(name);
        %>
    </h1>
    <% } %>



</section>

<section id="sanpham1" class="phan-doan-p1">
    <h2>Sản phẩm nổi bật</h2>
    <p>Bộ sưu tập Laptop</p>
    <div class="ngan-san-pham">
        <% for (Product product : products) {
            int id = product.getId();
            if(product.getCategory().equals("Laptop")){ %>
        <div class="san-pham" onclick="window.location.href='detail?productId=<%= id %>';">
            <img src="<%= product.getImage() %>" alt="">
            <div class="mo-ta">
                <span><%= product.getCategory() %></span>
                <h5><%= product.getName() %></h5>
                <h4><%= product.getPrice() %>$</h4>
            </div>
            <a href="#"><i class="fal fa-shopping-cart cart"></i></a>
        </div>
        <% } } %>
    </div>
</section>

<section id="sanpham2" class="phan-doan-p1">
    <h2>Sản phẩm nổi bật</h2>
    <p>Bộ sưu tập điện thoại</p>
    <div class="ngan-san-pham">
        <% for (Product product : products) {
            int id = product.getId();
            if(product.getCategory().equals("Phone")){ %>
        <div class="san-pham" onclick="window.location.href='detail?productId=<%= id %>';">
            <img src="<%= product.getImage() %>" alt="">
            <div class="mo-ta">
                <span><%= product.getCategory() %></span>
                <h5><%= product.getName() %></h5>
                <h4>$<%= product.getPrice() %></h4>
            </div>
            <a href="detail?productId=<%= id %>"><i class="fal fa-shopping-cart cart"></i></a>
        </div>
        <% } } %>
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

