/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.services;

import com.beans.AllocaterequestBean;
import com.beans.UserBean;

import com.dbconnectivity.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author gec
 */
public class allocaterequest {
    public ArrayList retrieveData(AllocaterequestBean allocatedata1) throws Exception {
        
        Connection con = DBConnection.getdbConnection();
//        System.out.println(allocatedata1.getUsername());
        PreparedStatement ps = con.prepareStatement("select * from ALLOCATEREQUEST where staffid=?1 and progress != 'Work is done'");
        ps.setString(1, allocatedata1.getStaffid());
        ResultSet rs = ps.executeQuery();
        ArrayList arr = new ArrayList();
        System.out.println("Inside the retreive DTAjk");
        
        while (rs.next()) {
            AllocaterequestBean allocatedata2 = new AllocaterequestBean();
            System.out.println(rs.getString("reqid"));
//            System.out.println("Inside the retreive DTAB");
            allocatedata2.setReqid(rs.getString("reqid"));
            allocatedata2.setStaffid(rs.getString("staffid"));
            allocatedata2.setManagerid(rs.getString("managerid"));
            allocatedata2.setProgress(rs.getString("progress"));
            
            arr.add(allocatedata2);
            
        }
        rs.close();
        ps.close();
        con.close();
        return arr;
    }
    public boolean updatedata(AllocaterequestBean passdata) throws Exception {
        boolean isValid;
        Connection con = DBConnection.getdbConnection();
//        System.out.println(passdata.getPhoneNo());
        System.out.println("asdfghg");
         PreparedStatement ps = con.prepareStatement("update ALLOCATEREQUEST set PROGRESS=?1 where reqid=?2 ");
         System.out.println("asdfghg");
         
         System.out.println(passdata.getProgress());
        ps.setString(1, passdata.getProgress());
        ps.setString(2, passdata.getReqid());

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
    
}
