<%-- 
    Document   : AddNewCourse
    Created on : May 18, 2020, 3:06:32 AM
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
</script>
<html>
    <jsp:include page="header.jsp"/>
    <jsp:include page="navigationbar.jsp"/>
    <div class="table-content">        
        <a href="loadCourse.action" class="btn btn-sm btn-default" style="margin-left: 40px; margin-top: 20px; margin-bottom: -20px; font-size: 10px;">Back to main page</a>
        <form action="addNewCourse.action" method="POST">
            <table class="table table-responsive tbl">
                <thead class="table-responsive table-dark">
                    <!--                    <tr>
                                            <th><s:property value="msg"/></th>
                                        </tr>-->
                    <tr>
                        <th colspan="4"><h4 style="text-align: center;">Add new course</h4></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td></td>
                        <td>Select topic</td>
                        <td>
                            <select name="sltTopic" id="sltTopic" id="sltTopic" onchange="loadTopicDetail1()">
                                <option value="">Select topic</option>
                                <s:iterator value="listTopic">
                                    <option value="<s:property value="topicID"/>" <s:if test="selectedTopic==topicID">selected</s:if>><s:property value="topicName"/></option>
                                </s:iterator>
                            </select>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Course ID</td>
                        <td>
                            <div id="displayCourseID">
                                <input type="text" id="courseID" name="courseID" style="width: 180px" readonly>
                            </div>
                        </td>                            
                        <td>Course Start Date</td>
                        <td>
                            <input type="date" name="courseStartDate" style="width: 180px"/>
                        </td> 
                    </tr>  
                    <tr>
                        <td>Course Name</td>
                        <td><input type="text" name="courseName" id="courseName" style="width: 180px" placeholder="Enter Course name"></td>
                        <td>Course End Date</td>
                        <td>
                            <input type="date" name="courseEndDate" style="width: 180px;"/>
                        </td> 
                    </tr>
                    <tr>
                        <td>Category</td>
                        <td>
                            <select name="sltCategory">
                                <option>Select Category</option>
                                <s:iterator value="listCategory">
                                    <option value="<s:property value="categoryID"/>"><s:property value="categoryName"/></option>
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
                                <textarea name="topicDescription" id="topicDescription" cols="86" rows="4" readonly="true"></textarea>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>Course Location</td>
                        <td colspan="3">
                            <textarea name="courseLocation" cols="86" rows="4" placeholder="Enter course Location"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>Course Content</td>
                        <td colspan="3">
                            <textarea name="courseContent" cols="86" rows="10" placeholder="Enter course content"></textarea>
                        </td>
                    </tr>
                    <tr style="text-align: center;">
                        <td colspan="4">
                            <input type="submit" value="Add new course" class="btn btn-success">
                            <input type="reset" value="Reset" class="btn btn-info">
                            <a href="loadCourse.action" class="btn btn-primary">Back</a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
    </div>
    <jsp:include page="footer.jsp"/>
</html>
