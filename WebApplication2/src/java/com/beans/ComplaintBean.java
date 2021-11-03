/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.beans;

/**
 *
 * @author gec
 */
public class ComplaintBean {
    private String reqid;
    private String staffid;
    private String complaintdescr;
    private String employeeid;
    private String complaintid;
    private String deallocatedstatus;

    /**
     * @return the reqid
     */
    public String getReqid() {
        return reqid;
    }

    /**
     * @param reqid the reqid to set
     */
    public void setReqid(String reqid) {
        this.reqid = reqid;
    }

    /**
     * @return the staffid
     */
    public String getStaffid() {
        return staffid;
    }

    /**
     * @param staffid the staffid to set
     */
    public void setStaffid(String staffid) {
        this.staffid = staffid;
    }

    /**
     * @return the complaintdescr
     */
    public String getComplaintdescr() {
        return complaintdescr;
    }

    /**
     * @param complaintdescr the complaintdescr to set
     */
    public void setComplaintdescr(String complaintdescr) {
        this.complaintdescr = complaintdescr;
    }

    /**
     * @return the employeeid
     */
    public String getEmployeeid() {
        return employeeid;
    }

    /**
     * @param employeeid the employeeid to set
     */
    public void setEmployeeid(String employeeid) {
        this.employeeid = employeeid;
    }

    /**
     * @return the complaintid
     */
    public String getComplaintid() {
        return complaintid;
    }

    /**
     * @param complaintid the complaintid to set
     */
    public void setComplaintid(String complaintid) {
        this.complaintid = complaintid;
    }

    /**
     * @return the deallocatedstatus
     */
    public String getDeallocatedstatus() {
        return deallocatedstatus;
    }

    /**
     * @param deallocatedstatus the deallocatedstatus to set
     */
    public void setDeallocatedstatus(String deallocatedstatus) {
        this.deallocatedstatus = deallocatedstatus;
    }
    
}
