package controller;

import model.Cart;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "DeleteControl", value = "/delete")
public class DeleteControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("productId"));
        System.out.println(id);
        HttpSession session = request.getSession();
        ArrayList<Cart> cart = (ArrayList<Cart>) session.getAttribute("cart");

        for (int i = 0; i < cart.size(); i++) {
            if (cart.get(i).getId() == id) {
                cart.remove(i);
            }
        }

        session.setAttribute("cart", cart);
        session.setAttribute("cart-size", cart.size());
        response.sendRedirect("/cart.jsp");
    }
}
