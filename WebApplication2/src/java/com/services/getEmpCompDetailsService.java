/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.services;

import com.beans.EmpCompData;
import com.dbconnectivity.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author gec
 */
public class getEmpCompDetailsService {
    
    public ArrayList retriveData(EmpCompData allData) throws Exception {
        
        ArrayList arr = new ArrayList();
        Connection con = DBConnection.getdbConnection();
        PreparedStatement ps = con.prepareStatement("select * from REQUESTTABLE where reqid=(?1)");
        ps.setString(1, allData.getReqid());
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
            EmpCompData ecd = new EmpCompData();
            ecd.setReqid(rs.getString(1));
            ecd.setUserid(rs.getString(2));
            ecd.setCategory(rs.getString(3));
            ecd.setBuildingnumber(rs.getString(4));
            ecd.setEccnumber(rs.getString(5));
            ecd.setCabinnumber(rs.getString(6));
            ecd.setRoomnumber(rs.getString(7));
            ecd.setFloor(rs.getString(8));
            ecd.setStatus(rs.getString(10));
            if ("NA".equals(rs.getString("reopeneddescr"))){
                ecd.setdescription(rs.getString("description"));
            }else{
                ecd.setdescription(rs.getString("reopeneddescr"));
            }
            PreparedStatement ps1 = con.prepareStatement("select * from USERTABLE where userid=(?1)");
            ps1.setString(1, rs.getString(2));
            ResultSet rs1 = ps1.executeQuery();
            while(rs1.next()){
                System.out.println("In Result Set 1");
                ecd.setFirstname(rs1.getString(3));
                System.out.println(rs1.getString(3));
                ecd.setLastname(rs1.getString(4));
                ecd.setContact(rs1.getLong(5));
                ecd.setEmail(rs1.getString(14));
                ecd.setDesignation(rs1.getString(7));
                
            }
            arr.add(ecd);
            ps1.close();
            rs1.close();
            
            
            
       
        }
        ps.close();
        rs.close();
        con.close();
        return arr;
    }
    
}
