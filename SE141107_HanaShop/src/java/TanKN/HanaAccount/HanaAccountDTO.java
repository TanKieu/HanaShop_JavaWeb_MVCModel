/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TanKN.HanaAccount;

import java.io.Serializable;

/**
 *
 * @author winnh
 */
public class HanaAccountDTO implements Serializable{
    private String userID;
    private String password;
    private String name;
    private boolean isAdmin;

    public HanaAccountDTO(String userID, String password, String name, boolean isAdmin) {
        this.userID = userID;
        this.password = password;
        this.name = name;
        this.isAdmin = isAdmin;
    }

    public HanaAccountDTO() {
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(boolean isAdmin) {
        this.isAdmin = isAdmin;
    }
    
}
