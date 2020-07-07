/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package App.ManageTrainer;

import Entity.Course;
import Entity.Topic;
import Entity.Trainer;
import Model.TopicDataProcess;
import Model.TrainerDataProcess;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.List;
import org.apache.tomcat.jni.SSLContext;

/**
 *
 * @author Ngoc Do Minh
 */
public class TrainerAction extends ActionSupport {
    private List<Trainer> listTrainer;
    private String trainerID;
    private String trainerPassword;
    private String trainerAvatar;
    private String trainerName;
    private String trainerDoB;
    private String trainerAddress;
    private String trainerPhoneNumber;
    private String trainerEmail;
    private String trainerCertificate;
    private String trainerType;
    private String topicID;
    private String msg;
    private String url;
    private String action;
    private String username;
    private String topicName;
    private Trainer trainer;
    private String topicDescription;
    private List<Topic> topicList = new ArrayList<Topic>();
    private List<Course> listCourse = new ArrayList<Course>();

    public String getTopicDescription() {
        return topicDescription;
    }

    public void setTopicDescription(String topicDescription) {
        this.topicDescription = topicDescription;
    }

    public List<Topic> getTopicList() {
        return topicList;
    }

    public void setTopicList(List<Topic> topicList) {
        this.topicList = topicList;
    }

    public Trainer getTrainer() {
        return trainer;
    }

    public void setTrainer(Trainer trainer) {
        this.trainer = trainer;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public String getTopicName() {
        return topicName;
    }

    public void setTopicName(String topicName) {
        this.topicName = topicName;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public List<Course> getListCourse() {
        return listCourse;
    }

    public void setListCourse(List<Course> listCourse) {
        this.listCourse = listCourse;
    }

    public String getTrainerPassword() {
        return trainerPassword;
    }

    public void setTrainerPassword(String trainerPassword) {
        this.trainerPassword = trainerPassword;
    }
    

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getTrainerID() {
        return trainerID;
    }

    public void setTrainerID(String trainerID) {
        this.trainerID = trainerID;
    }

    public String getTrainerAvatar() {
        return trainerAvatar;
    }

    public void setTrainerAvatar(String trainerAvatar) {
        this.trainerAvatar = trainerAvatar;
    }

    public String getTrainerName() {
        return trainerName;
    }

    public void setTrainerName(String trainerName) {
        this.trainerName = trainerName;
    }

    public String getTrainerDoB() {
        return trainerDoB;
    }

    public void setTrainerDoB(String trainerDoB) {
        this.trainerDoB = trainerDoB;
    }

    public String getTrainerAddress() {
        return trainerAddress;
    }

    public void setTrainerAddress(String trainerAddress) {
        this.trainerAddress = trainerAddress;
    }

    public String getTrainerPhoneNumber() {
        return trainerPhoneNumber;
    }

    public void setTrainerPhoneNumber(String trainerPhoneNumber) {
        this.trainerPhoneNumber = trainerPhoneNumber;
    }

    public String getTrainerEmail() {
        return trainerEmail;
    }

    public void setTrainerEmail(String trainerEmail) {
        this.trainerEmail = trainerEmail;
    }

    public String getTrainerCertificate() {
        return trainerCertificate;
    }

    public void setTrainerCertificate(String trainerCertificate) {
        this.trainerCertificate = trainerCertificate;
    }

    public String getTrainerType() {
        return trainerType;
    }

    public void setTrainerType(String trainerType) {
        this.trainerType = trainerType;
    }

    public String getTopicID() {
        return topicID;
    }

    public void setTopicID(String topicID) {
        this.topicID = topicID;
    }
    

    public List<Trainer> getListTrainer() {
        return listTrainer;
    }

    public void setListTrainer(List<Trainer> listTrainer) {
        this.listTrainer = listTrainer;
    }
    
    public TrainerAction() {
    }
    
    public String getData() throws Exception {
        TrainerDataProcess trainerDataProcess = new TrainerDataProcess();
        listTrainer = trainerDataProcess.getData();
        return "TRAINERLIST";
    }
    
    public String getDataByID()
    {
        TrainerDataProcess trainerDataProcess = new TrainerDataProcess();
        trainer = trainerDataProcess.getDataByID(trainerID);
        TopicDataProcess topicDataProcess = new TopicDataProcess();
        topicName = topicDataProcess.getDataByID(trainer.getTopicID()).getTopicName();
        topicDescription = topicDataProcess.getDataByID(trainer.getTopicID()).getTopicDescription();
        if (("Update").equals(action))
        {
            topicList = topicDataProcess.getData();
            return "TRAINERDETAILFORUPDATE";
        }
        return "TRAINERDETAIL";
    }
    
    public String addTrainer()
    {
        TrainerDataProcess trainerDataProcess = new TrainerDataProcess();
        if (trainerDataProcess.addTrainer(trainerID, trainerPassword, trainerName, trainerDoB, trainerAddress, trainerPhoneNumber, trainerEmail, trainerCertificate, trainerType, topicID))
        {
            msg = "Successfully add new trainer";
            return "ADDTRAINERSUCCESS";
        }
        msg = "Cannot add new trainer";
        url = "viewTrainer.action";
        return "ADDTRAINERFAILED";
    }
    public String deleteTrainer()
    {
        TrainerDataProcess trainerDataProcess = new TrainerDataProcess();
        if (trainerDataProcess.deleteTrainer(trainerID))
        {
            msg = "Successfully delete trainer";
            return "DELETETRAINERSUCCESS";
        }
        msg = "Cannot delete trainer";
        url = "viewTrainer.action";
        return "DELETETRAINERFAILED";
    }
    
    public String updateTrainer()
    {
        TrainerDataProcess trainerDataProcess = new TrainerDataProcess();
        if (trainerDataProcess.updateTrainer(trainerID, trainerPassword, trainerName, trainerDoB, trainerAddress, trainerPhoneNumber, trainerEmail, trainerCertificate, trainerType, topicID))
        {
            msg = "Successfully updated";
            return "UPDATESUCCESS";
        }
        msg = "Cannot update trainer";
        return "UPDATEFAILED";
    }
    
    public String getTrainerCourse()
    {
        TrainerDataProcess trainerDataProcess = new TrainerDataProcess();
        username = trainerDataProcess.getDataByEmail(username).getTrainerID();
        topicID = trainerDataProcess.getDataByID(username).getTopicID();
        listCourse = trainerDataProcess.getTrainerCourse(username);
        TopicDataProcess topicDataProcess = new TopicDataProcess();
        topicName = topicDataProcess.getDataByID(topicID).getTopicName();
        return "LISTTRAINERCOURSE";
    }
}
