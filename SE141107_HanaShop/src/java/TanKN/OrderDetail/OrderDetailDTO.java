/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TanKN.OrderDetail;

import java.io.Serializable;

/**
 *
 * @author winnh
 */
public class OrderDetailDTO implements  Serializable{
    String OrderID;
    String productID;
    int quantity;

    public OrderDetailDTO(String OrderID, String productID, int quantity) {
        this.OrderID = OrderID;
        this.productID = productID;
        this.quantity = quantity;
    }

    public String getOrderID() {
        return OrderID;
    }

    public void setOrderID(String OrderID) {
        this.OrderID = OrderID;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    
}
