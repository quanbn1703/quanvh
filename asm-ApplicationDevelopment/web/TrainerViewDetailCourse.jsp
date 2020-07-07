<%-- 
    Document   : TrainerViewDetailCourse
    Created on : May 28, 2020, 3:58:29 PM
    Author     : Ngoc Do Minh
--%>

<%@taglib prefix="s" uri="/struts-tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
    .table-content {
        width: 900px;        
        margin: 50px auto;
        border: 1px solid black;
    }
    td {
        padding-left: -100px;
        width: 100px;
    }
    td select{
        width: 180px;
    }
    input {
        font-family: "Roboto", sans-serif;
        width: auto;
        height: 50%;
        border: 1;
        box-sizing: border-box;
        font-size: 14px;
    }
    .table-content .tbl
    {
        margin-left: 50px;
        width: 800px;
    }
</style>
<script type="text/javascript">
    function confirm_click()
    {
        return confirm("Do you want to delete? This action will not be recoverable");
    }
</script>
<html>
    <jsp:include page="header.jsp"/>
    <jsp:include page="navigationbar.jsp"/>
    <div class="table-content">
        <input type="button" value="Back to main page" style="margin-left: 40px; margin-top: 20px; margin-bottom: -20px; font-size: 10px;">
        <table class="table table-responsive tbl">
            <thead class="table-responsive table-dark">
                <tr>
                    <th colspan="4"><h4 style="text-align: center;">Course detail</h4></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Course ID</td>
                    <td><input type="text" name="courseID" style="width: 180px" value="<s:property value="course.getCourseID()"/>" readonly></td>
                    <td>Course Start Date</td>
                    <td>
                        <input type="text" name="courseStartDate" id="courseStartDate" value="<s:property value="course.getCourseStartDate()"/>" readonly style="width: 180px;">
                    </td> 
                </tr>  
                <tr>
                    <td>Course Name</td>
                    <td><input type="text" name="courseName" style="width: 180px" value="<s:property value="course.getCourseName()"/>" readonly></td>
                    <td>Course End Date</td>
                    <td>
                        <input type="text" name="courseEndDate" id="courseEndDate" value="<s:property value="course.getCourseEndDate()"/>" style="width: 180px;" readonly>
                    </td> 
                </tr>
                <tr>
                    <td>Category</td>
                    <td>
                        <input type="text" name="categoryName" value="<s:property value="category.getCategoryName()"/>" style="width: 180px;" readonly>
                    </td>
                    <td>Topic</td>
                    <td>
                        <input type="text" name="topicName" value="<s:property value="topic.getTopicName()"/>" style="width: 180px;" readonly>
                    </td>
                </tr>
                <tr>
                    <td>
                        Topic Description
                    </td>
                    <td colspan="3">
                        <textarea name="topicDescription" cols="86" rows="4" readonly="true"><s:property value="topic.getTopicDescription()"/></textarea>
                    </td>
                </tr>
                <tr>
                    <td>Course Location</td>
                    <td colspan="3">
                        <textarea name="courseLocation" cols="86" rows="4"><s:property value="course.getCourseLocation()"/></textarea>
                    </td>                    
                </tr>
                <tr>
                    <td>Course Content</td>
                    <td colspan="3">
                        <textarea name="courseContent" cols="86" rows="10"><s:property value="course.getCourseContent()"/></textarea>
                    </td>
                </tr>                
                <tr style="text-align: center;">
                    <td colspan="4">                        
                        <a href="loadTrainerCourse.action?username=<s:property value="#session.username"/>"><button class="btn btn-primary">Back</button></a>                        
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <jsp:include page="footer.jsp"/>
</html>
