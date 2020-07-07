/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package App.Login;

import Entity.Trainer;
import Entity.TrainingStaff;
import Model.AccountDataProcess;
import Model.StaffDataProcess;
import Model.TrainerDataProcess;
import Model.TrainingStaffDataProcess;
import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author Ngoc Do Minh
 */
public class LoginAction extends ActionSupport implements SessionAware {

    SessionMap<String, Object> sessionMap;
    private String userID;
    private String username;
    private String password;
    private String userDoB;
    private String userAddress;
    private String userPhoneNumber;
    private String userCertificate;
    private String userType;
    private int role;
    private String msg;
    private String email;
    private TrainingStaff staff;
    private Trainer trainer;

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getUserDoB() {
        return userDoB;
    }

    public void setUserDoB(String userDoB) {
        this.userDoB = userDoB;
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }

    public String getUserPhoneNumber() {
        return userPhoneNumber;
    }

    public void setUserPhoneNumber(String userPhoneNumber) {
        this.userPhoneNumber = userPhoneNumber;
    }

    public String getUserCertificate() {
        return userCertificate;
    }

    public void setUserCertificate(String userCertificate) {
        this.userCertificate = userCertificate;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public TrainingStaff getStaff() {
        return staff;
    }

    public void setStaff(TrainingStaff staff) {
        this.staff = staff;
    }

    public Trainer getTrainer() {
        return trainer;
    }

    public void setTrainer(Trainer trainer) {
        this.trainer = trainer;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public LoginAction() {
    }

    public String login() throws Exception {
        String loggedUsername = null;
        String name = "";
        int loggedRoleInt = 0;
        if (sessionMap.containsKey("username")) {
            loggedUsername = (String) sessionMap.get("username");
            loggedRoleInt = (Integer) sessionMap.get("role");
        }
        if (loggedUsername != null) {
            if (loggedRoleInt == 1) {
                return "ADMIN";
            } else if (loggedRoleInt == 2) {
                return "STAFF";
            } else {
                return "TRAINER";
            }
        }
        boolean isLogin = false;
        String userID = "";
        String fullName = "";
        String DoB = "";
        String address = "";
        String phoneNumber = "";
        String certificate = "";
        String type = "";
        if (role == 1 || role == 2) {
            StaffDataProcess staffDataProcess = new StaffDataProcess();
            isLogin = staffDataProcess.checkLogin(username, password, role);
            name = staffDataProcess.getStaffName(username);
            staff = (new TrainingStaffDataProcess()).getDataByEmail(username);
            userID = staff.getStaffID();
            fullName = staff.getStaffName();
            DoB = staff.getStaffDoB();
            address = staff.getStaffAddress();
            phoneNumber = staff.getStaffPhonenumber();
        } else {
            TrainerDataProcess trainerDataProcess = new TrainerDataProcess();
            isLogin = trainerDataProcess.checkLogin(username, password);
            name = trainerDataProcess.getTrainerName(username);
            trainer = trainerDataProcess.getDataByEmail(username);
            userID = trainer.getTrainerID();
            fullName = trainer.getTrainerName();
            DoB = trainer.getTrainerDoB();
            address = trainer.getTrainerAddress();
            phoneNumber = trainer.getTrainerPhoneNumber();
            certificate = trainer.getTrainerCertificate();
            type = trainer.getTrainerType();
        }
        loggedUsername = username;
        if (isLogin) {
            sessionMap.put("userID", userID);
            sessionMap.put("username", username);
            sessionMap.put("name", name);
            sessionMap.put("role", role);
            sessionMap.put("fullName", fullName);
            sessionMap.put("password", password);
            sessionMap.put("address", address);
            sessionMap.put("phoneNumber", phoneNumber);
            sessionMap.put("DoB", DoB);
            if (role == 1) {
                return "ADMIN";
            } else if (role == 2) {
                return "STAFF";
            } else {
                sessionMap.put("certificate", certificate);
                sessionMap.put("type", type);
                return "TRAINER";
            }
        }
        msg = "Invalid username or password";
        return "FAILED";
    }

    public String logout() {
        sessionMap.invalidate();
        return "LOGGEDOUT";
    }

    public String sendPassword() {
        AccountDataProcess accountDataProcess = new AccountDataProcess();
        if (accountDataProcess.checkUser(email, role)) {
            if (accountDataProcess.updatePassword(email, role)) {
                msg = "Your password is sent. Please check your email";
                return "SUCCESS";
            } else {
                msg = "Cannot generate new password. Please try again";
                return "ERROR";
            }
        }
        msg = "Wrong email or username";
        return "FAILED";
    }

    @Override
    public void setSession(Map<String, Object> map) {
        sessionMap = (SessionMap) map;
        sessionMap.put("login", "true");
    }

    public String userUpdateProfile() {
        AccountDataProcess accountDataProcess = new AccountDataProcess();
        if (accountDataProcess.userUpdateProfile(userID, password, userDoB, userPhoneNumber, userAddress, userCertificate, userType, role)) {
            sessionMap.put("password", password);
            sessionMap.put("DoB", userDoB);
            sessionMap.put("phoneNumber", userPhoneNumber);
            sessionMap.put("address", userAddress);
            if (role == 3) {
                sessionMap.put("certificate", userCertificate);
                sessionMap.put("type", userType);
            }
            msg = "Successfully update profile";
            return "UPDATEPROFILESUCCESS";
        }
        msg = "Cannot update profile";
        return "UPDATEPROFILEFAILED";
    }
}
