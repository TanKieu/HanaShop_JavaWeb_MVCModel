/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TanKN.Products;

/**
 *
 * @author winnh
 */
public class AddNewProdcutError {
    private String priceWrongformatError;
    private String quantityWrongformatError;
    private String idDuplicateError;

    public AddNewProdcutError(String priceWrongformatError, String quantityWrongformatError, String idDuplicateError) {
        this.priceWrongformatError = priceWrongformatError;
        this.quantityWrongformatError = quantityWrongformatError;
        this.idDuplicateError =idDuplicateError;
    }

    public AddNewProdcutError() {
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

    public String getIdDuplicateError() {
        return idDuplicateError;
    }

    public void setIdDuplicateError(String idDuplicateError) {
        this.idDuplicateError = idDuplicateError;
    }
    
    
    
}
