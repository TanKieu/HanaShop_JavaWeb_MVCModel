/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TanKN.Cart;

import TanKN.Products.ProductsDTO;
import java.io.Serializable;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 *
 * @author winnh
 */
public class CartObj implements  Serializable{
    Map<ProductsDTO ,Integer> itemList;
    public float amount;

    public Map<ProductsDTO, Integer> getItemList() {
        return itemList;
    }

    public float getAmount() {
        return amount;
    }
    public void calculateAmount(){
        this.amount=0;
        for(ProductsDTO pro: itemList.keySet()){
            amount+=pro.getPrice()*itemList.get(pro);
        }
        
    }

    public void addProducttoCart(ProductsDTO product){
        if(this.itemList==null){
            this.itemList=new HashMap<>();
        }
        boolean added=false;
        int quantity=1;
        for(ProductsDTO pro: itemList.keySet()){
            if((pro.getID()).equals(product.getID())){
                quantity=itemList.get(pro)+1;
                this.itemList.put(pro, quantity);
                added=true;
            }
        }
        if(added==false){
        this.itemList.put(product, quantity);
        }
    }
    public void increaseQuantity(String id){
        for(ProductsDTO pro: itemList.keySet()){
            if((pro.getID()).equals(id)){
                int quantity= itemList.get(pro)+1;
                this.itemList.put(pro, quantity);
            }
        }
    }
    public void decreaseQuantity(String id){
        for(ProductsDTO pro:itemList.keySet()){
            if((pro.getID()).equals(id)){
                int quantity= itemList.get(pro)-1;                
                this.itemList.put(pro, quantity);
                
            }
        }
    }
    public void removeProduct(String id){
        ProductsDTO dto= new ProductsDTO();
        dto.setID(id);
        if(this.itemList.containsKey(dto)){
            this.itemList.remove(dto);
        }
        calculateAmount();
    }

    
    
}
