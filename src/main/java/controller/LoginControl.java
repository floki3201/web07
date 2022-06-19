package controller;

import dao.UserDAO;
import model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import javax.servlet.http.HttpSession;

import static AES.AES.decrypt;

@WebServlet(name = "LoginControl", value = "/login")
public class LoginControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        UserDAO userDAO = new UserDAO();

        if (userDAO.checkUser(email,password) == true) {
            HttpSession session = request.getSession();
            session.setAttribute("email", email);
            session.setAttribute("userName", userDAO.getUserName());
            response.sendRedirect("index.jsp");
        }
        else {
            response.sendRedirect("login.jsp");
        }
    }
}
