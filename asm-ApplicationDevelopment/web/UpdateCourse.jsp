<%-- 
    Document   : UpdateCourse
    Created on : May 18, 2020, 10:20:27 AM
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
    $(function () {
        $.datepicker.setDefaults({
            onClose: function (date, inst) {
                $("#courseStartDate").html(date);
            }
        });

        $("#courseStartDate").datepicker();
    });
    $(function () {
        $.datepicker.setDefaults({
            onClose: function (date, inst) {
                $("#courseEndDate").html(date);
            }
        });

        $("#courseEndDate").datepicker();
    });
    function loadTopicDetail1()
    {
        var topicID = document.getElementById("sltTopic").value;
        $.ajax({
            type: "GET",
            url: "loadTopicDetail.action?topicID=" + topicID,
            success: function (itr)
            {
                $("#displayCourseID").html("<input type='text' id='courseID' name='courseID' style='width: 180px' value=" + itr['courseID'] + " readonly>")
                var x = "<select name='sltTrainer' id='sltTrainer'>";
                var count = 0;
                $.each(itr['listTrainer'], function () {
                    x += "<option value='" + this['trainerID'] + "'>" + this['trainerName'] + "</option>";
                    count++;
                });
                if (count == 0)
                {
                    x += "<option>No trainer in topic</option>"
                }
                x += "</select>";
                $("#displayTrainer").html(x);
                $("#displayTopicDescription").html("<textarea name='topicDescription' id='topicDescription' cols='86' rows='4' readonly>" + itr['topicDescription'] + "</textarea>")
            }
        });
    }
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
        <form action="updateCourse.action" method="POST">
            <table class="table table-responsive tbl">
                <thead class="table-responsive table-dark">
                    <tr>
                        <th colspan="4"><h4 style="text-align: center;">Update course</h4></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td></td>
                        <td>Topic</td>
                        <td>
                            <select name="sltTopic" id="sltTopic" id="sltTopic" onchange="loadTopicDetail1()">
                                <option>Select topic</option>
                                <s:iterator value="listTopic">
                                    <option value="<s:property value="topicID"/>" <s:if test="topicID == trainer.topicID">selected</s:if>><s:property value="topicName"/></option>
                                </s:iterator>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Course ID</td>
                        <td>
                            <input type="text" id="courseID" name="courseID" style="width: 180px" readonly value="<s:property value="course.courseID"/>">
                        </td>
                        <td>Course Start Date</td>
                        <td>
                            <input type="text" name="courseStartDate" id="courseStartDate" class="datepicker" style="width: 180px;" value="<s:property value="course.courseStartDate"/>">
                        </td> 
                    </tr>  
                    <tr>
                        <td>Course Name</td>
                        <td><input type="text" name="courseName" style="width: 180px" value="<s:property value="course.courseName"/>"></td>
                        <td>Course End Date</td>
                        <td>
                            <input type="text" name="courseEndDate" id="courseEndDate" class="datepicker" style="width: 180px;" value="<s:property value="course.courseEndDate"/>"/>
                        </td> 
                    </tr>
                    <tr>
                        <td>Category</td>
                        <td>
                            <select name="sltCategory">
                                <option>Select Category</option>
                                <s:iterator var="i" value="listCategory">
                                    <option value="<s:property value="categoryID"/>" <s:if test="categoryID == course.categoryID">selected</s:if>><s:property value="categoryName"/></option>
                                </s:iterator>                                
                            </select>
                        </td>
                        <td>Trainer name:</td>
                        <td>
                            <div id = "displayTrainer">
                                <select name="sltTrainer" id="sltTrainer">
                                    <option>Select Trainer</option>
                                </select>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Topic Description
                        </td>
                        <td colspan="3">
                            <div id="displayTopicDescription">
                                <textarea name="topicDescription" id="topicDescription" cols="86" rows="4" readonly="true"><s:property value="topic.topicDescription"/></textarea>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>Course Location</td>
                        <td colspan="3">
                            <textarea name="courseLocation" cols="86" rows="4"><s:property value="course.courseLocation"/></textarea>
                        </td>                        
                    </tr>
                    <tr>
                        <td>Course Content</td>
                        <td colspan="3">
                            <textarea name="courseContent" cols="86" rows="10"><s:property value="course.courseContent"/></textarea>
                        </td>                        
                    </tr>
                    <tr style="text-align: center;">
                        <td colspan="4">
                            <input type="submit" value="Update" class="btn btn-success"/>
                            <a href="deleteCourse.action?courseID=<s:property value="course.courseID"/>" onclick="return confirm_click()" class="btn btn-danger">Delete</a>
                            <a href="loadAssignForm.action?courseID=<s:property value="course.courseID"/>" class="btn btn-info">Assign trainee to course</a>
                            <a href="loadCourse.action" class="btn btn-primary">Cancel</a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
    </div>
    <jsp:include page="footer.jsp"/>
</html>