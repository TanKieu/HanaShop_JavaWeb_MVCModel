/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TanKN.Products;

import TanKN.utils.DBUtils;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;

/**
 *
 * @author winnh
 */
public class ProductsDAO implements Serializable{
    public List<ProductsDTO> productList;

    public List<ProductsDTO> getProductList() {
        return productList;
    }
    public String getUrlImage(String ID) throws SQLException, NamingException{
        Connection con=null;
        PreparedStatement stm=null;
        ResultSet rs=null;
        try{
            con=DBUtils.makeConnection();
            if(con!=null){
                String sql="Select urlImage "
                        + "From Products "
                        + "Where ID=? ";
                stm=con.prepareStatement(sql);
                stm.setString(1, ID);
                rs=stm.executeQuery();
                if(rs.next()){
                    String urlImage=rs.getString("urlImage");
                    return urlImage;
                }
            }
        }finally{
            if(rs!=null){
                rs.close();
            }
            if(stm!=null){
                stm.close();
            }
            if(con!=null){
                con.close();
            }
        }
        return null;
    }
    public void searchProduct(String nameSearch, String categorySearch, float priceMin, float priceMax,int rowOff) throws SQLException, NamingException{
        Connection con=null;
        PreparedStatement stm=null;
        ResultSet rs=null;
        try{
            con=DBUtils.makeConnection();
            if(con!=null){
                String sql="Select ID, name, description, price, createDate, category, quantity,isActive,urlImage,userID,lastModified "
                        + "From \"Products\" "
                        + "Where name LIKE ? and price > ? and price < ? and category LIKE ? "
                        + "Order By createDate,name "
                        + "OFFSET ? rows "
                        + "Fetch Next 20 rows only ";
                stm=con.prepareStatement(sql);
                stm.setString(1, "%"+nameSearch+"%");
                stm.setFloat(2, priceMin);
                stm.setFloat(3, priceMax);
                stm.setString(4, "%"+categorySearch+"%");
                stm.setInt(5, rowOff);
                rs=stm.executeQuery();
                while(rs.next()){
                    String ID=rs.getString("ID");
                    String name=rs.getString("name");
                    String description=rs.getString("description");
                    float price=Float.valueOf(rs.getFloat("price"));
                    Date createDate= rs.getDate("createDate");
                    String category= rs.getString("category");
                    int quantity=rs.getInt("quantity");
                    boolean isActive=rs.getBoolean("isActive");
                    String urlImage=rs.getString("urlImage").trim();
                    String userID=rs.getString("userID");
                    Date lastModified=rs.getDate("lastModified");
                    ProductsDTO dto= new ProductsDTO(ID,name, description, price, createDate, category, quantity, isActive,urlImage,userID,lastModified);
                    if(this.productList==null){
                        this.productList=new ArrayList<>();
                    }
                    this.productList.add(dto);
                }                
            }
        }finally{
            if(rs!=null){
                rs.close();
            }
            if(stm!=null){
                stm.close();
            }
            if(con!=null)
            {
                con.close();
            }
        }
    }
    public boolean addProduct(String ID,String name, String category,String description ,Date createDate, String urlImage, float price, int quantity, boolean isActive) throws NamingException,SQLException
    {
        Connection con=null;
        PreparedStatement stm= null;
        ResultSet rs= null;
        try{
            con=DBUtils.makeConnection();
            if(con!=null){
                String sql="Insert into \"Products\"(ID,name,description,price,createDate,category,quantity,isActive,urlImage) "
                        + " Values(?,?,?,?,?,?,?,?,?)";
                stm=con.prepareStatement(sql);
                stm.setString(1, ID);
                stm.setString(2, name);
                stm.setString(3, description);
                stm.setFloat(4, price);
                stm.setDate(5, createDate);
                stm.setString(6, category);
                stm.setInt(7 , quantity);
                stm.setBoolean(8, isActive);
                stm.setString(9, urlImage);
                int row=stm.executeUpdate();
                if(row>0){
                    return true;
                }
                
            }
        }finally{
            if(rs!=null){
                rs.close();
            }
            if(stm!=null){
                stm.close();
            }
            if(con!=null){
                con.close();
            }
        }
        return false;
    }
    public boolean updateProduct(String ID,String name, String description, float price, String category, int quantity, boolean isAction, String urlImage, String userID ) throws SQLException, NamingException{
        Connection con=null;
        PreparedStatement stm= null;
        try{
            con=DBUtils.makeConnection();
            if(con!=null){
                String sql="Update \"Products\" "
                        + " Set name=?, description=?, price=?, category=?, quantity=?, isActive=?, urlImage=?, userID=?, lastModified=? "
                        + " Where ID=? ";
                Date modifiedDate= new Date(System.currentTimeMillis());
                stm=con.prepareStatement(sql);
                stm.setString(1,  name);
                stm.setString(2, description);
                stm.setFloat(3, price);
                stm.setString(4, category);
                stm.setInt(5, quantity);
                stm.setBoolean(6, isAction);
                stm.setString(7, urlImage);
                stm.setString(8, userID);
                stm.setDate(9, modifiedDate);
                stm.setString(10, ID);
                int row=stm.executeUpdate();
                if(row>0){
                    return true;
                }
            }
        }finally{
            if(stm!=null){
                stm.close();
            }
            if(con!=null){
                con.close();
            }
        }
        return false;
    }
    public boolean deleteProduct(String ID, String userID) throws SQLException, NamingException{
        Connection con=null;
        PreparedStatement stm=null;
        try{
            con=DBUtils.makeConnection();
            if(con!=null){
                String sql="Update Products "
                        + "Set isActive='false', userID=?, lastModified=?  "
                        + "Where ID=?";
                Date modifiedDate= new Date(System.currentTimeMillis());
                stm=con.prepareStatement(sql);
                stm.setString(1, userID);
                stm.setDate(2, modifiedDate);
                stm.setString(3, ID);
                int row=stm.executeUpdate();
                if(row>0){
                    return true;
                }
            }
        
        }finally{
            if(stm!=null){
                stm.close();
            }
            if(con!=null){
                con.close();
            }
        }
        return false;
    }
    public ProductsDTO getProductbyID(String ID) throws SQLException, NamingException{
        Connection con=null;
        PreparedStatement stm=null;
        ResultSet rs=null;
        try{
            con=DBUtils.makeConnection();
            if(con!=null){
                String sql="Select ID, name, description, price, createDate, category, quantity,isActive,urlImage,userID,lastModified "
                        + "From \"Products\" "
                        + "Where ID =? ";
                stm=con.prepareStatement(sql);
                stm.setString(1, ID);
                rs=stm.executeQuery();
                if(rs.next()){
                    String name=rs.getString("name");
                    String description=rs.getString("description");
                    float price=Float.valueOf(rs.getFloat("price"));
                    Date createDate= rs.getDate("createDate");
                    String category= rs.getString("category");
                    int quantity=rs.getInt("quantity");
                    boolean isActive=rs.getBoolean("isActive");
                    String urlImage=rs.getString("urlImage").trim();
                    String userID=rs.getString("userID");
                    Date lastModified=rs.getDate("lastModified");
                    ProductsDTO dto= new ProductsDTO(ID,name, description, price, createDate, category, quantity, isActive,urlImage,userID,lastModified);
                    return dto;
                }                
            }
        }finally{
            if(rs!=null){
                rs.close();
            }
            if(stm!=null){
                stm.close();
            }
            if(con!=null)
            {
                con.close();
            }
        }
        return null;
    }
    public void updateQuantity(String id ,int quantity) throws SQLException, NamingException{
        Connection con=null;
        PreparedStatement stm=null;
        try{
            con=DBUtils.makeConnection();
            if(con!=null){
            String sql="Update Products "
                    + " Set quantity=? "
                    + "Where ID=? ";
            stm=con.prepareStatement(sql);
            stm.setInt( 1   , quantity);
            stm.setString(2, id);
            stm.executeUpdate();
        }
        }finally{
            if(stm!=null){
                stm.close();
            }
            if(con!=null){
                con.close();
            }
        }
    }

}
