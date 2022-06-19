package dao;

import model.Product;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO extends DBconnection {


    public List<Product> getAllProducts() {
        String sql = "SELECT * FROM product";
        List<Product> products = new ArrayList<Product>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps = connection.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("productId"));
                product.setName(rs.getString("productName"));
                product.setPrice(rs.getInt("productPrice"));
                product.setDescription(rs.getString("productDescription"));
                product.setImage(rs.getString("productImg"));
                product.setCategory(rs.getString("productCategory"));
                products.add(product);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return products;
    }

    public void createProduct(Product product) {
        String sql = "INSERT INTO product (name, price, description, image) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps = connection.prepareStatement(sql);
            ps.setString(1, product.getName());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateProduct(Product product) {
        String sql = "UPDATE product SET name = ?, price = ?, description = ?, image = ? WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps = connection.prepareStatement(sql);
            ps.setString(1, product.getName());
            ps.setDouble(2, product.getPrice());
            ps.setString(3, product.getDescription());
            ps.setString(4, product.getImage());
            ps.setInt(5, product.getId());
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteProduct(int id) {
        String sql = "DELETE FROM product WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Product getProductById(int id) {
        String sql = "SELECT * FROM product WHERE productId = ?";
        Product product = new Product();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                product.setId(rs.getInt("productId"));
                product.setName(rs.getString("productName"));
                product.setPrice(rs.getInt("productPrice"));
                product.setDescription(rs.getString("productDescription"));
                product.setImage(rs.getString("productImg"));
                product.setCategory(rs.getString("productCategory"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return product;
    }
}
