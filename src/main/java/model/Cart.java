package model;

import java.util.List;

public class Cart extends Product{

    private int quantity;
    private int id;
    public Cart() {

    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


}
