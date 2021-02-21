/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TanKN.HanaAccount;

import TanKN.utils.DBUtils;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;

/**
 *
 * @author winnh
 */
public class HanaAccountDAO implements Serializable{
    public HanaAccountDTO dto= new HanaAccountDTO();

    public HanaAccountDTO getDto() {
        return dto;
    }
    
    public boolean checkLogin (String userID, String password) throws NamingException, SQLException{
        Connection con= null;
        PreparedStatement stm=null;
        ResultSet rs=null;
        try{
            con=DBUtils.makeConnection();
            if(con!=null){
                String sql="Select name, isAdmin "
                        + "From HanaAccount "
                        + "Where userID= ? COLLATE SQL_Latin1_General_CP1_CS_AS and password= ? COLLATE SQL_Latin1_General_CP1_CS_AS";
                stm=con.prepareStatement(sql);
                stm.setString(1, userID);
                stm.setString(2, password);
                
                rs=stm.executeQuery();
                if(rs.next()){
                    this.dto.setUserID(userID);
                    this.dto.setName(rs.getNString("name"));
                    this.dto.setIsAdmin(rs.getBoolean("isAdmin"));
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
    public boolean checkExist(String userID) throws SQLException, NamingException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            con=DBUtils.makeConnection();
            if(con != null){
                String sql="Select name "
                        + " From HanaAccount "
                        + " Where userID = ? COLLATE SQL_Latin1_General_CP1_CS_AS";
                stm=con.prepareStatement(sql);
                stm.setString(1, userID);
                rs= stm.executeQuery();
                if(rs.next()){
                    
                    this.dto.setUserID(userID);
                    this.dto.setName(rs.getNString("name"));
                    this.dto.setIsAdmin(false);
                    return true;
                }
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
        return false;
    }
    public void insertNewClient(String userId, String name) throws SQLException, NamingException{
        Connection con = null;
        PreparedStatement stm = null;
        try{
            con = DBUtils.makeConnection();
            if(con != null){
                String sql=" Insert into HanaAccount(userID, name, isAdmin ) "
                        + " Values(?, ?, ?) ";
                stm=con.prepareStatement(sql);
                stm.setString(1, userId);
                stm.setString(2, name);
                stm.setBoolean(3, false);
                stm.executeUpdate();
            }
        }finally{
            if(stm != null){
                 stm.close();
            }
            if(con!=null){
                con.close();
            }
        }
    }
}
