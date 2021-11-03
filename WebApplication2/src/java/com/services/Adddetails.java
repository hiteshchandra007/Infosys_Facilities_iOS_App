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
public class Adddetails {
     public boolean adduser(Userdetails userdata1) throws Exception {
        boolean isValid;
         Connection con = DBConnection.getdbConnection();
         int emailFlag = 0 ;
        PreparedStatement ps1 = con.prepareStatement("select count(*) from USERTABLE where role = (?1)");
        ps1.setString(1,userdata1.getRole());
        ResultSet count = ps1.executeQuery();
        count.next();
        int num = count.getInt("count(*)")+1001;
        String c = Integer.toString(num);
        ps1.close();
        count.close();
//        PreparedStatement ps2 = con.prepareStatement("select email from USERTABLE");
//        ResultSet emailcheck = ps2.executeQuery();
//        while (emailcheck.next()){
//            if (emailcheck.getString(1) == userdata1.getEmail()){
//                
//            }
//        }

        PreparedStatement ps = con.prepareStatement("insert into USERTABLE values (?1,?2,?3,?4,?5,?6,?7,?8,?9,?10,?11,?12,?13,?14,?15,?16)");
        
        ps.setString(1, userdata1.getRole()+c);
        ps.setString(2, userdata1.getPassword());
        ps.setString(3, userdata1.getFirstname());
        ps.setString(4, userdata1.getLastname());
       ps.setString(5, userdata1.getContact());
        ps.setString(6, userdata1.getRole());
        ps.setString(7, userdata1.getDesignation());
        ps.setString(8, userdata1.getCategory());
        ps.setString(9, userdata1.getStatus());
        ps.setString(10, userdata1.getRemarks());
        ps.setString(11, userdata1.getEmpcounter());
        ps.setString(12, userdata1.getStaffcounter());
        ps.setString(13, userdata1.getManagercounter());
        ps.setString(14, userdata1.getEmail());
        ps.setString(15, userdata1.getStaffstatus());
        ps.setString(16, userdata1.getAllcount());
        

        ResultSet rs = ps.executeQuery();
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
