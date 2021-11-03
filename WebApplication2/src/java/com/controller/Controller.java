
package com.controller;

import com.beans.AllocateBean;
import com.beans.AllocaterequestBean;
import com.beans.ComplaintBean;
import com.beans.ComplaintsBean;
import com.beans.DeallocaterequestBean;
import com.beans.EmpCompData;
import com.beans.EmployeeOfParticular;
import com.beans.NeededDataForReallocationDisplay;
import com.beans.RequestDetails;
import com.beans.RequestTable;
import com.beans.UserTable;
import com.beans.Userclass;
import com.beans.Userdetails;
import com.beans.requesttableBean;
import com.dbconnectivity.DBConnection;
import com.google.gson.Gson;
import com.services.AllocatedUpdated;
import com.services.Adddetails;
import com.services.Complaint;
import com.services.ComplaintsFetch;
import com.services.Edit;
import com.services.Editdetails;
import com.services.Request;
import com.services.UserDetailsClass;
import com.services.allocaterequest;
import com.services.closedrequest;
import com.services.deallocatedrequest;
import com.services.getEmpCompDetailsService;
import com.services.removeUser;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


// Single controller servlet for whole application -- to hit the this servlet for diff url after 'Controller' string , * is used below in annotation
@WebServlet(name = "Controller", urlPatterns ={"/Controller","/Controller/*"})
public class Controller extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                doPost(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            // To write to the o/p stream , get the instance of print writer
            PrintWriter pw = response.getWriter();
             
            // Once the servlet is hit, check for requested url match and call corresponding functionality
            String paths[] = request.getRequestURI().split("/");
            System.out.println("URL "+request.getRequestURI());
                for(String s : paths){
                    System.out.println("Path Tokens are : "+s);}
                    if(paths[3].equals("getAllData")){
                try {
                        getAllData(request, response);
                        //pw.write("Data added");
                        
                        
                   
                } catch (Exception ex) {
                    Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
                }
                
            }else if(paths[3].equals("getRequestData")){
                try {
                        getRequestData(request, response);
                        //pw.write("Data added");
                        
                        
                   
                } catch (Exception ex) {
                    Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
                }
                
            }
                    else if(paths[3].equals("allocateStaff")){
                try {
                        allocateStaff(request, response);
                        //pw.write("Data added");
                        
                        
                   
                } catch (Exception ex) {
                    Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
                }
                
            }else if(paths[3].equals("getAllocatedData")){
                try {
                        getAllocatedData(request, response);
                        //pw.write("Data added");
                        
                        
                   
                } catch (Exception ex) {
                    Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
                }
                
            }else if(paths[3].equals("getComplaintsData")){
                try {
                        getComplaintsData(request, response);
                        //pw.write("Data added");
                        
                        
                   
                } catch (Exception ex) {
                    Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
                }
          
                
    }else if(paths[3].equals("getEmployeeOfParticular")){
                try {
                        getEmployeeOfParticular(request, response);
                        //pw.write("Data added");
                        
                        
                   
                } catch (Exception ex) {
                    Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
                }
          
                
    }else if(paths[3].equals("getEmpCompDetails")){
                try {
                        getEmpCompDetails(request, response);
                        //pw.write("Data added");
                        
                        
                   
                } catch (Exception ex) {
                    Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
                }
          
                
    }if(paths[3].equals("reallocateStaff")){
                try {
                        getreallocatedData(request, response);
                        //pw.write("Data added");
                        
                        
                   
                } catch (Exception ex) {
                    Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
                }
          
                
    }
    /* Admin Files ***************************************************************/
    else if(paths[3].equals("fetchuserdetails")){
        System.out.println("fetching of details has been done...");
        try {
            fetchuserdetails(request, response);
        } catch (Exception ex) {
            Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    else if(paths[3].equals("updatedetails")){
        System.out.println("details has been updated");
        try {
            updatedetails(request, response);
        } catch (Exception ex) {
            Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    else if(paths[3].equals("removeUser1")){
        System.out.println("details has been deleted");
        try {
            removeUser1(request, response);
        } catch (Exception ex) {
            Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    else if(paths[3].equals("adduser")){
        System.out.println("user details has been added...");
        try {
            adduser(request, response);
        } catch (Exception ex) {
            Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    /*Staff **************************************************************/
    else if(paths[3].equals("allocateddata")){
        System.out.println("here data allocation is done...");
        try {
            allocateddata(request, response);
        } catch (Exception ex) {
            Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    else if(paths[3].equals("deallocateddata")){
        System.out.println("here data allocation is done...");
        try {
            deallocateddata(request, response);
        } catch (Exception ex) {
            Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
                
    else if(paths[3].equals("updateProgress")){
        System.out.println("here data allocation is done...");
        try {
            updateProgress(request, response);
        } catch (Exception ex) {
            Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    else if(paths[3].equals("updateStatus")){
        System.out.println("here data allocation is done...");
        try {
            updateStatus(request, response);
        } catch (Exception ex) {
            Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    else if(paths[3].equals("closedrequestData")){
        System.out.println("here data allocation is done...");
        try {
            closedrequestData(request, response);
        } catch (Exception ex) {
            Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    else if(paths[3].equals("userdetailsData")){
        System.out.println("here data allocation is done...");
        try {
            userdetailsData(request, response);
        } catch (Exception ex) {
            Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    else if(paths[3].equals("allocatedrequestData")){
        System.out.println("here data allocation is done...");
        try {
            allocatedrequestData(request, response);
        } catch (Exception ex) {
            Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    else if(paths[3].equals("updateuserDetails")){
        System.out.println("here data allocation is done...");
        try {
            updateuserDetails(request, response);
        } catch (Exception ex) {
            Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
                /*Employee-------------------------------------------------------------------------------*/
    else if (paths[3].equals("addRequest")){
        try{
            addRequest(request, response);
        }catch(Exception ex){
            Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    else if (paths[3].equals("fetchRequest")){
        try{
            System.out.println("Inside fetch req");
            fetchRequest(request, response);
        }catch(Exception ex){
            Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    else if (paths[3].equals("fetchAllocatedData")){
        try{
            System.out.println("Inside demo");
            fetchAllocatedData(request, response);
        }catch(Exception ex){
            Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    else if (paths[3].equals("updateClosedRequest")){
        try{
            System.out.println("Inside demo");
            updateClosedRequest(request, response);
        }catch(Exception ex){
            Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
        }
    }else if (paths[3].equals("fetchClosedRequest")){
        try{
            System.out.println("Inside demo");
            fetchClosedRequest(request, response);
        }catch(Exception ex){
            Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
        }
    }else if (paths[3].equals("updateReopenRequest")){
        try{
            System.out.println("Inside demo");
            updateReopenRequest(request, response);
        }catch(Exception ex){
            Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
        }
    }else if (paths[3].equals("updateComplaintRequest")){
        try{
            System.out.println("Inside demo");
            updateComplaintRequest(request, response);
        }catch(Exception ex){
            Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    else if (paths[3].equals("addComplaint")){
        try{
            System.out.println("Inside demo");
            addComplaint(request, response);
        }catch(Exception ex){
            Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    else if (paths[3].equals("updatesignUpDetails")){
        try{
            System.out.println("Inside demo");
            updatesignUpDetails(request, response);
        }catch(Exception ex){
            Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    else if (paths[3].equals("fetchPendingRequest")){
        try{
            System.out.println("Inside demo");
            fetchPendingRequest(request, response);
        }catch(Exception ex){
            Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    }

 /*-----------------------------------------------------------------------------------------------------------------------------------*/
                                        // Functionality based methods
    
/* Admin Functionalities ***************************************************************/
    protected void getAllData(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception {
        Connection con=DBConnection.getdbConnection();
        PrintWriter pw = response.getWriter();
        PreparedStatement ps = con.prepareStatement("select * from USERTABLE");
        ResultSet rs = ps.executeQuery();
        ArrayList arr = new ArrayList();
        while(rs.next()){
            Userdetails fetchdata = new Userdetails();
           
            fetchdata.setUserid(rs.getString("userid"));
            fetchdata.setPassword(rs.getString("password"));
            fetchdata.setEmail(rs.getString("email"));
            
            
            
            arr.add(fetchdata);
        }
        Gson gson = new Gson();
        String result = gson.toJson(arr);
        pw.write(result);
        rs.close();
        ps.close();
        con.close();
    }
    protected void adduser(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception
    {
        
        Adddetails logdata=new Adddetails();
        System.out.println("In adddetails..");
        PrintWriter pw = response.getWriter();
        /* Convert the stream of bytes to java string object */
        String s = this.convertStream(request);
        System.out.println("converted string : "+s);
        /* Read Json string and convert to Java Objects */
        Gson gson = new Gson();
        Userdetails userdata1 = gson.fromJson(s, Userdetails.class);
        System.out.println("Cocoa userid: "+userdata1.getUserid());
        System.out.println("Cocoa password: "+userdata1.getPassword());
        System.out.println("Cocoa firstname: "+userdata1.getFirstname());
        System.out.println("Cocoa lastname: "+userdata1.getLastname());
        System.out.println("Cocoa contact: "+userdata1.getContact());
        System.out.println("Cocoa role: "+userdata1.getRole());
        System.out.println("Cocoa designation: "+userdata1.getDesignation());
        System.out.println("Cocoa category: "+userdata1.getCategory());
        System.out.println("Cocoa status: "+userdata1.getStatus());
        System.out.println("Cocoa remarks: "+userdata1.getEmpcounter());
        System.out.println("Cocoa remarks: "+userdata1.getStaffcounter());
        System.out.println("Cocoa remarks: "+userdata1.getManagercounter());
        System.out.println("Cocoa remarks: "+userdata1.getStaffstatus());
        System.out.println("Cocoa remarks: "+userdata1.getAllcount());
        
        if(logdata.adduser(userdata1))
        {
            String result=gson.toJson(userdata1);
            pw.write("Done");
        }
        else
        {
            pw.write("Sorry");
        }
        
    }
    // 3.fetch user
    protected void fetchuserdetails(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception {
        Connection con=DBConnection.getdbConnection();
        PrintWriter pw = response.getWriter();
        PreparedStatement ps = con.prepareStatement("select * from USERTABLE");
        ResultSet rs = ps.executeQuery();
        ArrayList arr = new ArrayList();
        while(rs.next()){
            Userdetails fetchdata = new Userdetails();
            fetchdata.setCategory(rs.getString("category"));
            fetchdata.setUserid(rs.getString("userid"));
            fetchdata.setPassword(rs.getString("password"));
            fetchdata.setFirstname(rs.getString("firstname"));
            fetchdata.setLastname(rs.getString("lastname"));
            fetchdata.setContact(rs.getString("contact"));
            fetchdata.setRole(rs.getString("role"));
            fetchdata.setDesignation(rs.getString("designation"));
            fetchdata.setStatus(rs.getString("status"));
            fetchdata.setRemarks(rs.getString("remarks"));
            arr.add(fetchdata);
        }
        Gson gson = new Gson();
        String result = gson.toJson(arr);
        pw.write(result);
        rs.close();
        ps.close();
        con.close();
        
    }
    // 4.update details
    protected void updatedetails(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception
    {
        
        Editdetails db=new Editdetails();
        System.out.println("in edit details");
        PrintWriter pw = response.getWriter();
        /* Convert the stream of bytes to java string object */
        String s = this.convertStream(request);
        System.out.println("converted string : "+s);
        /* Read Json string and convert to Java Objects */
        Gson gson = new Gson();
        Userdetails rdata = gson.fromJson(s, Userdetails.class);
        
        if(db.updatedetails(rdata))
        {
            String result=gson.toJson(db);
            pw.write("details updated successfully");
        }
        else
        {
            pw.write("not updated");
        }
    }
    
    //5.delete
    protected void removeUser1(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception
    {
        
        removeUser logdata=new removeUser();
        System.out.println("remove user..");
        PrintWriter pw = response.getWriter();
        /* Convert the stream of bytes to java string object */
        String s = this.convertStream(request);
        System.out.println("converted string : "+s);
        /* Read Json string and convert to Java Objects */
        Gson gson = new Gson();
        Userdetails remove = gson.fromJson(s, Userdetails.class);
        //                System.out.println("Cocoa Fname: "+remove.getFirstname());
        //                System.out.println("Cocoa lname: "+remove.getLastname());
        //                System.out.println("Cocoa contact: "+remove.getContact());
        //                System.out.println("Cocoa userid: "+remove.getUserid());
        //                System.out.println("Cocoa designation: "+remove.getDesignation());
        //                //System.out.println("Cocoa emailid:"+remove.);
        //                System.out.println("Cocoa role: "+remove.getRole());
        //                System.out.println("Cocoa remarks: "+remove.getRemarks());
        //                System.out.println("Cocoa password: "+remove.getLastname());
        //               // System.out.println("Cocoa department: "+remove.get);
        //                System.out.println("Cocoa Status: "+remove.getStatus());
        
        if(logdata.removeUserDetails(remove))
        {
            String result=gson.toJson(remove);
            pw.write("User deatils removed successfully");
        }
        else
        {
            pw.write("User deatils not removed");
        }
        
    }
/* Manager Functionalities ***************************************************************/
protected void getreallocatedData(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception {
    ArrayList arr = new ArrayList();
    String category = "";
    String notNeededStaffid = "";
    String reqid = "";
    String dataPresent = "";
    System.out.println("In allocation of data");
    String s = this.convertStream(request);
    Gson gson = new Gson();
    ComplaintsBean com = gson.fromJson(s, ComplaintsBean.class);
    //***********************************************************
    notNeededStaffid = com.getStaffid();
    reqid = com.getReqid();
    System.out.println(notNeededStaffid);
    PrintWriter pw = response.getWriter();
    Connection con = DBConnection.getdbConnection();
    PreparedStatement ps = con.prepareStatement("select category from USERTABLE where userid = (?1)");
    ps.setString(1, com.getStaffid());
    ResultSet rs = ps.executeQuery();
    while(rs.next()){
        category = rs.getString(1);
        System.out.println("Required Category:"+category);
    }
    ps.close();
    rs.close();
    PreparedStatement ps1 = con.prepareStatement("select * from USERTABLE where userid <> (?1) and role = 'S' and allcount <> 3 and category = (?2)");
    ps1.setString(1, notNeededStaffid);
    ps1.setString(2, category);
    ResultSet rs1 = ps1.executeQuery();
    String staffid = "";
    int staffCount = 0;
    
    while (rs1.next()){
        //check if allcount ==2 so you can change status to Notavailable
        staffid = rs1.getString(1);
        staffCount = rs1.getInt(16);
        break;
    }
    System.out.println("Needed staffId:"+ staffid);
    ps1.close();
    rs1.close();
    if (!"".equals(staffid)){
        
        System.out.println("Needed staffId1");
        PreparedStatement ps2 = con.prepareStatement("update USERTABLE set staffstatus = (?1),allcount= (?2) where userid = (?3)");
        ps2.setString(3, staffid);
        if (staffCount == 2){
            System.out.println("Needed staffId2");
            ps2.setString(1, "NotAvailable");
            ps2.setInt(2, staffCount+1);
            ps2.executeUpdate();
            System.out.println("Needed staffId3");
        }else{
            System.out.println("Needed staffId4");
            ps2.setString(1, "Available");
            ps2.setInt(2, staffCount+1);
            ps2.executeUpdate();
            System.out.println("Needed staffId5");
        }
        ps2.close();
        //***********************************************************************************************************
        int previousStaffCount = 0;
        PreparedStatement ps8 = con.prepareStatement("select allcount from USERTABLE where userid = (?1)");
        ps8.setString(1, notNeededStaffid);
        ResultSet rs4 = ps8.executeQuery();
        while(rs4.next()){
            previousStaffCount = rs4.getInt(1);
        }
        rs4.close();
        ps8.close();
        
        PreparedStatement ps7 = con.prepareStatement("update USERTABLE set staffstatus = (?1),allcount= (?2) where userid = (?3)");
        ps7.setString(3, notNeededStaffid);
        if (previousStaffCount == 3){
            System.out.println("Needed staffId2");
            ps7.setString(1, "Available");
            ps7.setInt(2, previousStaffCount-1);
            ps7.executeUpdate();
            System.out.println("Needed staffId3");
        }else if(previousStaffCount == 2){
            System.out.println("Needed staffId4");
            ps7.setString(1, "Available");
            ps7.setInt(2, previousStaffCount-1);
            ps7.executeUpdate();
            System.out.println("Needed staffId5");
        }else{
            ps7.setString(1, "Available");
            ps7.setInt(2, previousStaffCount-1);
            ps7.executeUpdate();
        }
        ps7.close();
        
        //*****************************************************************************************************
        System.out.println("Needed staffId6");
        PreparedStatement ps4 = con.prepareStatement("update COMPLAINTTABLE set deallocatedstatus = (?1) where complaintid = (?2)");
        ps4.setString(2, com.getComplaintid());
        ps4.setString(1, "Notified to Staff");
        ps4.executeUpdate();
        System.out.println("Needed staffId7");
        ps4.close();

        PreparedStatement ps5 = con.prepareStatement("update ALLOCATEREQUEST set staffid =(?1),progress =(?2) where reqid =(?3)");
        ps5.setString(1, staffid);
        ps5.setString(2, "Done some part");
        ps5.setString(3, com.getReqid());
        ps5.executeUpdate();
        System.out.println("Needed staffId8");
        ps5.close();
        
        PreparedStatement ps6 = con.prepareStatement("select  * from REQUESTTABLE where reqid=(?1)");
        ps6.setString(1, com.getReqid());
        ResultSet rs2 = ps6.executeQuery();
        System.out.println("Needed staffId9");
        NeededDataForReallocationDisplay ddd = new NeededDataForReallocationDisplay();
        while(rs2.next()){
            ddd.setReqid(reqid);
            ddd.setUserid(rs2.getString(2));
            ddd.setCategory(rs2.getString(3));
            ddd.setDescr(rs2.getString(9));
            ddd.setStaffid(staffid);
            arr.add(ddd);
        }
        
        String result = gson.toJson(arr);
        System.out.println("ReAllocated Request");
        ps6.close();
        rs2.close();
        pw.write(result);
        
        
    
    
    
    }else{
        System.out.println("Needed staffId10");
        PreparedStatement ps3 = con.prepareStatement("update REQUESTTABLE set status =(?1) where reqid =(?2)");
        ps3.setString(2, com.getReqid());
        ps3.setString(1, "Pending");
        ps3.executeUpdate();
        ps3.close();
        PreparedStatement ps9 = con.prepareStatement("update COMPLAINTTABLE set deallocatedstatus = (?1) where complaintid = (?2)");
        ps9.setString(1, "Closed");
        ps9.setString(2, com.getComplaintid());
        ps9.executeUpdate();
        ps9.close();
        System.out.println("Needed staffId11");
        pw.write("No Staff Available");
        
        con.close();
    }
    
    
    
    
    
    
    
    
    
}         	
protected void getEmpCompDetails(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception {
    getEmpCompDetailsService gec = new getEmpCompDetailsService();
    System.out.println("In getEmpCompDetailsService");
    String s = this.convertStream(request);
    System.out.println(s);
    Gson gson = new Gson();
    EmpCompData allData = gson.fromJson(s, EmpCompData.class);
    PrintWriter pw = response.getWriter();
    System.out.println("Got the data of empComp");
    ArrayList arr = gec.retriveData(allData);
    System.out.println(arr);
    String result = gson.toJson(arr);
    System.out.println("Got the data of empComp1");
    pw.write(result);
    System.out.println("Got the data of empComp2");
    
}

    
protected void getAllocatedData(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception {
    AllocatedUpdated aa = new AllocatedUpdated();
    System.out.println("In AllocatedUpdated");
    PrintWriter pw = response.getWriter();
    Gson gson = new Gson();
    ArrayList arr = aa.retriveData();
    String result = gson.toJson(arr);
    System.out.println("BANGBANG");
    System.out.println(result);
    System.out.println("Allocated Request");
    pw.write(result);
}
protected void getEmployeeOfParticular(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception {
    System.out.println("In getEmployeeOfParticular..");
    PrintWriter pw = response.getWriter();
    String s = this.convertStream(request);
    System.out.println("converted string : "+s);
    Gson gson = new Gson();
    EmployeeOfParticular ep = gson.fromJson(s, EmployeeOfParticular.class);
    Connection con = DBConnection.getdbConnection();
    PreparedStatement ps1 = con.prepareStatement("select * from USERTABLE where userid = (?1)");
    ps1.setString(1, ep.getEmployeeid());
    ResultSet rs = ps1.executeQuery();
    ArrayList arr = new ArrayList();
    while(rs.next()){
        UserTable u = new UserTable();
        u.setUserid(rs.getString(1));
        u.setFirstname(rs.getString(3));
        u.setLastname(rs.getString(4));
        u.setContact(rs.getInt(5));
        u.setDesignation(rs.getString(7));
        u.setEmail(rs.getString(14));
        arr.add(u);
        
    }
    String s1 = gson.toJson(arr);
    pw.write(s1);
    rs.close();
    ps1.close();
    con.close();
}

protected void getComplaintsData(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception {
    ComplaintsFetch cf = new ComplaintsFetch();
    System.out.println("In getComplaintsData");
    PrintWriter pw = response.getWriter();
    Gson gson = new Gson();
    ArrayList arr = cf.retriveComplaintsData();
    String result = gson.toJson(arr);
    System.out.println("Complaints data retrived succesfully");
    pw.write(result);
}
protected void getRequestData(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception {
    System.out.println("In GetRequestData");
    PrintWriter pw = response.getWriter();
    Connection con = DBConnection.getdbConnection();
    Gson gson = new Gson();
    PreparedStatement ps = con.prepareStatement("select * from REQUESTTABLE where status = 'Pending'");
    ResultSet rs = ps.executeQuery();
    ArrayList arr = new ArrayList();
    ArrayList arr1 = new ArrayList();
    ComplaintsFetch bad = new ComplaintsFetch();
    arr1 = bad.retriveComplaintsData();
    System.out.println("GET REQUEST DATA");
    while (rs.next()) {
                        RequestTable req = new RequestTable();
                        req.setUserid(rs.getString("userid"));
                        req.setReqid(rs.getString(1));
                        req.setCategory(rs.getString(3));
                        req.setBuildingnumber(rs.getString(4));
                        req.setEccnumber(rs.getString(5));
                        req.setCabinnumber(rs.getString(6));
                        req.setRoomnumber(rs.getString(7));
                        req.setFloor(rs.getString(8));
                        req.setDescription(rs.getString(9));
                        req.setStatus(rs.getString(10));
                        req.setBadge(arr1.size());
                        arr.add(req);
        }
    if(arr.size() == 0){
        RequestTable req = new RequestTable();
        req.setBadge(arr1.size());
        req.setUserid("0");
        arr.add(req);
    }
    System.out.println(arr);
    System.out.println("GET REQUEST DATA123");
    String result = gson.toJson(arr);
    pw.write(result);
    rs.close();
    ps.close();
    con.close();
}

protected void allocateStaff(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception {
            String reqid = "";
            int reqTableFlag = 0;
            System.out.println("In requestDataTable..");
            PrintWriter pw = response.getWriter();
            /* Convert the stream of bytes to java string object */
            String s = this.convertStream(request);
            System.out.println("converted string : "+s);
            /* Read Json string and convert to Java Objects */
            Gson gson = new Gson();
            RequestTable req = gson.fromJson(s, RequestTable.class);
            reqid = req.getReqid();
            
            Connection con = DBConnection.getdbConnection();
            PreparedStatement ps5 = con.prepareStatement("select staffid from ALLOCATEREQUEST where reqid = (?1)");
            ps5.setString(1, reqid);
            ResultSet rs5 = ps5.executeQuery();
            while(rs5.next()){
                reqTableFlag = 1;
            }
            ps5.close();
            rs5.close();
            System.out.println("Before PrepareStatement");
            PreparedStatement ps1 = con.prepareStatement("select * from USERTABLE where category = ?1 and staffstatus = 'Available' and status = 'A'");
            System.out.println("After PrepareStatement");
            ps1.setString(1, req.getCategory());
            
            ResultSet rs = ps1.executeQuery();
            ArrayList arr = new ArrayList();
            String sid = "";
            
            int count=0;
            int min=3;
            while(rs.next()){
                if(rs.getInt("allcount")<min){
                    min=rs.getInt("allcount");
                    sid = rs.getString("userid");
                    count=rs.getInt("allcount");
                }
                
                
         
            }
            
//            int flag = 0;
//            if(!"".equals(sid)){
//                PreparedStatement ps5 = con.prepareStatement("select staffid from COMPLAINTTABLE where reqid = (?1) and staffid = (?2)");
//                ps5.setString(1, req.getReqid());
//                ps5.setString(2, sid);
//                ResultSet rs5 = ps5.executeQuery();
//                while(rs5.next()){
//                    pw.write("Sorry");
//                    flag = 1;
//                }
//                ps5.close();
//                rs5.close();
//            }
                if(reqTableFlag == 1){
                    pw.write("Sorry");
                }
                else if( !"".equals(sid)){
                   
                PreparedStatement ps2 = con.prepareStatement("insert into ALLOCATEREQUEST values(?1,?2,?3,?4)");
                ps2.setString(1, req.getReqid());
                ps2.setString(2, sid);
                ps2.setString(3, req.getManagerid());
                ps2.setString(4,"Done some part");
                
                ps2.executeQuery();
                int num=count+1;
                if(num==3){
                    PreparedStatement ps3 = con.prepareStatement("update USERTABLE set staffstatus = (?1),allcount= (?2) where userid = (?3)");
                
                ps3.setString(1, "NotAvailable");
                ps3.setInt(2, num);
                ps3.setString(3, sid);
                
                ps3.executeQuery();
                ps3.close();
                }
                else{
                    PreparedStatement ps3 = con.prepareStatement("update USERTABLE set allcount=(?1) where userid = (?2)");
                
                ps3.setInt(1, num);
                ps3.setString(2, sid);
                
                ps3.executeQuery();
                ps3.close();
                }
                
                
                
                PreparedStatement ps4 = con.prepareStatement("update REQUESTTABLE set status = (?1) where reqid = (?2) ");
                
                ps4.setString(1, "Open");
                ps4.setString(2, req.getReqid());
                
                ps4.executeQuery();
                
               pw.write(sid);
               
               ps2.close();
               ps4.close();

            }else{
                pw.write("Sorry");
            }
            ps1.close();
            rs.close();
            con.close(); 
            
            
            
}
    
    /* Staff Functionalities ***************************************************************/
    protected void allocateddata(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception{
        allocaterequest allocatedata=new allocaterequest();
        System.out.println("In openrequest..");
        PrintWriter pw = response.getWriter();
        /* Convert the stream of bytes to java string object */
        String s = this.convertStream(request);
        System.out.println("converted string : "+s);
        /* Read Json string and convert to Java Objects */
        Gson gson = new Gson();
        AllocaterequestBean allocatedata1 = gson.fromJson(s, AllocaterequestBean.class);
        //                System.out.println("Cocoa Username: "+staffdata1.getUsername());
        //                System.out.println("Cocoa Password: "+staffdata1.getPassword());
        ArrayList ar = allocatedata.retrieveData(allocatedata1);
        String result = gson.toJson(ar);
        pw.write(result);
    }
    
    protected void deallocateddata(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception{
        deallocatedrequest deallocatedata1 = new deallocatedrequest();
        System.out.println("In openrequest..");
        PrintWriter pw = response.getWriter();
        /* Convert the stream of bytes to java string object */
        String s = this.convertStream(request);
        System.out.println("converted string : "+s);
        /* Read Json string and convert to Java Objects */
        Gson gson = new Gson();
        DeallocaterequestBean deallocatedata12 = gson.fromJson(s, DeallocaterequestBean.class);
        //                System.out.println("Cocoa Username: "+staffdata1.getUsername());
        //                System.out.println("Cocoa Password: "+staffdata1.getPassword());
        ArrayList ar = deallocatedata1.retrieveData(deallocatedata12);
        String result = gson.toJson(ar);
        pw.write(result);
    }
    
    protected void closedrequestData(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception{
        closedrequest closedrequestdata1 = new closedrequest();
        System.out.println("In openrequest..");
        PrintWriter pw = response.getWriter();
        /* Convert the stream of bytes to java string object */
        String s = this.convertStream(request);
        System.out.println("converted string : "+s);
        /* Read Json string and convert to Java Objects */
        Gson gson = new Gson();
        AllocaterequestBean staffdata1 = gson.fromJson(s, AllocaterequestBean.class);
        //                System.out.println("Cocoa Username: "+staffdata1.getUsername());
        //                System.out.println("Cocoa Password: "+staffdata1.getPassword());
        ArrayList ar = closedrequestdata1.retrieveData12(staffdata1);
        String result = gson.toJson(ar);
        pw.write(result);
    }
    protected void allocatedrequestData(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception{
        closedrequest closedrequestdata1 = new closedrequest();
        System.out.println("In openrequest..");
        PrintWriter pw = response.getWriter();
        /* Convert the stream of bytes to java string object */
        String s = this.convertStream(request);
        System.out.println("converted string : "+s);
        /* Read Json string and convert to Java Objects */
        Gson gson = new Gson();
        requesttableBean staffdata1 = gson.fromJson(s, requesttableBean.class);
        //                System.out.println("Cocoa Username: "+staffdata1.getUsername());
        //                System.out.println("Cocoa Password: "+staffdata1.getPassword());
        ArrayList ar = closedrequestdata1.retrieveData123(staffdata1);
        String result = gson.toJson(ar);
        pw.write(result);
    }
    protected void userdetailsData(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception{
        UserDetailsClass obj = new UserDetailsClass();
        System.out.println("In openrequestdone..");
        PrintWriter pw = response.getWriter();
        /* Convert the stream of bytes to java string object */
        //        String s = this.convertStream(request);
        /* Read Json string and convert to Java Objects */
        Gson gson = new Gson();
        //        Staffstatusavailable staffdata1 = gson.fromJson(s, Staffstatusavailable.class);
        //                System.out.println("Cocoa Username: "+staffdata1.getUsername());
        //                System.out.println("Cocoa Password: "+staffdata1.getPassword());
        ArrayList ar = obj.retrieveData122();
        String result = gson.toJson(ar);
        pw.write(result);
    }
    protected void updateuserDetails(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception{
        UserDetailsClass obj = new UserDetailsClass();
        System.out.println("In openrequestdone..");
        PrintWriter pw = response.getWriter();
        /* Convert the stream of bytes to java string object */
        String s = this.convertStream(request);
        System.out.println("converted string : "+s);
        /* Read Json string and convert to Java Objects */
        Gson gson = new Gson();
        Userclass userdata = gson.fromJson(s, Userclass.class);
        //                System.out.println("Cocoa Username: "+staffdata1.getUsername());
        //                System.out.println("Cocoa Password: "+staffdata1.getPassword());
        if(obj.updataeData122(userdata))
        {
            String result=gson.toJson(userdata);
            pw.write("Login Success");
        }
        else
        {
            pw.write("Login Failure");
        }
    }
    
    protected void updateProgress(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception {
        allocaterequest allocater=new allocaterequest();
        System.out.println("In insertsavingdata..");
        PrintWriter pw = response.getWriter();
        /* Convert the stream of bytes to java string object */
        String s = this.convertStream(request);
        System.out.println("converted string : "+s);
        /* Read Json string and convert to Java Objects */
        Gson gson = new Gson();
        
        
        
        
        AllocaterequestBean passdata = gson.fromJson(s, AllocaterequestBean.class);
        System.out.println("asdfhgg");
        //                System.out.println("Cocoa Username: "+userdata.getUsername());
        //                System.out.println("Cocoa Password: "+userdata.getPassword());
        if(allocater.updatedata(passdata))
        {
            String result=gson.toJson(passdata);
            pw.write("Login Success");
        }
        else
        {
            pw.write("Login Failure");
        }
    }
    
    protected void updateStatus(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception {
        closedrequest closer=new closedrequest();
        System.out.println("In insertsavingdata..");
        PrintWriter pw = response.getWriter();
        /* Convert the stream of bytes to java string object */
        String s = this.convertStream(request);
        System.out.println("converted string : "+s);
        /* Read Json string and convert to Java Objects */
        Gson gson = new Gson();
        
        
        
        
        requesttableBean passdata1 = gson.fromJson(s, requesttableBean.class);
        System.out.println("asdfhgg");
        //                System.out.println("Cocoa Username: "+userdata.getUsername());
        //                System.out.println("Cocoa Password: "+userdata.getPassword());
        if(closer.updatedata1(passdata1))
        {
            String result=gson.toJson(passdata1);
            pw.write("Login Success");
        }
        else
        {
            pw.write("Login Failure");
        }
    }
    
    /* Employee functionality-----------------------------------------------------*/
    
    protected void addRequest(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception
    {
        Request req = new Request();
        System.out.println("In validateLogin..");
        PrintWriter pw = response.getWriter();
        /* Convert the stream of bytes to java string object */
        String s = this.convertStream(request);
        System.out.println("converted string : "+s);
        /* Read Json string and convert to Java Objects */
        Gson gson = new Gson();
        RequestDetails requestdata = gson.fromJson(s, RequestDetails.class);
        
        if(req.addrequest(requestdata))
        {
            String result=gson.toJson(requestdata);
            pw.write("Request raised");
        }
        else
        {
            pw.write("Request Failure");
        }
        
    }
    
    protected void addComplaint(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception
    {
        Complaint comp = new Complaint();
        System.out.println("In validateLogin..");
        PrintWriter pw = response.getWriter();
        /* Convert the stream of bytes to java string object */
        String s = this.convertStream(request);
        System.out.println("converted string : "+s);
        /* Read Json string and convert to Java Objects */
        Gson gson = new Gson();
        ComplaintBean complaintdata = gson.fromJson(s, ComplaintBean.class);
        
        if(comp.raisecomplaint(complaintdata))
        {
            String result=gson.toJson(complaintdata);
            pw.write("Complaint raised");
        }
        else
        {
            pw.write("Complaint Failure");
        }
        
    }
    
    
    
    protected void fetchRequest(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception
    {
        
        System.out.println("In fetch request..");
        Connection con = DBConnection.getdbConnection();
        PrintWriter pw = response.getWriter();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM REQUESTTABLE WHERE STATUS = 'Open'");
        ResultSet rs = ps.executeQuery();
        ArrayList arr = new ArrayList();
        
        while(rs.next()){
            RequestDetails requestdata = new RequestDetails();
            requestdata.setRequestid(rs.getString("reqid"));
            requestdata.setUserid(rs.getString("userid"));
            requestdata.setCategory(rs.getString("category"));
            requestdata.setBuildingNo(rs.getString("buildingnumber"));
            requestdata.setEccno(rs.getString("eccnumber"));
            requestdata.setCabinno(rs.getString("cabinnumber"));
            requestdata.setRoomno(rs.getString("roomnumber"));
            requestdata.setFloor(rs.getString("floor"));
            requestdata.setDescription(rs.getString("description"));
            requestdata.setStatus(rs.getString("status"));
            requestdata.setCloseddescr(rs.getString("closeddescr"));
            requestdata.setReopendescr(rs.getString("reopeneddescr"));
            requestdata.setComplaintdescr(rs.getString("complaintdescr"));
            requestdata.setClosedby(rs.getString("closedby"));
            
            arr.add(requestdata);
        }
        Gson gson = new Gson();
        String result = gson.toJson(arr);
        pw.write(result);
        rs.close();
        ps.close();
        con.close();
        
        System.out.println("Out fetch request");
        
    }
    protected void fetchPendingRequest(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception
    {
        
        System.out.println("In fetch request..");
        Connection con = DBConnection.getdbConnection();
        PrintWriter pw = response.getWriter();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM REQUESTTABLE WHERE STATUS = 'Pending'");
        ResultSet rs = ps.executeQuery();
        ArrayList arr = new ArrayList();
        
        while(rs.next()){
            RequestDetails requestdata = new RequestDetails();
            requestdata.setRequestid(rs.getString("reqid"));
            requestdata.setUserid(rs.getString("userid"));
            requestdata.setCategory(rs.getString("category"));
            requestdata.setBuildingNo(rs.getString("buildingnumber"));
            requestdata.setEccno(rs.getString("eccnumber"));
            requestdata.setCabinno(rs.getString("cabinnumber"));
            requestdata.setRoomno(rs.getString("roomnumber"));
            requestdata.setFloor(rs.getString("floor"));
            requestdata.setDescription(rs.getString("description"));
            requestdata.setStatus(rs.getString("status"));
            requestdata.setCloseddescr(rs.getString("closeddescr"));
            requestdata.setReopendescr(rs.getString("reopeneddescr"));
            requestdata.setComplaintdescr(rs.getString("complaintdescr"));
            requestdata.setClosedby(rs.getString("closedby"));
            
            arr.add(requestdata);
        }
        Gson gson = new Gson();
        String result = gson.toJson(arr);
        pw.write(result);
        rs.close();
        ps.close();
        con.close();
        
        System.out.println("Out fetch request");
        
    }
    
    protected void fetchClosedRequest(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception
    {
        
        System.out.println("In fetch request..");
        Connection con = DBConnection.getdbConnection();
        PrintWriter pw = response.getWriter();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM REQUESTTABLE WHERE STATUS = ('Closed')");
        ResultSet rs = ps.executeQuery();
        ArrayList arr = new ArrayList();
        
        while(rs.next()){
            RequestDetails requestdata = new RequestDetails();
            requestdata.setRequestid(rs.getString("reqid"));
            requestdata.setUserid(rs.getString("userid"));
            requestdata.setCategory(rs.getString("category"));
            requestdata.setBuildingNo(rs.getString("buildingnumber"));
            requestdata.setEccno(rs.getString("eccnumber"));
            requestdata.setCabinno(rs.getString("cabinnumber"));
            requestdata.setRoomno(rs.getString("roomnumber"));
            requestdata.setFloor(rs.getString("floor"));
            requestdata.setDescription(rs.getString("description"));
            requestdata.setStatus(rs.getString("status"));
            requestdata.setCloseddescr(rs.getString("closeddescr"));
            requestdata.setReopendescr(rs.getString("reopeneddescr"));
            requestdata.setComplaintdescr(rs.getString("complaintdescr"));
            requestdata.setClosedby(rs.getString("closedby"));
            
            arr.add(requestdata);
        }
        Gson gson = new Gson();
        String result = gson.toJson(arr);
        pw.write(result);
        rs.close();
        ps.close();
        con.close();
        
        System.out.println("Out fetch request");
        
    }
    
    protected void fetchAllocatedData(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception{
        System.out.println("In fetch request..");
        Connection con = DBConnection.getdbConnection();
        PrintWriter pw = response.getWriter();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM ALLOCATEREQUEST a inner join requesttable r on a.reqid = r.reqid");
        ResultSet rs = ps.executeQuery();
        ArrayList arr = new ArrayList();
        
        while(rs.next()){
            AllocateBean requestdata = new AllocateBean();
            requestdata.setReqid(rs.getString("reqid"));
            requestdata.setStaffid(rs.getString("staffid"));
            requestdata.setManagerid(rs.getString("managerid"));
            requestdata.setProgress(rs.getString("progress"));
            //            StaffBean staffdata = new StaffBean();
            //            staffdata.setRequestid((rs.getString("reqid")));
            //            staffdata.setStaffid(rs.getString("staffid"));
            //            staffdata.setStatus(rs.getString("status"));
            //            staffdata.setComplain(rs.getString("complaintdescr"));
            //            staffdata.setEmpid(rs.getString("employeeid"));
            arr.add(requestdata);
        }
        Gson gson = new Gson();
        String result = gson.toJson(arr);
        pw.write(result);
        rs.close();
        ps.close();
        con.close();
        
        System.out.println("Out fetch request");
    }
    protected void updateClosedRequest(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception{
        
        Edit bd = new Edit();
        
        PrintWriter pw = response.getWriter();
        /* Convert the stream of bytes to java string object */
        String s = this.convertStream(request);
        System.out.println("converted string : "+s);
        /* Read Json string and convert to Java Objects */
        Gson gson = new Gson();
        RequestDetails requestdata = gson.fromJson(s, RequestDetails.class);
        
        if(bd.updatecloserequest(requestdata))
        {
            String result=gson.toJson(bd);
            pw.write("data updated");
        }
        else
        {
            pw.write("data updation Failure");
        }
        
        
        
        
    }
    protected void updateReopenRequest(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception{
        
        Edit bd = new Edit();
        
        PrintWriter pw = response.getWriter();
        /* Convert the stream of bytes to java string object */
        String s = this.convertStream(request);
        System.out.println("converted string : "+s);
        /* Read Json string and convert to Java Objects */
        Gson gson = new Gson();
        RequestDetails requestdata = gson.fromJson(s, RequestDetails.class);
        
        if(bd.updatereopenrequest(requestdata))
        {
            String result=gson.toJson(bd);
            pw.write("data updated");
        }
        else
        {
            pw.write("data updation Failure");
        }
        
        
        
        
    }
    protected void updateComplaintRequest(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception{
        
        Edit bd = new Edit();
        
        PrintWriter pw = response.getWriter();
        /* Convert the stream of bytes to java string object */
        String s = this.convertStream(request);
        System.out.println("converted string : "+s);
        /* Read Json string and convert to Java Objects */
        Gson gson = new Gson();
        RequestDetails requestdata = gson.fromJson(s, RequestDetails.class);
        
        if(bd.updaterecomplaintrequest(requestdata))
        {
            String result=gson.toJson(bd);
            pw.write("data updated");
        }
        else
        {
            pw.write("data updation Failure");
        }
        
        
        
        
    }
    
    protected void updatesignUpDetails(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception{
        UserDetailsClass obj = new UserDetailsClass();
        System.out.println("In openrequestdone..");
        PrintWriter pw = response.getWriter();
        /* Convert the stream of bytes to java string object */
        String s = this.convertStream(request);
        System.out.println("converted string : "+s);
        /* Read Json string and convert to Java Objects */
        Gson gson = new Gson();
        Userclass userdata = gson.fromJson(s, Userclass.class);
        //                System.out.println("Cocoa Username: "+staffdata1.getUsername());
        //                System.out.println("Cocoa Password: "+staffdata1.getPassword());
        if(obj.updataeData1223(userdata))
        {
            String result=gson.toJson(userdata);
            pw.write("Done");
        }
        else
        {
            pw.write("Exit");
        }
    }
    
    
 /*-----------------------------------------------------------------------------------------------------------------------------------*/
                                        // Helper method for i/o stream conversion to string
    
    String convertStream(HttpServletRequest request) 
	 {

	        StringBuilder str = new StringBuilder();
	        BufferedReader buff = null;
	        String body = null;
	        try {
	            InputStream input = request.getInputStream();
	            if (input != null) {
	                buff = new BufferedReader(new InputStreamReader(input));
	                char[] charBuffer = new char[128];
	                int bytesRead = -1;
	                while ((bytesRead = buff.read(charBuffer)) > 0) {
	                    str.append(charBuffer, 0, bytesRead);
	                }
	            } else {
	                System.out.println("Input stream is empty... ");
	                str.append("");
	            }
	            body = str.toString();
	            System.out.println("Body : " + body);
	        } catch (Exception e) {	        }
			return body;
	 }
}
