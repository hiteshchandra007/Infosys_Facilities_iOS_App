/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.services;

import com.beans.Userdetails;
import com.dbconnectivity.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author gec
 */
public class removeUser {
    public boolean removeUserDetails(Userdetails remove) throws Exception {
        boolean isValid;
        Connection con = DBConnection.getdbConnection();

        PreparedStatement ps = con.prepareStatement("update USERTABLE set remarks=?1, status=?2 where userid = ?3");
        
     ps.setString(1, remove.getRemarks());
      ps.setString(2, remove.getStatus());
       ps.setString(3, remove.getUserid());
       
//     ResultSet rs=ps.executeUpdate();
    int rs = ps.executeUpdate();
     
     if (rs!=0){
            isValid = true;
        } else {
            isValid = false;
        }
//        rs.close();
        ps.close();
        con.close();

        return isValid;
    }
}


