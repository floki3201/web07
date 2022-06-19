package controller;

import dao.UserDAO;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

import static AES.AES.encrypt;


@WebServlet(name = "RegisterControl", value = "/register")
public class RegisterControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String re_password = request.getParameter("re_password");
        String email = request.getParameter("email");

        String reg = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$";

        System.out.println(username);
        System.out.println(password);
        System.out.println(email);
        HttpSession session = request.getSession();
        if (username.isEmpty() || password.isEmpty() || email.isEmpty() || re_password.isEmpty()) {
            session.setAttribute("error", "Dữ liệu không được để trống");
            request.getRequestDispatcher("/register.jsp").forward(request, response);

        }
        else if (!password.equals(re_password)) {
            session.setAttribute("error", "Mật khẩu không khớp");
            request.getRequestDispatcher("/register.jsp").forward(request, response);

        }
        else {

            if(!password.matches(reg)){
                session.setAttribute("error", "Mật khẩu phải có ít nhất 8 ký tự, có ít nhất 1 ký tự in hoa, 1 ký tự in thường, 1 ký tự đặc biệt và 1 số và không được có khoảng trắng");
            }

            UserDAO userDAO = new UserDAO();
            if (userDAO.checkUserEmail(email)) {
                session.setAttribute("error", "Email đã tồn tại");
                request.getRequestDispatcher("/register.jsp").forward(request, response);

            }
            else {
                userDAO.addUser(username, email, encrypt(password,"WeBteaM07"));
                session.setAttribute("success", "Đăng ký thành công");
                response.sendRedirect("/login.jsp");
            }
        }

//        request.getRequestDispatcher("/register.jsp").forward(request, response);

    }

}
