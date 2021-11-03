/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.services;

import com.beans.Userclass;
import com.dbconnectivity.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author gec
 */
public class UserDetailsClass {
    public ArrayList retrieveData122() throws Exception {
        Connection con = DBConnection.getdbConnection();
        
        PreparedStatement ps = con.prepareStatement("select * from USERTABLE");
       System.out.println("ABCDEFGHIJ");
        ResultSet rs = ps.executeQuery();
        ArrayList arr = new ArrayList();
        System.out.println("Inside the retreive DTAN");
        
        while (rs.next()) {
            System.out.println("ABCDEF");
            Userclass userdata1 = new Userclass();
//            System.out.println("Inside the retreive DTAB");
            userdata1.setUserid(rs.getString("userid"));
            userdata1.setPassword(rs.getString("password"));
            userdata1.setFirstname(rs.getString("firstname"));
            userdata1.setLastname(rs.getString("lastname"));
            userdata1.setContact(rs.getString("contact"));
            userdata1.setRole(rs.getString("role"));
            userdata1.setDesignation(rs.getString("designation"));
            userdata1.setCategory(rs.getString("category"));
            userdata1.setStatus(rs.getString("status"));
            userdata1.setRemarks(rs.getString("remarks"));
            userdata1.setEmpcounter(rs.getString("empcounter"));
            userdata1.setStaffcounter(rs.getString("staffcounter"));
            userdata1.setManagercounter(rs.getString("managercounter"));
            userdata1.setEmail(rs.getString("email"));
            userdata1.setStaffstatus(rs.getString("staffstatus"));
            arr.add(userdata1);
    }
    
            
        
        rs.close();
        ps.close();
        con.close();
        return arr;
}
    public boolean updataeData122(Userclass passdata) throws Exception {
        boolean isValid;
        Connection con = DBConnection.getdbConnection();
//        System.out.println(passdata.getPhoneNo());
        System.out.println("asdfghg");
         PreparedStatement ps = con.prepareStatement("update USERTABLE set PASSWORD=?1 where userid=?2 ");
         System.out.println("asdfghg");
            System.out.println(passdata.getPassword());
            System.out.println(passdata.getPassword());
//         System.out.println(passdata.getProgress());
        ps.setString(1, passdata.getPassword());
        ps.setString(2, passdata.getUserid());

        int rs = ps.executeUpdate();
//        ArrayList arr = new ArrayList();
//
//        while (rs.next()) {
//            arr.add(savedata1);
//        }
//            savedata1.setUsername(rs.getString("username"));
//            savedata1.setPassword(rs.getString("PASSWORD"));
//
//            arr.add(userdata);
//            System.out.println("Java Username: " + userdata.getUsername());
//            System.out.println("Java Password: " + userdata.getPassword());
//        }
//        if (arr.size() > 0) {
//            isValid = true;
//        } else {
//            isValid = false;
//        }
        if (rs>0){
            isValid = true;
            System.out.println("123456789");
        }else{
            isValid = false;
        }
//        rs.close();
        ps.close();
        con.close();

        return isValid;
}
    
    
    
    public boolean updataeData1223(Userclass passdata) throws Exception {
        boolean isValid;
        Connection con = DBConnection.getdbConnection();
//        System.out.println(passdata.getPhoneNo());
        System.out.println("asdfghg");
        
         PreparedStatement ps = con.prepareStatement("insert into USERTABLE values (?1,?2,?3,?4,?5,?6,?7,?8,?9,?10,?11,?12,?13,?14,?15,?16)");
        
        ps.setString(1, "A1001");
        ps.setString(2, passdata.getPassword());
        ps.setString(3, passdata.getFirstname());
        ps.setString(4, passdata.getLastname());
       ps.setString(5, "0");
        ps.setString(6, "A");
        ps.setString(7, "NA");
        ps.setString(8, "NA");
        ps.setString(9, "A");
        ps.setString(10, "NA");
        ps.setString(11, "0");
        ps.setString(12, "0");
        ps.setString(13, "0");
        ps.setString(14, "admin_admin@infosys.com");
        ps.setString(15, "NA");
        ps.setString(16, "0");
        

        ResultSet rs = ps.executeQuery();
//        ArrayList arr = new ArrayList();
//
//        while (rs.next()) {
//            arr.add(savedata1);
//        }
//            savedata1.setUsername(rs.getString("username"));
//            savedata1.setPassword(rs.getString("PASSWORD"));
//
//            arr.add(userdata);
//            System.out.println("Java Username: " + userdata.getUsername());
//            System.out.println("Java Password: " + userdata.getPassword());
//        }
//        if (arr.size() > 0) {
//            isValid = true;
//        } else {
//            isValid = false;
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
