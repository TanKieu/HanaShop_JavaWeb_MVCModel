/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TanKN.Products;

import java.io.Serializable;

/**
 *
 * @author winnh
 */
public class UpdateProductError implements Serializable{
    private String priceWrongformatError;
    private String quantityWrongformatError;

    public UpdateProductError(String priceWrongformatError, String quantityWrongformatError) {
        this.priceWrongformatError = priceWrongformatError;
        this.quantityWrongformatError = quantityWrongformatError;
    }

    public UpdateProductError() {
    }

    public String getPriceWrongformatError() {
        return priceWrongformatError;
    }

    public void setPriceWrongformatError(String priceWrongformatError) {
        this.priceWrongformatError = priceWrongformatError;
    }

    public String getQuantityWrongformatError() {
        return quantityWrongformatError;
    }

    public void setQuantityWrongformatError(String quantityWrongformatError) {
        this.quantityWrongformatError = quantityWrongformatError;
    }
    
    
}
