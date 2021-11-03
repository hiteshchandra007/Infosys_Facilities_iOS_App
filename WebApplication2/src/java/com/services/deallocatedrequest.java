/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.services;

import com.beans.AllocaterequestBean;
import com.beans.DeallocaterequestBean;
import com.dbconnectivity.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author gec
 */
public class deallocatedrequest {
    public ArrayList retrieveData(DeallocaterequestBean deallocatedata12) throws Exception {
        
        Connection con = DBConnection.getdbConnection();
        
        PreparedStatement ps = con.prepareStatement("select * from COMPLAINTTABLE where staffid=?1 and deallocatedstatus = 'Notified to Staff'");
        ps.setString(1, deallocatedata12.getStaffid());
        ResultSet rs = ps.executeQuery();
        ArrayList arr = new ArrayList();
        System.out.println("Inside the retreive DTAC");
        
        while (rs.next()) {
            
//            System.out.println("Inside the retreive DTAB");
            deallocatedata12.setReqid(rs.getString("reqid"));
            deallocatedata12.setStaffid(rs.getString("staffid"));
            deallocatedata12.setEmployeeid(rs.getString("employeeid"));
            deallocatedata12.setComplaintid(rs.getString("complaintid"));
            deallocatedata12.setDeallocatedstatus(rs.getString("deallocatedstatus"));
            arr.add(deallocatedata12);
            
        }
        rs.close();
        ps.close();
        con.close();
        return arr;
    }
}
