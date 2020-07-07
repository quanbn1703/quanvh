/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package App.ManageCourse;

import Entity.Category;
import Entity.Course;
import Entity.Topic;
import Entity.Trainee;
import Entity.Trainer;
import Model.CategoryDataProcess;
import Model.CourseDataProcess;
import Model.TopicDataProcess;
import Model.TraineeDataProcess;
import Model.TrainerDataProcess;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Ngoc Do Minh
 */
public class CourseAction extends ActionSupport {

    private List<Course> listCourse = new ArrayList<Course>();
    private List<Course> listCourse1 = new ArrayList<Course>();
    private List<Course> listTrainerCourse = new ArrayList<>();
    private String courseID;
    private String courseName;
    private String courseStartDate;
    private String courseEndDate;
    private String courseLocation;
    private String sltCategory;
    private String sltTrainer;
    private String courseContent;
    private String msg;
    private Course course;
    private Topic topic;
    private Category category;
    private Trainer trainer;
    private List<Topic> listTopic = new ArrayList<Topic>();
    private List<Category> listCategory = new ArrayList<Category>();
    private List<Trainee> listTraineeOuterCourse = new ArrayList<Trainee>();
    private List<Trainee> listTraineeInCourse = new ArrayList<Trainee>();
    private List<Trainer> listTrainerInTopic = new ArrayList<Trainer>();
    private String action;
    private String traineeID;
    private String selectedTopic;
    private String searchContent;

    public List<Course> getListTrainerCourse() {
        return listTrainerCourse;
    }

    public void setListTrainerCourse(List<Course> listTrainerCourse) {
        this.listTrainerCourse = listTrainerCourse;
    }

    
    public List<Trainer> getListTrainerInTopic() {
        return listTrainerInTopic;
    }

    public List<Course> getListCourse1() {
        return listCourse1;
    }

    public void setListCourse1(List<Course> listCourse1) {
        this.listCourse1 = listCourse1;
    }

    public void setListTrainerInTopic(List<Trainer> listTrainerInTopic) {
        this.listTrainerInTopic = listTrainerInTopic;
    }

    public String getSearchContent() {
        return searchContent;
    }

    public void setSearchContent(String searchContent) {
        this.searchContent = searchContent;
    }

    public String getSelectedTopic() {
        return selectedTopic;
    }

    public void setSelectedTopic(String selectedTopic) {
        this.selectedTopic = selectedTopic;
    }

    public String getTraineeID() {
        return traineeID;
    }

    public void setTraineeID(String traineeID) {
        this.traineeID = traineeID;
    }

    public List<Trainee> getListTraineeOuterCourse() {
        return listTraineeOuterCourse;
    }

    public void setListTraineeOuterCourse(List<Trainee> listTraineeOuterCourse) {
        this.listTraineeOuterCourse = listTraineeOuterCourse;
    }

    public List<Trainee> getListTraineeInCourse() {
        return listTraineeInCourse;
    }

    public void setListTraineeInCourse(List<Trainee> listTraineeInCourse) {
        this.listTraineeInCourse = listTraineeInCourse;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public Topic getTopic() {
        return topic;
    }

    public void setTopic(Topic topic) {
        this.topic = topic;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Trainer getTrainer() {
        return trainer;
    }

    public void setTrainer(Trainer trainer) {
        this.trainer = trainer;
    }

    public List<Topic> getListTopic() {
        return listTopic;
    }

    public void setListTopic(List<Topic> listTopic) {
        this.listTopic = listTopic;
    }

    public List<Category> getListCategory() {
        return listCategory;
    }

    public void setListCategory(List<Category> listCategory) {
        this.listCategory = listCategory;
    }

    public List<Course> getListCourse() {
        return listCourse;
    }

    public void setListCourse(List<Course> listCourse) {
        this.listCourse = listCourse;
    }

    public String getCourseID() {
        return courseID;
    }

    public void setCourseID(String courseID) {
        this.courseID = courseID;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getCourseStartDate() {
        return courseStartDate;
    }

    public void setCourseStartDate(String courseStartDate) {
        this.courseStartDate = courseStartDate;
    }

    public String getCourseEndDate() {
        return courseEndDate;
    }

    public void setCourseEndDate(String courseEndDate) {
        this.courseEndDate = courseEndDate;
    }

    public String getCourseLocation() {
        return courseLocation;
    }

    public void setCourseLocation(String courseLocation) {
        this.courseLocation = courseLocation;
    }

    public String getSltCategory() {
        return sltCategory;
    }

    public void setSltCategory(String sltCategory) {
        this.sltCategory = sltCategory;
    }

    public String getSltTrainer() {
        return sltTrainer;
    }

    public void setSltTrainer(String sltTrainer) {
        this.sltTrainer = sltTrainer;
    }

    public String getCourseContent() {
        return courseContent;
    }

    public void setCourseContent(String courseContent) {
        this.courseContent = courseContent;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public CourseAction() {
    }

    public String getData() throws Exception {
        CourseDataProcess courseDataProcess = new CourseDataProcess();
        listCourse = courseDataProcess.getData();
        return "DATA";
    }

    public String searchCourse() {
        CourseDataProcess courseDataProcess = new CourseDataProcess();
        listCourse1 = courseDataProcess.searchCourseByName(searchContent);
        return "SEARCHDATA";
    }

    public String getDetail() {
        CourseDataProcess courseDataProcess = new CourseDataProcess();
        course = courseDataProcess.getDatabyID(courseID);
        CategoryDataProcess categoryDataProcess = new CategoryDataProcess();
        category = categoryDataProcess.getDataByID(course.getCategoryID());
        TrainerDataProcess trainerDataProcess = new TrainerDataProcess();
        trainer = trainerDataProcess.getDataByID(course.getTrainerID());
        TopicDataProcess topicDataProcess = new TopicDataProcess();
        topic = topicDataProcess.getDataByID(trainer.getTopicID());
        TraineeDataProcess traineeDataProcess = new TraineeDataProcess();
        listTraineeInCourse = traineeDataProcess.getTraineeInCourse(courseID);
        if (("Update").equals(action)) {
            listCategory = categoryDataProcess.getData();
            listTopic = topicDataProcess.getData();
            listTrainerInTopic = topicDataProcess.getTrainerInTopic(trainer.getTopicID());
            selectedTopic = topic.getTopicName();
            return "COURSEDETAILFORUPDATE";
        }
        return "COURSEDETAILFORVIEW";
    }

    public String trainerGetDetailCourse() {
        CourseDataProcess courseDataProcess = new CourseDataProcess();
        course = courseDataProcess.getDatabyID(courseID);
        CategoryDataProcess categoryDataProcess = new CategoryDataProcess();
        category = categoryDataProcess.getDataByID(course.getCategoryID());
        TrainerDataProcess trainerDataProcess = new TrainerDataProcess();
        trainer = trainerDataProcess.getDataByID(course.getTrainerID());
        TopicDataProcess topicDataProcess = new TopicDataProcess();
        topic = topicDataProcess.getDataByID(trainer.getTopicID());
        TraineeDataProcess traineeDataProcess = new TraineeDataProcess();
        listTraineeInCourse = traineeDataProcess.getTraineeInCourse(courseID);
        return "COURSEDETAILFORVIEW";
    }

    public String deleteCourse() {
        CourseDataProcess courseDataProcess = new CourseDataProcess();
        if (!courseDataProcess.deleteCourse(courseID)) {
            msg = "Cannot delete course";
            return "DELETEFAILED";
        }
        msg = "Successfully delete";
        return "DELETED";
    }

    public String loadTopicAndCategory() {
        CategoryDataProcess categoryDataProcess = new CategoryDataProcess();
        listCategory = categoryDataProcess.getData();
        TopicDataProcess topicDataProcess = new TopicDataProcess();
        listTopic = topicDataProcess.getData();
        return "LISTCATEGORYANDTOPIC";
    }

    public String loadTopicDetail() {
        CourseDataProcess courseDataProcess = new CourseDataProcess();
        course = courseDataProcess.getDatabyID(courseID);

        return "TOPICDETAIL";
    }

    public String addCourse() {
        CourseDataProcess courseDataProcess = new CourseDataProcess();
        if (courseDataProcess.addCourse(courseID, courseName, courseStartDate, courseEndDate, courseLocation, sltCategory, sltTrainer, courseContent)) {
            msg = "Add new course success";
            return "ADDCOURSESUCCESS";
        }
        msg = "Cannot add new course";
        return "ADDCOURSEFAILED";
    }

    public String updateCourse() {
        CourseDataProcess courseDataProcess = new CourseDataProcess();
        if (courseDataProcess.updateCourse(courseID, courseName, courseStartDate, courseEndDate, courseLocation, sltCategory, sltTrainer, courseContent)) {
            courseDataProcess.updateCourseStatus(courseID);
            msg = "Successfully update";
            return "UPDATECOURSESUCCESS";
        }
        msg = "Cannot update";
        return "UPDATECOURSEFAILED";
    }

    public String loadTraineeAssign() {
        TraineeDataProcess traineeDataProcess = new TraineeDataProcess();
        listTraineeOuterCourse = traineeDataProcess.getTraineeOutCourse(courseID);
        listTraineeInCourse = traineeDataProcess.getTraineeInCourse(courseID);
        if (("searchOut").equals(action)) {
            listTraineeOuterCourse = traineeDataProcess.searchTraineeInList(searchContent, listTraineeOuterCourse);
        } else if (("searchIn").equals(action)) {
            listTraineeInCourse = traineeDataProcess.searchTraineeInList(searchContent, listTraineeInCourse);
        }
        return "LOADASSIGNFORM";
    }

    public String assignTrainee() {
        TraineeDataProcess traineeDataProcess = new TraineeDataProcess();
        if (traineeDataProcess.assignTraineeToCourse(courseID, traineeID)) {
            (new CourseDataProcess()).updateCourseStatus(courseID);
            return "ASSIGNSUCCESS";
        }
        return "ASSIGNFAILED";
    }

    public String removeTraineeFromCourse() {
        TraineeDataProcess traineeDataProcess = new TraineeDataProcess();
        if (traineeDataProcess.removeTraineeFromCourse(courseID, traineeID)) {
            return "REMOVESUCCESS";
        }
        return "REMOVEFAILED";
    }
    public String trainerSearchCourse()
    {
        CourseDataProcess courseDataProcess = new CourseDataProcess();
        listTrainerCourse = courseDataProcess.trainerSearchCourse(sltTrainer, searchContent);
        return "SEARCHDATA";
    }
}
