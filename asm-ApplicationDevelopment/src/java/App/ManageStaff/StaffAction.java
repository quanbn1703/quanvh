/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package App.ManageStaff;

import Entity.TrainingStaff;
import Model.StaffDataProcess;
import Model.TrainingStaffDataProcess;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Ngoc Do Minh
 */
public class StaffAction extends ActionSupport {

    private List<TrainingStaff> listStaff = new ArrayList<TrainingStaff>();
    private String searchContent;
    private String staffID;
    private String password;
    private String staffName;
    private String staffDoB;
    private String staffPhonenumber;
    private String staffEmail;
    private String staffAddress;
    private String msg;
    private TrainingStaff staff;
    private String action;

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public TrainingStaff getStaff() {
        return staff;
    }

    public void setStaff(TrainingStaff staff) {
        this.staff = staff;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getStaffID() {
        return staffID;
    }

    public void setStaffID(String staffID) {
        this.staffID = staffID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
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

    public String getStaffPhonenumber() {
        return staffPhonenumber;
    }

    public void setStaffPhonenumber(String staffPhoneNumber) {
        this.staffPhonenumber = staffPhoneNumber;
    }

    public String getStaffEmail() {
        return staffEmail;
    }

    public void setStaffEmail(String staffEmail) {
        this.staffEmail = staffEmail;
    }

    public String getStaffAddress() {
        return staffAddress;
    }

    public void setStaffAddress(String staffAddress) {
        this.staffAddress = staffAddress;
    }

    public String getSearchContent() {
        return searchContent;
    }

    public void setSearchContent(String searchContent) {
        this.searchContent = searchContent;
    }

    public List<TrainingStaff> getListStaff() {
        return listStaff;
    }

    public void setListStaff(List<TrainingStaff> listStaff) {
        this.listStaff = listStaff;
    }

    public StaffAction() {
    }

    public String getData() {
        TrainingStaffDataProcess trainingStaffDataProcess = new TrainingStaffDataProcess();
        listStaff = trainingStaffDataProcess.getData();
        return "LISTSTAFF";
    }

    public String searchData() {
        TrainingStaffDataProcess trainingStaffDataProcess = new TrainingStaffDataProcess();
        listStaff = trainingStaffDataProcess.searchStaffByName(searchContent);
        return "LISTSEARCHSTAFF";
    }

    public String addStaff() {
        TrainingStaffDataProcess trainingStaffDataProcess = new TrainingStaffDataProcess();
        if (trainingStaffDataProcess.addTrainingStaff(staffID, password, staffName, staffDoB, staffAddress, staffPhonenumber, staffEmail)) {
            msg = "Successfully add new training staff";
            return "ADDSUCCESS";
        }
        msg = "Cannot add new training staff";
        return "ADDFAILED";
    }

    public String deleteStaff() {
        TrainingStaffDataProcess trainingStaffDataProcess = new TrainingStaffDataProcess();
        if (trainingStaffDataProcess.deleteTrainingStaff(staffID)) {
            msg = "Successfully delete staff";
            return "DELETESUCCESS";
        }
        msg = "Cannot delete staff";
        return "DELETEFAILED";
    }

    public String detailStaff() {
        TrainingStaffDataProcess trainingStaffDataProcess = new TrainingStaffDataProcess();
        staff = trainingStaffDataProcess.getDataByID(staffID);
        if (("Update").equals(action)) {
            return "DETAILSTAFFFORUPDATE";
        } else {
            return "DETAILSTAFF";
        }
    }

    public String updateStaff() {
        TrainingStaffDataProcess trainingStaffDataProcess = new TrainingStaffDataProcess();
        if (trainingStaffDataProcess.updateTrainingStaff(staffID, password, staffName, staffDoB, staffAddress, staffPhonenumber, staffEmail)) {
            msg = "Successfully Updated";
            return "UPDATESUCCESS";
        }
        msg = "Cannot update";
        return "UPDATEFAILED";
    }
}
