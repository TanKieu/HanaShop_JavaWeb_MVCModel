/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TanKN.OrderDetail;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author winnh
 */
public class OrderDetailError implements Serializable{
    private List<String> outOfStockList;

    public OrderDetailError(List<String> outOfStockList) {
        this.outOfStockList = new ArrayList<>();
        this.outOfStockList = outOfStockList;
    }

    public OrderDetailError() {
        this.outOfStockList = new ArrayList<>();
    }

    public List<String> getOutOfStockList() {
        return outOfStockList;
    }

    public void setOutOfStockList(List<String> outOfStockList) {
        this.outOfStockList = outOfStockList;
    }
    
    
}
