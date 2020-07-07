/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package App.ManageTopic;

import Entity.Category;
import Entity.Course;
import Entity.Topic;
import Entity.Trainer;
import Model.CategoryDataProcess;
import Model.CourseDataProcess;
import Model.TopicDataProcess;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Ngoc Do Minh
 */
public class TopicAction extends ActionSupport {
    private String topicID;
    private String topicName;
    private String courseID;
    private String action;
    private String topicDescription;
    private List<Topic> listTopic = new ArrayList<Topic>();
    private List<Topic> listTopic1 = new ArrayList<Topic>();
    private List<Category> listCategory = new ArrayList<Category>();
    private Topic topic;
    private Course course;
    private String selectedTopic;
    private String searchContent;
    private String msg;

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getSearchContent() {
        return searchContent;
    }

    public void setSearchContent(String searchContent) {
        this.searchContent = searchContent;
    }
    
    public List<Topic> getListTopic1() {
        return listTopic1;
    }

    public void setListTopic1(List<Topic> listTopic1) {
        this.listTopic1 = listTopic1;
    }
    

    public String getTopicName() {
        return topicName;
    }

    public void setTopicName(String topicName) {
        this.topicName = topicName;
    }

    public String getSelectedTopic() {
        return selectedTopic;
    }

    public void setSelectedTopic(String selectedTopic) {
        this.selectedTopic = selectedTopic;
    }
    private List<Trainer> listTrainer = new ArrayList<Trainer>();

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public String getCourseID() {
        return courseID;
    }

    public void setCourseID(String courseID) {
        this.courseID = courseID;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public List<Category> getListCategory() {
        return listCategory;
    }

    public void setListCategory(List<Category> listCategory) {
        this.listCategory = listCategory;
    }
    
    public Topic getTopic() {
        return topic;
    }

    public void setTopic(Topic topic) {
        this.topic = topic;
    }

    public List<Trainer> getListTrainer() {
        return listTrainer;
    }

    public void setListTrainer(List<Trainer> listTrainer) {
        this.listTrainer = listTrainer;
    }

    public String getTopicID() {
        return topicID;
    }

    public void setTopicID(String topicID) {
        this.topicID = topicID;
    }

    public String getTopicDescription() {
        return topicDescription;
    }

    public void setTopicDescription(String topicDescription) {
        this.topicDescription = topicDescription;
    }

    public List<Topic> getListTopic() {
        return listTopic;
    }

    public void setListTopic(List<Topic> listTopic) {
        this.listTopic = listTopic;
    }
    
    public TopicAction() {
    }
    
    public String getData() throws Exception {
        TopicDataProcess topicDataProcess = new TopicDataProcess();
        listTopic = topicDataProcess.getData();
        return "TOPICLIST";
    }
    public String searchTopic()
    {
        TopicDataProcess topicDataProcess = new TopicDataProcess();
        listTopic1 = topicDataProcess.getDataByName(searchContent);
        return "SEARCHLIST";
    }
    public String getTopicDetailData()
    {
        CategoryDataProcess categoryDataProcess = new CategoryDataProcess();
        listCategory = categoryDataProcess.getData();
        TopicDataProcess topicDataProcess = new TopicDataProcess();
        topic = topicDataProcess.getDataByID(topicID);
        topicDescription = topic.getTopicDescription();
        listTopic = topicDataProcess.getData();
        listTrainer = topicDataProcess.getTrainerInTopic(topicID);
        CourseDataProcess courseDataProcess = new CourseDataProcess();
        courseID = courseDataProcess.generateCourseID(topic.getTopicName());
        selectedTopic = topicID;
        if (("Update").equals(action))
        {            
            course = courseDataProcess.getDatabyID(courseID);
            return "TOPICDETAILFORUPDATE";
        }
        return "TOPICDETAIL";
    }
    public String getTopicDetailData1()
    {
        TopicDataProcess topicDataProcess = new TopicDataProcess();
        topicDescription = topicDataProcess.getDataByID(topicID).getTopicDescription();
        if (("Update").equals(action))
        {
            return "TOPICDETAILFORUPDATE";
        }
        return "TOPICDETAIL";
    }
    
    public String addTopic()
    {
        TopicDataProcess topicDataProcess = new TopicDataProcess();
        if (topicDataProcess.addTopic(topicID, topicName, topicDescription))
        {
            msg = "Successfully add new topic";
            return "ADDSUCCESS";
        }
        msg = "Cannot add new topic";
        return "ADDFAILED";
    }
    public String updateTopic()
    {
        TopicDataProcess topicDataProcess = new TopicDataProcess();
        if (topicDataProcess.updateTopic(topicID, topicName, topicDescription))
        {
            msg = "Successfully updated";
            return "UPDATESUCCESS";
        }
        msg = "Cannot update topic";
        return "UPDATEFAILED";
    }
    public String deleteTopic()
    {
        TopicDataProcess topicDataProcess = new TopicDataProcess();
        if (topicDataProcess.deleteTopic(topicID))
        {
            msg = "Successfully deleted";
            return "DELETESUCCESS";
        }
        msg = "Cannot delete topic";
        return "DELETEFAILED";
    }
    public String loadAddNewTopic()
    {
        TopicDataProcess topicDataProcess = new TopicDataProcess();
        topicID = topicDataProcess.generateTopicID();
        return "LOADADDNEWTOPIC";
    }
}
