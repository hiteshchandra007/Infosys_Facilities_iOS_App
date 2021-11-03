package com.services;

import com.beans.RequestTable;
import com.beans.UserBean;
import com.dbconnectivity.DBConnection;
import java.sql.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class Login {

    public ArrayList validateLogin(RequestTable req) throws Exception {
        boolean isValid;
        Connection con = DBConnection.getdbConnection();

        //PreparedStatement ps = con.prepareStatement("select * from LOGINPAGE where username=?1 and password=?2");
        //Statement st = con.createStatement();
        PreparedStatement ps = con.prepareStatement("select * from REQUESTTABLE");
        //String sql = "select * from REQUESTTABLE";
        //ps.setString(1, userdata.getUsername());
        //ps.setString(2, userdata.getPassword());

        ResultSet rs = ps.executeQuery();
        ArrayList arr = new ArrayList();

        while (rs.next()) {
            req.setUserid(rs.getString("userid"));
                        req.setReqid(rs.getString(1));
                        req.setCategory(rs.getString(3));
                        req.setEccnumber(rs.getString(5));
                        req.setRoomnumber(rs.getString(7));
                        req.setFloor(rs.getString(8));
                        req.setDescription(rs.getString(9));
                        req.setStatus(rs.getString(10));
                        arr.add(req);
        }
     
        rs.close();
        //ps.close();
        ps.close();
        con.close();

        return arr;

    }

}
