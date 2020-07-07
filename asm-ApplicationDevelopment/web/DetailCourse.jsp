<%-- 
    Document   : DetailCourse
    Created on : May 18, 2020, 6:45:32 AM
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
                    <td></td>
                    <td>Topic</td>
                    <td>
                        <input type="text" name="topicName" value="<s:property value="topic.getTopicName()"/>" style="width: 180px;" readonly>
                    </td>
                </tr>
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
                    <td>Trainer name:</td>
                    <td>
                        <a><input type="text" name="trainerName" value="<s:property value="trainer.getTrainerName()"/>"readonly style="width: 180px;"/></a>
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
                        <button type="button" class="btn btn-info btn-lg" style="width: 95%" data-toggle="modal" data-target="#detailCourse">Click here to view</button>
                    </td>
                </tr>
                <tr>
                    <td>Trainee in course</td>
                    <td colspan="3">
                        <button type="button" class="btn btn-info btn-lg" style="width: 95%" data-toggle="modal" data-target="#listTrainee">Click here to view</button>
                    </td>
                </tr>
                <tr style="text-align: center;">
                    <td colspan="4">
                        <a href="viewDetailCourse.action?action=Update&courseID=<s:property value="courseID"/>"><button class="btn btn-success">Update</button></a>
                        <a onclick="return confirm_click()" href="deleteCourse.action?courseID=<s:property value="course.getCourseID()"/>"><button class="btn btn-danger">Delete</button></a>
                        <a href="loadCourse.action"><button class="btn btn-primary">Back</button></a>
                        <a href="loadAssignForm.action?courseID=<s:property value="course.getCourseID()"/>"><button class="btn btn-info">Assign trainee to course</button></a>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <div class="modal fade" id="listTrainee" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">List trainee in <s:property value="courseName"/> course</h4>
                </div>
                <div class="modal-body">
                    <ol>
                        <s:if test="listTraineeInCourse.size() == 0">
                            <p>No data found</p>
                        </s:if>
                        <s:else>
                            <s:iterator value="listTraineeInCourse">
                                <li><s:property value="traineeName"/></li>
                                </s:iterator>
                            </s:else>
                    </ol>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>
    <div class="modal fade" id="detailCourse" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"><s:property value="courseName"/> course content</h4>
                </div>
                <div class="modal-body">
                    <textarea name="courseContent" cols="76" rows="10"><s:property value="course.getCourseContent()"/></textarea>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>
    <jsp:include page="footer.jsp"/>
</html>
