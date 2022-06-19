<%@ page import="model.Cart" %>
<%@ page import="model.Product" %>
<%@ page import="dao.ProductDAO" %>
<%@ page import="java.util.ArrayList" %>
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
        ArrayList<Cart> cart = (ArrayList<Cart>) session.getAttribute("cart");
        ProductDAO productDAO = new ProductDAO();
        Product product = new Product();
        int total = 0;
    %>
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

    <section id="cart" class="phan-doan-p1">
        <table width="100%">
            <thead>
                <tr>
                    <td>Xoá</td>
                    <td>Ảnh</td>
                    <td>Sản phẩm</td>
                    <td>Giá</td>
                    <td>Số lượng</td>
                    <td>Tổng tiền</td>
                </tr>
            </thead>
            <tbody>
                <% if(cart != null) {%>
                <% for(Cart cartItem: cart) {
                    product = productDAO.getProductById(cartItem.getId());
                    total += cartItem.getQuantity() * product.getPrice();
                %>
                <tr>
                    <td><a href="/delete?productId=<%=product.getId()%>"><i class="far fa-times-circle"></i></a></td>
                    <td><img src="<%= product.getImage() %>" alt=""></td>
                    <td><%= product.getName() %></td>
                    <td>$<%= product.getPrice() %></td>
                    <td><input type="number" value="1" id="quantity" min="1" max="99"></td>
                    <td>$<%= product.getPrice() %></td>
                </tr>
                <% } } %>
            </tbody>
        </table>
    </section>

    <section id="cart-add" class="phan-doan-p1">
        <div id="subtotal">
            <h3>Tổng hoá đơn</h3>
            <table>
                <tr>
                    <td>Tổng giỏ hàng</td>
                    <td>$<%= total %></td>
                </tr>
                <tr>
                    <td><strong>Tổng phải thanh toán</strong></td>
                    <td><strong>$<%= total %></strong></td>
                </tr>
            </table>
            <button class="normal">Thanh toán</button>
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
    <script src="script.js"></script>
</body>

<script>

</script>

</html>



<!-- Nối thêm vào từ đây -->