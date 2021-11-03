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

/**
 *
 * @author gec
 */
public class Request {
    
    public boolean addrequest(RequestDetails requestdata) throws Exception{
        boolean isValid;
        Connection con = DBConnection.getdbConnection(); 
        
        PreparedStatement ps1 = con.prepareStatement("Select count(*) from requesttable");
        ResultSet count = ps1.executeQuery();
        count.next();
        int num = count.getInt("count(*)") + 1001;
        String c = Integer.toString(num);
        
        PreparedStatement ps = con.prepareStatement("INSERT INTO REQUESTTABLE VALUES(?1,?2,?3,?4,?5,?6,?7,?8,?9,?10,?11,?12,?13,?14)");
        ps.setString(1, "R"+c);
        ps.setString(2, requestdata.getUserid());
        ps.setString(3, requestdata.getCategory());
        ps.setString(4, requestdata.getBuildingNo());
        ps.setString(5, requestdata.getEccno());
        ps.setString(6, requestdata.getCabinno());
        ps.setString(7, requestdata.getRoomno());
        ps.setString(8, requestdata.getFloor());
        ps.setString(9, requestdata.getDescription());
        ps.setString(10, requestdata.getStatus());
        ps.setString(11, requestdata.getCloseddescr());
        ps.setString(12, requestdata.getReopendescr());
        ps.setString(13, requestdata.getComplaintdescr());
        ps.setString(14, requestdata.getClosedby());
        
        
        ps.executeUpdate();
        
//        System.out.println(rs);
        
        
        if (true){
            isValid = true;
        }else{
            isValid = false;
        }
        ps.close();
        con.close();
        
        return isValid;
    }
    
    
}
