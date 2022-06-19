package controller;

import javax.activation.DataHandler;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.Enumeration;
import java.util.Properties;

@WebServlet(name = "SendEmailControl", value = "/contact")
public class SendEmailControl extends HttpServlet {

    public SendEmailControl(){
        super();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher rd = req.getRequestDispatcher("contact.jsp");
        rd.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        final String username = "laptrinhweb07@gmail.com";
        final String password = "webteam07 ";
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gamil.com");
        prop.put("mail.smtp.port", "smtp.gamil.com");
        prop.put("mail.smtp.auth", "smtp.gamil.com");
        prop.put("mail.smtp.starttls.enable", "true");
        Session session = Session.getInstance(prop, new Authenticator(){
            protected PasswordAuthentication getPasswordAuthentication(){
                return new PasswordAuthentication(username,password);
            }
        });
        String emailTo = req.getParameter("email");
        String emailName = req.getParameter("emailName");
        try{
            Message message = new MimeMessage(session) ;
                message.setFrom(new InternetAddress(username));
                message.setRecipients(
                        Message.RecipientType.TO,
                        InternetAddress.parse(emailTo)
                        );
            Transport.send(message);
            message.setSubject("Nhóm Lập trình 07 xin chào");
            message.setText("Cảm ơn"+emailName+"đã quan tâm đến sản phẩm của đội ngũ nhóm 07");
        }
        catch(Exception e){
            System.out.println(e);
        }
    }
}
