package model;

import model.Payment;
import model.Product;
import model.User;

public class Order {
    private int id;
    private User user;
    private Product product;
    private Payment payment;
    private int totalPrice;
    private String date;

    public Order() {
    }

    public Order(int id, User user, Product product, Payment payment, int totalPrice, String date) {
        this.id = id;
        this.user = user;
        this.product = product;
        this.payment = payment;
        this.totalPrice = totalPrice;
        this.date = date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Payment getPayment() {
        return payment;
    }

    public void setPayment(Payment payment) {
        this.payment = payment;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
}
