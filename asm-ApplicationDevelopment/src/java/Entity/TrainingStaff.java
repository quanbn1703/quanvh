/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

/**
 *
 * @author Ngoc Do Minh
 */
public class TrainingStaff {
    private String staffID;
    private String _password;
    private String staffName;
    private String staffDoB;
    private String staffAddress;
    private String staffPhonenumber;
    private String staffEmail;
    private int role;

    public String getStaffID() {
        return staffID;
    }

    public void setStaffID(String staffID) {
        this.staffID = staffID;
    }

    public String getPassword() {
        return _password;
    }

    public void setPassword(String _password) {
        this._password = _password;
    }

    public String getStaffName() {
        return staffName;
    }

    public void setStaffName(String staffName) {
        this.staffName = staffName;
    }

    public String getStaffDoB() {
        return staffDoB;
    }

    public void setStaffDoB(String staffDoB) {
        this.staffDoB = staffDoB;
    }

    public String getStaffAddress() {
        return staffAddress;
    }

    public void setStaffAddress(String staffAddress) {
        this.staffAddress = staffAddress;
    }

    public String getStaffPhonenumber() {
        return staffPhonenumber;
    }

    public void setStaffPhonenumber(String staffPhonenumber) {
        this.staffPhonenumber = staffPhonenumber;
    }

    public String getStaffEmail() {
        return staffEmail;
    }

    public void setStaffEmail(String staffEmail) {
        this.staffEmail = staffEmail;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }
}
