/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TanKN.OrderList;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author winnh
 */
public class OrderListDTO implements Serializable{
    String orderID;
    String custID;
    Date orderTime;
    float amount;

    public OrderListDTO(String OrderID, String CustID, Date OrderTime, float amount) {
        this.orderID = OrderID;
        this.custID = CustID;
        this.orderTime = OrderTime;
        this.amount = amount;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String OrderID) {
        this.orderID = OrderID;
    }

    public String getCustID() {
        return custID;
    }

    public void setCustID(String CustID) {
        this.custID = CustID;
    }

    public Date getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Date OrderTime) {
        this.orderTime = OrderTime;
    }

    public float getAmount() {
        return amount;
    }

    public void setAmount(float amount) {
        this.amount = amount;
    }
    
    
}
