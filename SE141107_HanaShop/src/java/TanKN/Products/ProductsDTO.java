/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TanKN.Products;

import java.io.Serializable;
import java.sql.Date;
import java.util.Objects;

/**
 *
 * @author winnh
 */
public class ProductsDTO implements Serializable{
    private String ID;
    private String name;
    private String description;
    private float price;
    private Date createDate;
    private String category;
    private int quantity;
    private boolean isActice;
    private String imageURL;
    private String userID;
    private Date lastModified;

    public ProductsDTO(String ID, String name, String description, float price, Date createDate, String category, int quantity, boolean isActice, String imageURL, String userID, Date lastModified) {
        this.ID = ID;
        this.name = name;
        this.description = description;
        this.price = price;
        this.createDate = createDate;
        this.category = category;
        this.quantity = quantity;
        this.isActice = isActice;
        this.imageURL = imageURL;
        this.userID = userID;
        this.lastModified = lastModified;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 31 * hash + Objects.hashCode(this.ID);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final ProductsDTO other = (ProductsDTO) obj;
        if (!Objects.equals(this.ID, other.ID)) {
            return false;
        }
        return true;
    }



    public ProductsDTO() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public boolean isIsActice() {
        return isActice;
    }

    public void setIsActice(boolean isActice) {
        this.isActice = isActice;
    }

    public String getImageURL() {
        return imageURL;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public Date getLastModified() {
        return lastModified;
    }

    public void setLastModified(Date lastModified) {
        this.lastModified = lastModified;
    }
    
}
