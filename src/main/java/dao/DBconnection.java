package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;



public class DBconnection {
    protected Connection connection;

    public DBconnection () {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/webptit";
                String username="root";
                String password = "phiminhquang32";
                connection=DriverManager.getConnection (url, username, password);
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
            }

    }
}
