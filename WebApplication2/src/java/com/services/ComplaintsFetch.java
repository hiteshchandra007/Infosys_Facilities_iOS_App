/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.services;

import com.beans.ComplaintsBean;
import com.beans.RequestTable;
import com.dbconnectivity.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author gec
 */
public class ComplaintsFetch {
    public ArrayList retriveComplaintsData() throws Exception {
        ArrayList arr = new ArrayList();
        Connection con = DBConnection.getdbConnection();
         PreparedStatement ps = con.prepareStatement("select * from COMPLAINTTABLE where deallocatedstatus ='Notified to Manager' ");
         ResultSet rs = ps.executeQuery();
         while (rs.next()) {
            ComplaintsBean cb = new ComplaintsBean();
            cb.setReqid(rs.getString(1));
            cb.setStaffid(rs.getString(2));
            cb.setComplaintdescr(rs.getString(3));
            cb.setEmployeeid(rs.getString(4));
            cb.setComplaintid(rs.getString(5));
            cb.setDeallocatedstatus(rs.getString(6));
            arr.add(cb);
            
            
        }
     //System.out.println("Allocated bchkvzdkshbvzdsfhjvb hscz ncbv");
        rs.close();
        //ps.close();
        ps.close();
        con.close();
        return arr;
    }
    
}
