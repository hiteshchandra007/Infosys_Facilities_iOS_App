/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.services;

import com.beans.AllocaterequestBean;

import com.beans.requesttableBean;
import com.dbconnectivity.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author gec
 */
public class closedrequest {
    public ArrayList retrieveData12(AllocaterequestBean staffdata1) throws Exception {
        
        Connection con = DBConnection.getdbConnection();
        
        PreparedStatement ps = con.prepareStatement("select * from REQUESTTABLE  where reqid in (select reqid from allocaterequest where staffid =?1) and status = 'Closed'");
       ps.setString(1, staffdata1.getStaffid());
        ResultSet rs = ps.executeQuery();
        ArrayList arr = new ArrayList();
        System.out.println("Inside the retreive DTA");
        
        while (rs.next()) {
            System.out.println("ABCDEF");
            requesttableBean closeddata = new requesttableBean();
//            System.out.println("Inside the retreive DTAB");
            closeddata.setReqid(rs.getString("reqid"));
            closeddata.setUserid(rs.getString("userid"));
            closeddata.setCategory(rs.getString("category"));
            closeddata.setBuildingnumber(rs.getString("buildingnumber"));
            closeddata.setEccnumber(rs.getString("eccnumber"));
            closeddata.setCabinnumber(rs.getString("cabinnumber"));
            closeddata.setRoomnumber(rs.getString("roomnumber"));
            closeddata.setFloor(rs.getString("floor"));
            closeddata.setDescription(rs.getString("description"));
            closeddata.setStatus(rs.getString("status"));
            closeddata.setCloseddescr(rs.getString("closeddescr"));
            closeddata.setReopeneddescr(rs.getString("reopeneddescr"));
            closeddata.setComplaintdescr(rs.getString("complaintdescr"));
            closeddata.setClosedby(rs.getString("closedby"));
            arr.add(closeddata);
            
        }
        rs.close();
        ps.close();
        con.close();
        return arr;
    }
    public ArrayList retrieveData123(requesttableBean staffdata1) throws Exception {
        
        Connection con = DBConnection.getdbConnection();
        
        PreparedStatement ps = con.prepareStatement("select * from REQUESTTABLE");
//       ps.setString(1, staffdata1.getStaffid());
        ResultSet rs = ps.executeQuery();
        ArrayList arr = new ArrayList();
        System.out.println("Inside the retreive DTA");
        
        while (rs.next()) {
            System.out.println("ABCDEF");
            requesttableBean closeddata = new requesttableBean();
//            System.out.println("Inside the retreive DTAB");
            System.out.println(rs.getString("reqid"));
            closeddata.setReqid(rs.getString("reqid"));
            closeddata.setUserid(rs.getString("userid"));
            closeddata.setCategory(rs.getString("category"));
            closeddata.setBuildingnumber(rs.getString("buildingnumber"));
            closeddata.setEccnumber(rs.getString("eccnumber"));
            closeddata.setCabinnumber(rs.getString("cabinnumber"));
            closeddata.setRoomnumber(rs.getString("roomnumber"));
            closeddata.setFloor(rs.getString("floor"));
            closeddata.setDescription(rs.getString("description"));
            closeddata.setStatus(rs.getString("status"));
            closeddata.setCloseddescr(rs.getString("closeddescr"));
            closeddata.setReopeneddescr(rs.getString("reopeneddescr"));
            closeddata.setComplaintdescr(rs.getString("complaintdescr"));
            closeddata.setClosedby(rs.getString("closedby"));
            arr.add(closeddata);
            
        }
        rs.close();
        ps.close();
        con.close();
        return arr;
    }
    
       public boolean updatedata1(requesttableBean passdata1) throws Exception {
        boolean isValid;
        Connection con = DBConnection.getdbConnection();
//        System.out.println(passdata.getPhoneNo());
        System.out.println("asdfghg");
         PreparedStatement ps = con.prepareStatement("update REQUESTTABLE set CLOSEDDESCR=?1,CLOSEDBY =?2,STATUS = 'Closed' where reqid=?3 ");
         System.out.println("asdfghg");
         
         System.out.println(passdata1.getStatus());
        ps.setString(1, passdata1.getCloseddescr());
        ps.setString(2, passdata1.getClosedby());
        ps.setString(3, passdata1.getReqid());
        int rs = ps.executeUpdate();
        
        
        
        PreparedStatement ps1 = con.prepareStatement("update ALLOCATEREQUEST set PROGRESS='Work is done' where reqid=?1 ");
         System.out.println("asdfghg");
         
    
        
        
        ps1.setString(1, passdata1.getReqid());
        int rs1 = ps1.executeUpdate();
        
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
        if (rs>0 && rs1>0){
            isValid = true;
            System.out.println("12345678910");
        }else{
            isValid = false;
        }
//        rs.close();
        ps.close();
        con.close();

        return isValid;
}
}
