<%-- 
    Document   : AssignTraineeToCourse
    Created on : May 20, 2020, 11:10:01 AM
    Author     : Ngoc Do Minh
--%>

<%@taglib prefix="s" uri="/struts-tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<style>
    .table-content {
        width: 500px;
        margin: 50px auto;
        text-align: center;
        border: 1px solid black;
    }

    td {
        width: 100px;
    }
    .table-content {
        width: 1000px;
        margin: 50px auto;
        text-align: center;
        border: 1px solid black;
    }

    td {
        width: 100px;
    }
    .search51{
        background: url(data:image/png;base64,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) no-repeat 10px 6px #fcfcfc;
        border:1px solid #d1d1d1;
        font: bold 12px Arial, Helvetica, Sans-serif;
        color:#bebebe;
        width:160px;
        padding:6px 15px 6px 35px;
        border-radius:20px;
        text-shadow:0 2px 3px rgba(0,0,0,0.1);
        box-shadow:0 1px 3px rgba(0,0,0,0.15) inset;
        -webkit-transition: all 0.7s ease 0s;
    }

    .search51:focus{
        width:200px;
        outline:0;
    }
</style>
<script type="text/javascript">
    function confirm_Assign()
    {
        return confirm("Do you want to assign this trainee to course?");
    }
    function confirm_Delete()
    {
        return confirm("Do you want to remove this trainee from course?");
    }
    function getTraineeOutCourse()
    {
        $("#searchOutCourse").keyup(function () {
            var x = document.getElementById("searchOutCourse").value;
            var courseID = document.getElementById("courseID").value;
            if (x !== '')
            {
                $.ajax({
                    type: "POST",
                    url: "searchTraineeOutCourse.action?courseID=" + courseID + "&searchContent=" + x,
                    success: function (itr) {
                        var dataTable = "";
                        $.each(itr['searchList'], function () {
                            dataTable += "<tr>";
                            dataTable += "<td>" + this['traineeID'] + "</td>";
                            dataTable += "<td>" + this['traineeName'] + "</td>";
                            dataTable += "<td><a class='btn btn-info btn-block' href='#'/>Detail</a></td>";
                            dataTable += "<td><a class='btn btn-primary btn-block' href='assignTraineeToCourse.action?courseID=" + courseID + "&traineeID=" + this['traineeID'] + "' onclick='return confirm_Assign()'/>Assign</a></td>";
                            dataTable += "</tr>";
                        });
                        $("#displayOutCourse").html(dataTable);
                    },
                    error: function () {
                        var dataTable = "<tr><td colspan='9'>No data found</td></tr>";
                        dataTable += "<tr><td colspan='9'><a href='loadAddNewCategory' class='btn btn-info'>Add</a></td></tr>";
                        $("#display").html(dataTable);
                    }
                });
            } else
            {
                $.ajax({
                    type: "POST",
                    url: "fetchTraineeOutCourse.action",
                    success: function (itr) {
                        var dataTable = "";
                        $.each(itr['listTrainee'], function () {
                            dataTable += "<tr>";
                            dataTable += "<td>" + this['traineeID'] + "</td>";
                            dataTable += "<td>" + this['traineeName'] + "</td>";
                            dataTable += "<td><a class='btn btn-info btn-block' href='#'/>Detail</a></td>";
                            dataTable += "<td><a class='btn btn-primary btn-block' href='assignTraineeToCourse.action?courseID=" + courseID + "&traineeID=" + this['traineeID'] + "' onclick='return confirm_Assign()'/>Assign</a></td>";
                            dataTable += "</tr>";
                        });
                        $("#displayOutCourse").html(dataTable);
                    },
                    error: function () {
                        var dataTable = "<tr><td colspan='9'>No data found</td></tr>";
                        dataTable += "<tr><td colspan='9'><a href='loadAddNewCategory' class='btn btn-info'>Add</a></td></tr>";
                        $("#display").html(dataTable);
                    }
                });
            }
        });
    };
    function getTraineeInCourse()
    {
        $("#searchInCourse").keyup(function () {
            var x = document.getElementById("searchInCourse").value;
            var courseID = document.getElementById("courseID").value;
            if (x !== '')
            {
                $.ajax({
                    type: "POST",
                    url: "searchTraineeInCourse.action?courseID=" + courseID + "&searchContent=" + x,
                    success: function (itr) {
                        var dataTable = "";
                        $.each(itr['searchList'], function () {
                            dataTable += "<tr>";
                            dataTable += "<td>" + this['traineeID'] + "</td>";
                            dataTable += "<td>" + this['traineeName'] + "</td>";
                            dataTable += "<td><a class='btn btn-info btn-block' href='#'/>Detail</a></td>";
                            dataTable += "<td><a class='btn btn-primary btn-block' href='assignTraineeToCourse.action?courseID=" + courseID + "&traineeID=" + this['traineeID'] + "' onclick='return confirm_Assign()'/>Assign</a></td>";
                            dataTable += "</tr>";
                        });
                        $("#displayInCourse").html(dataTable);
                    },
                    error: function () {
                        var dataTable = "<tr><td colspan='9'>No data found</td></tr>";
                        dataTable += "<tr><td colspan='9'><a href='loadAddNewCategory' class='btn btn-info'>Add</a></td></tr>";
                        $("#displayInCourse").html(dataTable);
                    }
                });
            } else
            {
                $.ajax({
                    type: "POST",
                    url: "fetchTraineeInCourse.action",
                    success: function (itr) {
                        var dataTable = "";
                        $.each(itr['listTrainee'], function () {
                            dataTable += "<tr>";
                            dataTable += "<td>" + this['traineeID'] + "</td>";
                            dataTable += "<td>" + this['traineeName'] + "</td>";
                            dataTable += "<td><a class='btn btn-info btn-block' href='#'/>Detail</a></td>";
                            dataTable += "<td><a class='btn btn-primary btn-block' href='assignTraineeToCourse.action?courseID=" + courseID + "&traineeID=" + this['traineeID'] + "' onclick='return confirm_Assign()'/>Assign</a></td>";
                            dataTable += "</tr>";
                        });
                        $("#displayInCourse").html(dataTable);
                    },
                    error: function () {
                        var dataTable = "<tr><td colspan='9'>No data found</td></tr>";
                        dataTable += "<tr><td colspan='9'><a href='loadAddNewCategory' class='btn btn-info'>Add</a></td></tr>";
                        $("#displayInCourse").html(dataTable);
                    }
                });
            }
        });
    }
</script>
<html>
    <jsp:include page="header.jsp"/>
    <jsp:include page="navigationbar.jsp"/>
    <div style="text-align: center;">
        <h3>Assign trainee to course: <s:property value="courseID"/></h3>
        <input type="hidden" name="courseID" id="courseID" value="<s:property value="courseID"/>"/>
    </div>
    <div class="row">
        <div class="col-md-1 col-lg-1 col-sm-1"></div>
        <div class="table-content col-md-4 col-lg-4 col-sm-4">
            <table class="table table-borded table-responsive table-striped ">
                <thead class="table-responsive table-dark">                    
                    <tr>
                        <td colspan="4"><h4>Trainee out course</h4></td>
                    </tr>
                    <tr style="text-align: left;">
                        <td colspan="4">
                            <input class="search51" id="searchOutCourse" name="searchContent" type="text" size="50" placeholder="Search by name" onkeyup="getTraineeOutCourse();"/>
                        </td>
                    </tr>
                </thead>
                <thead class="table-responsive table-dark">
                    <tr>
                        <td>Trainee ID</td>
                        <td>Trainee Name</td>
                        <td colspan="2">Action</td>
                    </tr>
                </thead>
                <tbody id="displayOutCourse">
                    <s:if test="listTraineeOuterCourse.size() == 0">
                        <tr>
                            <td colspan="4">No student found</td>
                        </tr>
                    </s:if>
                    <s:else>
                        <s:iterator value="listTraineeOuterCourse">
                            <tr>
                                <td><s:property value="traineeID"/></td>
                                <td><s:property value="traineeName"/></td>
                                <td><a class="btn btn-info btn-block" href="#"/>Detail</a></td>
                                <td><a id="btnAssign" class="btn btn-primary btn-block" href="assignTraineeToCourse.action?courseID=<s:property value="courseID"/>&traineeID=<s:property value="traineeID"/>" onclick="return confirm_Assign()"/>Assign</a></td>
                            </tr>
                        </s:iterator>
                    </s:else>
                </tbody>
            </table>
        </div>
        <div class="col-md-2 col-lg-2 col-sm-2"></div>
        <div class="table-content col-md-4 col-lg-4 col-sm-4">
            <table class="table table-borded table-responsive table-striped ">
                <thead class="table-responsive table-dark">
                    <tr>
                        <td colspan="4"><h4>Trainee in course</h4></td>
                    </tr>
                    <tr style="text-align: left;">
                        <td colspan="4">
                            <input class="search51" id="searchInCourse" name="searchContent" type="text" size="50" placeholder="Search by name" onkeyup="getTraineeInCourse();"/>
                        </td>
                    </tr>
                </thead>
                <thead class="table-responsive table-dark">
                    <tr>
                        <td>Trainee ID</td>
                        <td>Trainee Name</td>
                        <td colspan="2">Action</td>
                    </tr>
                </thead>
                <tbody id="displayInCourse">
                    <s:if test="listTraineeInCourse.size() == 0">
                        <tr>
                            <td colspan="4">No student in course</td>
                        </tr>
                    </s:if>
                    <s:else>
                        <s:iterator value="listTraineeInCourse">
                            <tr>
                                <td><s:property value="traineeID"/></td>
                                <td><s:property value="traineeName"/></td>
                                <td><a class="btn btn-info btn-block" href="#"/>Detail</a></td>
                                <td><a class="btn btn-primary btn-danger btn-block" href="removeTraineeFromCourse.action?courseID=<s:property value="courseID"/>&traineeID=<s:property value="traineeID"/>" onclick="return confirm_Delete()">Remove</a></td>
                            </tr>
                        </s:iterator>
                    </s:else>
                </tbody>
            </table>
        </div>
        <div class="col-md-1 col-lg-1 col-sm-1"></div>
    </div>
    <div style="text-align: center;">
        <a href="loadCourse.action" class="btn btn-success">Save</a>
    </div>
    <jsp:include page="footer.jsp"/>
</html>
