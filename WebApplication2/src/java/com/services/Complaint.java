/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.services;

import com.beans.ComplaintBean;
import com.beans.RequestDetails;
import com.dbconnectivity.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author gec
 */
public class Complaint {
     public boolean raisecomplaint(ComplaintBean complaintdata) throws Exception{
        boolean isValid;
        Connection con = DBConnection.getdbConnection(); 
        
        PreparedStatement ps1 = con.prepareStatement("Select count(*) from complainttable");
        ResultSet count = ps1.executeQuery();
        count.next();
        int num = count.getInt("count(*)") + 1001;
        String c = Integer.toString(num);
        
        PreparedStatement ps = con.prepareStatement("INSERT INTO COMPLAINTTABLE VALUES(?1,?2,?3,?4,?5,?6)");
        ps.setString(1, complaintdata.getReqid());
        ps.setString(2, complaintdata.getStaffid());
        ps.setString(3, complaintdata.getComplaintdescr());
        ps.setString(4, complaintdata.getEmployeeid());
        ps.setString(5, "C" + c);
        ps.setString(6, "Notified to Manager");
        
       
        
        
        ResultSet rs = ps.executeQuery();
        
        System.out.println(rs);
        
        
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
