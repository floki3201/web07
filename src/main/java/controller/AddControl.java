package controller;

import model.Cart;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

import static java.lang.System.out;

@WebServlet(name = "CartControl", value = "/add-to-cart")
public class AddControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        ArrayList<Cart> cart = new ArrayList<>();

        int id = Integer.parseInt(request.getParameter("productId"));
        Cart cartItem = new Cart();
        cartItem.setId(id);
        cartItem.setQuantity(1);


        ArrayList<Cart> cartItems = (ArrayList<Cart>) session.getAttribute("cart");

        if (cartItems == null) {
            cart = new ArrayList<>();
            session.setAttribute("cart", cart);
            out.println("cart is null");
        }
        else {
            cart = cartItems;
            out.println("cart is not null");
        }
        cart.add(cartItem);
        session.setAttribute("cart-size", cart.size());
//        request.getRequestDispatcher("/cart.jsp").forward(request, response);

        response.sendRedirect("/cart.jsp");


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
