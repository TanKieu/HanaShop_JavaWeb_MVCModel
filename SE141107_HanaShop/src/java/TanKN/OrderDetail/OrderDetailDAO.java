/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TanKN.OrderDetail;

import TanKN.utils.DBUtils;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author winnh
 */
public class OrderDetailDAO implements Serializable{
    public void insertNewOrder(String OrderID,String ProductId, int quantity) throws SQLException, NamingException{
        Connection con=null;
        PreparedStatement stm=null;
        try{
            con=DBUtils.makeConnection();
            if(con!=null){
                String sql="Insert into OrdersDetail (OrderID, ProductID, Quantity) "
                        + "Values(?,?,?) ";
                stm=con.prepareStatement(sql);
                stm.setString(1, OrderID);
                stm.setString(2, ProductId );
                stm.setInt(3, quantity);
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
    public List<OrderDetailDTO> getOrderDetail(String orderID) throws SQLException, NamingException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            con = DBUtils.makeConnection();
            if(con!=null){
                String sql="Select ProductID, Quantity "
                        + " From OrdersDetail "
                        + "Where OrderID= ? ";
                stm=con.prepareStatement(sql);
                stm.setString(1, orderID);
                rs=stm.executeQuery();
                List<OrderDetailDTO> listOrder= new ArrayList<>();
                while(rs.next()){
                    String productId= rs.getString("ProductID");
                    int quantity =rs.getInt("Quantity");
                    OrderDetailDTO dto= new OrderDetailDTO(orderID, productId, quantity);
                    listOrder.add(dto);
                }
                return listOrder;
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
    public List<String> getOrderDetailByProduct(String proID) throws SQLException, NamingException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            con=DBUtils.makeConnection();
            if(con != null){
                List<String> suggestOrderID= new ArrayList<>();
                String sql="Select top(2) OrderID "
                        + "From dbo.OrdersDetail " 
                        + "Where ProductID =? "
                        + "Order by Quantity DESC";
                stm=con.prepareStatement(sql);
                stm.setString(1, proID);
                rs=stm.executeQuery();
                while(rs.next()){
                    String orderID=rs.getString("OrderID");
                    suggestOrderID.add(orderID);
                }
                return suggestOrderID;
            }
        }finally{
            if(rs != null){
                rs.close();
            }
            if(stm != null){
                stm.close();
            }
            if(con != null){
                con.close();
            }
            
        }
        return null;
    }
    public List<String> suggestProductIdByOrderID(String orderID) throws NamingException, SQLException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            List<String> suggestProIDList= new ArrayList<String>();
            con = DBUtils.makeConnection();
            if(con!=null){
                String sql="Select top(2) ProductID "
                        + " From OrdersDetail "
                        + "Where OrderID= ? "
                        + "Order by Quantity DESC ";
                stm=con.prepareStatement(sql);
                stm.setString(1, orderID);
                rs=stm.executeQuery();
                while(rs.next()){
                    String suggestProID= rs.getString("ProductID");
                    suggestProIDList.add(suggestProID);
                }
                return suggestProIDList;                 
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
}
