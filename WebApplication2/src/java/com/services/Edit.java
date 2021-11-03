/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.services;


import com.beans.RequestDetails;
import com.dbconnectivity.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author gec
 */
public class Edit {

     public boolean updatecloserequest(RequestDetails requestdata) throws Exception{
        boolean isValid;
        Connection con = DBConnection.getdbConnection(); 
        PreparedStatement ps = con.prepareStatement("UPDATE REQUESTTABLE SET CLOSEDDESCR = (?1), CLOSEDBY = (?2), STATUS = (?3) WHERE REQID = (?4)");
        ps.setString(1, requestdata.getCloseddescr());
        ps.setString(2, requestdata.getClosedby());
        ps.setString(3, requestdata.getStatus());
        ps.setString(4, requestdata.getRequestid());
        
        int rs = ps.executeUpdate();
        
        PreparedStatement ps1 = con.prepareStatement("UPDATE ALLOCATEREQUEST SET PROGRESS = (?1) WHERE REQID = (?2)");
        ps1.setString(1, "Work is done" );
         System.out.println(requestdata.getRequestid());
        ps1.setString(2, requestdata.getRequestid());
        
       
        
        int rs1 = ps1.executeUpdate();
        
        
        
        
        
        ArrayList arr = new ArrayList();
        
         if (rs!=0){
            isValid = true;
        }else{
            isValid = false;
        }
        ps.close();
        con.close();
        
        return isValid;
}
     public boolean updatereopenrequest(RequestDetails requestdata) throws Exception{
        boolean isValid;
        Connection con = DBConnection.getdbConnection(); 
        PreparedStatement ps = con.prepareStatement("UPDATE REQUESTTABLE SET REOPENEDDESCR = (?1), STATUS = (?2) WHERE REQID = (?3)");
        ps.setString(1, requestdata.getReopendescr());
        ps.setString(2, requestdata.getStatus());
        ps.setString(3, requestdata.getRequestid());
        
        int rs = ps.executeUpdate();
        
        ArrayList arr = new ArrayList();
        
         if (rs!=0){
            isValid = true;
        }else{
            isValid = false;
        }
        ps.close();
        con.close();
        
        return isValid;
}
      public boolean updaterecomplaintrequest(RequestDetails requestdata) throws Exception{
        boolean isValid;
        Connection con = DBConnection.getdbConnection(); 
        PreparedStatement ps = con.prepareStatement("UPDATE REQUESTTABLE SET COMPLAINTDESCR = (?1) WHERE REQID = (?2)");
        ps.setString(1, requestdata.getComplaintdescr());
        ps.setString(2, requestdata.getRequestid());
        
        int rs = ps.executeUpdate();
        
        ArrayList arr = new ArrayList();
        
         if (rs!=0){
            isValid = true;
        }else{
            isValid = false;
        }
        ps.close();
        con.close();
        
        return isValid;
}
     
     
     
}
