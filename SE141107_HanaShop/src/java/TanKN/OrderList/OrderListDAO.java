/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TanKN.OrderList;

import TanKN.utils.DBUtils;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author winnh
 */
public class OrderListDAO implements Serializable{
    public void insertNewOrder(String OrderID, String CustID, Date OrderTime, float amout) throws SQLException, NamingException{
        Connection con= null;
        PreparedStatement stm= null;
        try{
            con=DBUtils.makeConnection();
            if(con!=null){
                String sql="Insert into OrderList (OrderID, CustID, OrderTime, Amout) "
                        + "Values(?,?,?,?) ";
                stm=con.prepareStatement(sql);
                stm.setString(1, OrderID);
                stm.setString(2, CustID);
                stm.setDate(3, (java.sql.Date) OrderTime);
                stm.setFloat(4, amout);
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
    public List<OrderListDTO> getOrderList(String custID) throws SQLException, NamingException{
        Connection con=null;
        PreparedStatement stm=null;
        ResultSet rs= null;
        try{
            con=DBUtils.makeConnection();
            if(con!=null){
                String sql="Select OrderID, OrderTime, Amout "
                        + "From OrderList "
                        + "Where CustID = ?";
                stm=con.prepareStatement(sql);
                stm.setString(1, custID);
                rs=stm.executeQuery();
                List<OrderListDTO> orderList=new ArrayList<>();
                while(rs.next()){
                    String OrderID=rs.getString("OrderID");
                    Date OrderdTime=rs.getDate("OrderTime");
                    float amout=rs.getFloat("Amout");
                    OrderListDTO dto = new OrderListDTO(OrderID, custID, OrderdTime, amout);
                    orderList.add(dto);
                }
                return orderList;
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
    public List<OrderListDTO> searchOrder(String orderID, String custID) throws SQLException, NamingException{
        Connection con=null;
        PreparedStatement stm=null;
        ResultSet rs= null;
        try{
            con=DBUtils.makeConnection();
            if(con!=null){
                String sql="Select OrderID, OrderTime, Amout "
                        + "From OrderList "
                        + "Where CustID = ? and OrderID like ?";
                stm=con.prepareStatement(sql);
                stm.setString(1, custID);
                stm.setString(2, "%"+orderID +"%");
                rs=stm.executeQuery();
                List<OrderListDTO> orderList=new ArrayList<>();
                while(rs.next()){
                    String OrderID=rs.getString("OrderID");
                    Date OrderdTime=rs.getDate("OrderTime");
                    float amout=rs.getFloat("Amout");
                    OrderListDTO dto = new OrderListDTO(OrderID, custID, OrderdTime, amout);
                    orderList.add(dto);
                }
                return orderList;
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
    }}
