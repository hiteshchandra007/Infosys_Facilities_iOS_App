/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.services;

//import com.beans.RequestTable;
import com.beans.AllocaterequestBean;
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
public class AllocatedUpdated {
    
    public ArrayList retriveData() throws Exception {
        //System.out.println("Allocated bchkvzdkshbvzdsfhjvb hscz ncbv");
        
        Connection con = DBConnection.getdbConnection();

        //PreparedStatement ps = con.prepareStatement("select * from LOGINPAGE where username=?1 and password=?2");
        //Statement st = con.createStatement();
        //System.out.println("Allocated bchkvzdkshbvzdsfhjvb hscz ncbv");
        PreparedStatement ps = con.prepareStatement("select * from ALLOCATEREQUEST");
        //String sql = "select * from REQUESTTABLE";
        //ps.setString(1, userdata.getUsername());
        //ps.setString(2, userdata.getPassword());
//System.out.println("Allocated bchkvzdkshbvzdsfhjvb hscz ncbv");
        ResultSet rs = ps.executeQuery();
        ArrayList arr = new ArrayList();
//System.out.println("Allocated bchkvzdkshbvzdsfhjvb hscz ncbv");
        while (rs.next()) {
            AllocaterequestBean req = new AllocaterequestBean();
            req.setReqid(rs.getString(1));
            req.setStaffid(rs.getString(2));
            req.setManagerid(rs.getString(3));
            req.setProgress(rs.getString(4));
            arr.add(req);
            //arr.add(req);
            
        }
     //System.out.println("Allocated bchkvzdkshbvzdsfhjvb hscz ncbv");
        rs.close();
        //ps.close();
        ps.close();
        con.close();

        return arr;

    }
    
}
