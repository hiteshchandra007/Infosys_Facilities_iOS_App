/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.services;

import com.beans.UserBean;
import com.beans.Userdetails;
import com.dbconnectivity.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author gec
 */
public class Editdetails {
     public boolean updatedetails(Userdetails userdata) throws Exception {
        boolean isValid;
        Connection con = DBConnection.getdbConnection();

        PreparedStatement ps = con.prepareStatement("update USERTABLE set firstname = (?1),lastname = (?2),contact = (?3),designation = (?4) where userid = (?5)");
        
     ps.setString(1, userdata.getFirstname());
      ps.setString(2, userdata.getLastname());
       ps.setString(3, userdata.getContact());
        ps.setString(4, userdata.getDesignation());
        ps.setString(5, userdata.getUserid());
        //ps.setString(5, userdata.getUserid());

       ResultSet rs=ps.executeQuery();
       //ArrayList arr = new ArrayList();

//        while (rs.next()) {
//            userdata.setUsername(rs.getString("username"));
//            userdata.setPassword(rs.getString("PASSWORD"));
//
//            arr.add(userdata);
//            System.out.println("Java Username: " + userdata.getUsername());
//            System.out.println("Java Password: " + userdata.getPassword());
//        }
        if (true) {
            isValid = true;
        } else {
            isValid = false;
        }
        rs.close();
        ps.close();
        con.close();

        return isValid;

    }
    
}
